# CUDA Solution
They said it would take from **70 days** to **1 year** to compute an answer for the 2nd part of the problem.

Here's my caffeine-fueled learned-by-doing solution that completes in about **90 minutes**. I developed and ran it on my GTX 660 with 960 CUDA cores.

My card with `compute_capability=3.0` is not supported anymore in CUDA 11, so I needed CUDA 10 and GCC <= 9. Compilation is run as follows:

```
$ nvcc -ccbin gcc63 -gencode arch=compute_30,code=compute_30 --optimize 3 2.cu -lstdc++
```
