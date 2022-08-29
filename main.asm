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
  
  cmp ecx, "sum"
  je L0
  cmp ecx, "sub"
  je L1
  cmp ecx, "mul"
  je L2
  cmp ecx, "div"
  je L3
  
L0:
  xor ecx, ecx
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
  int 80h
  
L1:
  xor ecx, ecx
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
  int 80h
  
L2:
  xor ecx, ecx
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
  
  mul ebx
  add eax, '0'
  int 80h
  
L3:
  xor ecx, ecx
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
  
  div ebx
  add eax, '0'
  int 80h
  
out:
  mov [res], eax
  print res, 10

exit:
  mov eax, 1
  int 0x80
