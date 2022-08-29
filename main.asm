;e
  %macro print 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1 ;msg
    mov edx, %2 ;len
    int 0x80
  %endmacro
  
section .bss
  uinp resw 10 ;as string
  x resb 10
  y resb 10
  res resb 1 
  
section .data
  out1 db 'input function:'
  len1 equ $-out1
  
section .data
  en1 dw 'x = ?'
  lene1 equ $-en1
  
  en2 dw 'y = ?'
  lene2 equ $-en2
  
section .text
  global _start
  
_start:
  print out1, len1
  mov eax, 3
  mov ebx, 0
  mov ecx, uinp ;test: sum, substract, multiply, divide
  mov edx, 10
  int 0x80
  
  cmp uinp, "sum"
  je L0
  cmp uinp, "sub"
  je L1
  cmp uinp, "mul"
  je L2
  cmp uinp, "div"
  je L3
  
    L0:
  print en1, lene1
  mov eax, 3
  mov ebx, 0
  mov ecx, x
  mov edx, 10
  int 0x80

  print en2, lene2
  mov eax, 3
  mov ebx, 0
  mov ecx, y
  mov edx, 10
  int 0x80

  mov eax, [x]
  sub eax, '0'
  mov ebx, [y]
  sub ebx, '0'

  add eax, ebx
  add eax, '0'
  
  
    L1:
  print en1, lene1
  mov eax, 3
  mov ebx, 0
  mov ecx, x
  mov edx, 10
  int 0x80

  print en2, lene2
  mov eax, 3
  mov ebx, 0
  mov ecx, y
  mov edx, 10
  int 0x80

  mov eax, [x]
  sub eax, '0'
  mov ebx, [y]
  sub ebx, '0'
  
  sub eax, ebx
  add eax, '0'
  
  
    L2:
  print en1, lene1
  mov eax, 3
  mov ebx, 0
  mov ecx, x
  mov edx, 10
  int 0x80

  print en2, lene2
  mov eax, 3
  mov ebx, 0
  mov ecx, y
  mov edx, 10
  int 0x80

  mov eax, [x]
  sub eax, '0'
  mov ebx, [y]
  sub ebx, '0'
  
  mul eax, ebx
  add eax, '0'
  
  
    L3:
  print en1, lene1
  mov eax, 3
  mov ebx, 0
  mov ecx, x
  mov edx, 10
  int 0x80

  print en2, lene2
  mov eax, 3
  mov ebx, 0
  mov ecx, y
  mov edx, 10
  int 0x80

  mov eax, [x]
  sub eax, '0'
  mov ebx, [y]
  sub ebx, '0'
  
  div eax, ebx
  add eax, '0'
  
out:
  mov [res], eax
  print res, 10

exit:
  mov eax, 1
  int 0x80
