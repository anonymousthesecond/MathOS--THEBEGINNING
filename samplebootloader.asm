; Basic bootloader for x86 architecture (emulator compatible)

; Define memory organization (adjust if needed)
org 0x7C00  ; Bootloader loaded at address 0x7C00 by emulator

jmp start   ; Jump to the start of the bootloader code

times 510-($ - $$) db 0 ; Pad the remaining bytes with zeros

start:
    ; Load kernel segment register
    mov ax, 0x1000 ; Segment selector for kernel code (adjust if needed)
    mov ds, ax     ; Set DS register to the kernel segment

    ; Load linear address of the kernel image (modify as needed)
    mov eax, 0x8000 ; Assuming kernel image starts at 0x8000 (adjust)

    ; Load kernel image into memory
    mov ebx, 0x1000 ; Size of the kernel image (adjust) ; (modify as needed)
    cld             ; Clear direction flag for string instructions
    rep movsb        ; Repeatedly move bytes from source to destination

    ; Jump to the kernel entry point (modify as needed)
    jmp $     ; Assuming kernel entry point is at the beginning of the kernel image

times 512-($ - $$) db 0 ; Pad the remaining bytes with zeros
