SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .data

section .bss

section .text
  global _start
  
_start:

exit:
  mov eax, SYS_EXIT   
  xor ebx, ebx 
  int 80h
