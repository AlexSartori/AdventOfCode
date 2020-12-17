#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <cuda.h>

#define MAX_IDS 1000
#define CUDA_BLOCKS 30
#define CUDA_THREADS 32
#define CUDA_STRIDE 1e9L

#define gpuErrchk(ans) { gpuAssert((ans), __FILE__, __LINE__); }
inline void gpuAssert(cudaError_t code, char *file, int line, bool abort=true) {
   if (code != cudaSuccess) {
      fprintf(stderr,"\nGPUassert: %s %s %d\n", cudaGetErrorString(code), file, line);
      if (abort) exit(code);
   }
}


__global__
void cuda_work(int* IDs, int nIDs, long long start, long long increment, int offset, long long* solution) {
  long long int start_t = start + (blockIdx.x * blockDim.x + threadIdx.x) * CUDA_STRIDE;
  long long int end_t = start_t + CUDA_STRIDE;
  long long t = start_t - (start_t % increment);

  while (*solution == -1 && t < end_t) {
	if (t == 0)
	  t = increment;

	int i;
	for (i = 0; i < nIDs; i++)
      if (IDs[i] != 0 && (t-offset+i) % IDs[i] != 0)
        break;

	if (i == nIDs) {
      *solution = t - offset;
	  printf("\n\n!!! Thr. %dx%d found solution: %ld\n", threadIdx.x, blockIdx.x, *solution);
	}

    t += increment;
  }
}


int get_next_id(FILE *fp) {
  char id[20];
  int len = 0;

  while ((id[len]=fgetc(fp)) != ',' && id[len] != EOF)
    len++;
  id[len] = '\0';

  return len == 0 ? -1 : atoi(id);
}

int main() {
  int *IDs = (int*)malloc(sizeof(int)*MAX_IDS);
  int nIDs = 0;
  int increment = 1, offset = 0;
  long long *solution = (long long*)malloc(sizeof(long long));
  *solution = -1;

  FILE *f = fopen("input", "r");
  while (fgetc(f) != '\n') ;
  for (nIDs = 0; (IDs[nIDs] = get_next_id(f)) != -1; nIDs++)
    if (IDs[nIDs] - nIDs > increment) {
      increment = IDs[nIDs];
	  offset = nIDs;
	}

  int *d_IDs;
  long long *d_solution;
  gpuErrchk(cudaMalloc(&d_IDs, sizeof(int)*nIDs));
  gpuErrchk(cudaMalloc(&d_solution, sizeof(long long)));
  gpuErrchk(cudaMemcpy(d_IDs, IDs, sizeof(int)*nIDs, cudaMemcpyHostToDevice));
  gpuErrchk(cudaMemcpy(d_solution, solution, sizeof(long long), cudaMemcpyHostToDevice));


  long long int workload = CUDA_BLOCKS * CUDA_THREADS * CUDA_STRIDE;
  for (int stride_idx = 0; *solution == -1 && stride_idx < 1e15L/workload; stride_idx++) {
    long long start = workload * stride_idx;
    printf("Stride %d @ %ld B - c.a. %ld%\r", stride_idx, (long long)(start/1e9L), (long long)(start/1e13L));

	  cuda_work<<<CUDA_BLOCKS, CUDA_THREADS>>>(d_IDs, nIDs, start, increment, offset, d_solution);
    gpuErrchk(cudaGetLastError());
    gpuErrchk(cudaDeviceSynchronize());
    gpuErrchk(cudaMemcpy(solution, d_solution, sizeof(long long), cudaMemcpyDeviceToHost));
  }

  printf("\n\n>>> Solution: %ld\n", *solution);

  cudaFree(IDs);
  cudaFree(d_solution);
  free(IDs);
  free(solution);
}
