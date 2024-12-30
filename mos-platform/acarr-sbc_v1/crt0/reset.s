.include "imag.inc"

; Initialize the system from the reset vector.
.global __do_reset
.section .init.50,"axR",@progbits
__do_reset:
; Fix the D and I flags.
  cld
  cli
; Set up the initial 6502 stack pointer.
  ldx #$ff
  txs

.text
; IRQBRK handler.
.global _irqbrk
.section .text._irqbrk,"axR",@progbits
_irqbrk:
  cld                   ; Just in case.
  jmp irq               ; Jump to the user-supplied IRQ handler.

; Default IRQ and NMI handler if the user's program hasn't defined one.
.global _irq_default
.section .text._irq_default,"axR",@progbits
_irq_default:
  rti