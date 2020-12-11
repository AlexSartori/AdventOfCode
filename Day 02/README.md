Assemble with NASM:

`$ nasm -felf64 -g 1.s`


Link with LD:

`$ ld 1.s`


Execute (it will hang in the halt loop):

`$ ./a.out`


Or run with GDB and find the result in the `BP` register:

```
$ gdb a.out
  > run
  > <Ctrl-C>
  > print $bp
```
