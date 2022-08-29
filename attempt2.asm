SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .data
  msg1 db "x=? >>", 0xA,0xD 
  len1 equ $- msg1 

  msg2 db "y=? >>", 0xA,0xD 
  len2 equ $- msg2 

  msg3 db "output: "
  len3 equ $- msg3
  
section .bss

section .text
  global _start
  
_start:

exit:
  mov eax, SYS_EXIT   
  xor ebx, ebx 
  int 80h
