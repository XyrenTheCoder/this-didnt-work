;e
  %macro print 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1 ;msg
    mov edx, %2 ;len
    int 0x80
  %endmacro
  
  %macro input 1
    mov eax, 3
    mov ebx, 2
    mov ecx, %1 ;input
    mov edx, 5
    int 0x80
   
  %macro exit 0
    mov eax, 1
    int 0x80
  %endmacro
  
section .bss
  uinp resb 7
  
section .data
  out1 db 'input function:'
  len1 equ $-out1
  
section .text
  global _start
  
_start:
  print out1, len1
  input
