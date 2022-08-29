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
  num1 resb 2 
  num2 resb 2 
  res resb 1 
  
section .text
  global _start
  
_start:
  mov eax, SYS_WRITE         
  mov ebx, STDOUT         
  mov ecx, msg1         
  mov edx, len1 
  int 0x80  
  
  mov eax, SYS_READ 
  mov ebx, STDIN  
  mov ecx, num1 
  mov edx, 2
  int 0x80            

  mov eax, SYS_WRITE        
  mov ebx, STDOUT
  mov ecx, msg2          
  mov edx, len2         
  int 0x80

  mov eax, SYS_READ  
  mov ebx, STDIN  
  mov ecx, num2 
  mov edx, 2
  int 0x80        

  mov eax, SYS_WRITE        
  mov ebx, STDOUT         
  mov ecx, msg3          
  mov edx, len3         
  int 0x80
  
exit:
  mov eax, SYS_EXIT   
  xor ebx, ebx 
  int 80h
