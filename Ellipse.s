	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	__ZN3map6shapes7EllipseC2ENS_5PointEiiONS1_4DataE ; -- Begin function _ZN3map6shapes7EllipseC2ENS_5PointEiiONS1_4DataE
	.p2align	2
__ZN3map6shapes7EllipseC2ENS_5PointEiiONS1_4DataE: ; @_ZN3map6shapes7EllipseC2ENS_5PointEiiONS1_4DataE
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
; %bb.0:
	sub	sp, sp, #176
	.cfi_def_cfa_offset 176
	stp	x29, x30, [sp, #160]            ; 16-byte Folded Spill
	add	x29, sp, #160
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, __ZTVN3map6shapes7EllipseE@PAGE
	add	x8, x8, __ZTVN3map6shapes7EllipseE@PAGEOFF
	add	x8, x8, #16
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	stur	d0, [x29, #-16]
	stur	d1, [x29, #-8]
	stur	x0, [x29, #-24]
	stur	w1, [x29, #-28]
	stur	w2, [x29, #-32]
	stur	x3, [x29, #-40]
	ldur	x8, [x29, #-24]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	ldur	q0, [x29, #-16]
	stur	q0, [x29, #-64]
	ldur	x8, [x29, #-40]
	ldr	w9, [x8]
	stur	w9, [x29, #-72]
	ldrh	w8, [x8, #4]
	sturh	w8, [x29, #-68]
	ldur	x8, [x29, #-40]
	ldr	w8, [x8, #8]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	add	x0, sp, #64
	str	x0, [sp, #32]                   ; 8-byte Folded Spill
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1B6v15006Ev
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldr	w2, [sp, #28]                   ; 4-byte Folded Reload
	ldr	x3, [sp, #32]                   ; 8-byte Folded Reload
	ldur	d0, [x29, #-64]
	ldur	d1, [x29, #-56]
	ldur	w8, [x29, #-72]
	str	w8, [sp, #56]
	ldurh	w8, [x29, #-68]
	strh	w8, [sp, #60]
	ldr	x1, [sp, #56]
Ltmp0:
	bl	__ZN3map6shapes5ShapeC2ENS_5PointENS_3clr3RGBEiNSt3__16vectorIS2_NS5_9allocatorIS2_EEEE
Ltmp1:
	b	LBB0_1
LBB0_1:
	add	x0, sp, #64
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED1B6v15006Ev
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	str	x8, [x0]
	ldur	w8, [x29, #-28]
	str	w8, [x0, #64]
	ldur	w8, [x29, #-32]
	str	w8, [x0, #68]
	ldur	x8, [x29, #-40]
	ldrb	w8, [x8, #6]
	mov	w9, #1
	and	w8, w8, w9
	strb	w8, [x0, #72]
	ldur	x8, [x29, #-40]
	ldrb	w8, [x8, #7]
	and	w8, w8, #0x1
	strb	w8, [x0, #73]
	ldur	x8, [x29, #-40]
	ldr	w8, [x8, #12]
	str	w8, [x0, #76]
	ldp	x29, x30, [sp, #160]            ; 16-byte Folded Reload
	add	sp, sp, #176
	ret
LBB0_2:
Ltmp2:
	mov	x8, x1
	str	x0, [sp, #48]
	str	w8, [sp, #44]
	add	x0, sp, #64
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED1B6v15006Ev
	b	LBB0_3
LBB0_3:
	ldr	x0, [sp, #48]
	bl	__Unwind_Resume
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table0:
Lexception0:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Ltmp0-Lfunc_begin0             ; >> Call Site 1 <<
	.uleb128 Ltmp1-Ltmp0                    ;   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp2-Lfunc_begin0             ;     jumps to Ltmp2
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp1-Lfunc_begin0             ; >> Call Site 2 <<
	.uleb128 Lfunc_end0-Ltmp1               ;   Call between Ltmp1 and Lfunc_end0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end0:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1B6v15006Ev ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1B6v15006Ev
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1B6v15006Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1B6v15006Ev
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1B6v15006Ev: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1B6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2B6v15006Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map6shapes5ShapeC2ENS_5PointENS_3clr3RGBEiNSt3__16vectorIS2_NS5_9allocatorIS2_EEEE ; -- Begin function _ZN3map6shapes5ShapeC2ENS_5PointENS_3clr3RGBEiNSt3__16vectorIS2_NS5_9allocatorIS2_EEEE
	.weak_def_can_be_hidden	__ZN3map6shapes5ShapeC2ENS_5PointENS_3clr3RGBEiNSt3__16vectorIS2_NS5_9allocatorIS2_EEEE
	.p2align	2
__ZN3map6shapes5ShapeC2ENS_5PointENS_3clr3RGBEiNSt3__16vectorIS2_NS5_9allocatorIS2_EEEE: ; @_ZN3map6shapes5ShapeC2ENS_5PointENS_3clr3RGBEiNSt3__16vectorIS2_NS5_9allocatorIS2_EEEE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x8, x1
	mov	x1, x3
	adrp	x9, __ZTVN3map6shapes5ShapeE@GOTPAGE
	ldr	x9, [x9, __ZTVN3map6shapes5ShapeE@GOTPAGEOFF]
	add	x9, x9, #16
	stur	d0, [x29, #-16]
	stur	d1, [x29, #-8]
	str	x8, [sp, #32]
	ldr	w8, [sp, #32]
	stur	w8, [x29, #-24]
	ldrh	w8, [sp, #36]
	sturh	w8, [x29, #-20]
	str	x0, [sp, #24]
	str	w2, [sp, #20]
	ldr	x8, [sp, #24]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	str	x9, [x8]
	ldur	q0, [x29, #-16]
	stur	q0, [x8, #8]
	ldur	w9, [x29, #-24]
	str	w9, [x8, #24]
	ldurh	w9, [x29, #-20]
	strh	w9, [x8, #28]
	ldr	w9, [sp, #20]
	str	w9, [x8, #32]
	add	x0, x8, #40
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1ERKS5_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED1B6v15006Ev ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED1B6v15006Ev
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED1B6v15006Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED1B6v15006Ev
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED1B6v15006Ev: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED1B6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED2B6v15006Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map6shapes7EllipseC1ENS_5PointEiiONS1_4DataE ; -- Begin function _ZN3map6shapes7EllipseC1ENS_5PointEiiONS1_4DataE
	.p2align	2
__ZN3map6shapes7EllipseC1ENS_5PointEiiONS1_4DataE: ; @_ZN3map6shapes7EllipseC1ENS_5PointEiiONS1_4DataE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	d0, [x29, #-16]
	stur	d1, [x29, #-8]
	str	x0, [sp, #24]
	str	w1, [sp, #20]
	str	w2, [sp, #16]
	str	x3, [sp, #8]
	ldr	x0, [sp, #24]
	str	x0, [sp]                        ; 8-byte Folded Spill
	ldr	w1, [sp, #20]
	ldr	w2, [sp, #16]
	ldr	x3, [sp, #8]
	ldur	d0, [x29, #-16]
	ldur	d1, [x29, #-8]
	bl	__ZN3map6shapes7EllipseC2ENS_5PointEiiONS1_4DataE
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map6shapes7Ellipse6rotateEd ; -- Begin function _ZN3map6shapes7Ellipse6rotateEd
	.p2align	2
__ZN3map6shapes7Ellipse6rotateEd:       ; @_ZN3map6shapes7Ellipse6rotateEd
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	d0, [sp]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK3map6shapes7Ellipse7rotatedEd ; -- Begin function _ZNK3map6shapes7Ellipse7rotatedEd
	.p2align	2
__ZNK3map6shapes7Ellipse7rotatedEd:     ; @_ZNK3map6shapes7Ellipse7rotatedEd
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x8, [sp]                        ; 8-byte Folded Spill
	stur	x8, [x29, #-8]
	stur	x0, [x29, #-16]
	str	d0, [sp, #24]
	ldur	x0, [x29, #-16]
	add	x8, sp, #16
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNSt3__111make_uniqueB6v15006IN3map6shapes7EllipseEJRKS3_EEENS_11__unique_ifIT_E15__unique_singleEDpOT0_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006INS2_7EllipseENS4_IS8_EEvvEEONS0_IT_T0_EE
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEED1B6v15006Ev
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__111make_uniqueB6v15006IN3map6shapes7EllipseEJRKS3_EEENS_11__unique_ifIT_E15__unique_singleEDpOT0_ ; -- Begin function _ZNSt3__111make_uniqueB6v15006IN3map6shapes7EllipseEJRKS3_EEENS_11__unique_ifIT_E15__unique_singleEDpOT0_
	.globl	__ZNSt3__111make_uniqueB6v15006IN3map6shapes7EllipseEJRKS3_EEENS_11__unique_ifIT_E15__unique_singleEDpOT0_
	.weak_definition	__ZNSt3__111make_uniqueB6v15006IN3map6shapes7EllipseEJRKS3_EEENS_11__unique_ifIT_E15__unique_singleEDpOT0_
	.p2align	2
__ZNSt3__111make_uniqueB6v15006IN3map6shapes7EllipseEJRKS3_EEENS_11__unique_ifIT_E15__unique_singleEDpOT0_: ; @_ZNSt3__111make_uniqueB6v15006IN3map6shapes7EllipseEJRKS3_EEENS_11__unique_ifIT_E15__unique_singleEDpOT0_
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x8, [sp]                        ; 8-byte Folded Spill
	stur	x8, [x29, #-8]
	stur	x0, [x29, #-16]
	mov	x0, #80
	bl	__Znwm
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldur	x1, [x29, #-16]
Ltmp4:
	bl	__ZN3map6shapes7EllipseC1ERKS1_
Ltmp5:
	b	LBB7_1
LBB7_1:
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEEC1B6v15006ILb1EvEEPS3_
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB7_2:
Ltmp6:
	mov	x9, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	mov	x8, x1
	str	x9, [sp, #24]
	str	w8, [sp, #20]
	bl	__ZdlPv
	b	LBB7_3
LBB7_3:
	ldr	x0, [sp, #24]
	bl	__Unwind_Resume
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table7:
Lexception1:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Lfunc_begin1-Lfunc_begin1      ; >> Call Site 1 <<
	.uleb128 Ltmp4-Lfunc_begin1             ;   Call between Lfunc_begin1 and Ltmp4
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp4-Lfunc_begin1             ; >> Call Site 2 <<
	.uleb128 Ltmp5-Ltmp4                    ;   Call between Ltmp4 and Ltmp5
	.uleb128 Ltmp6-Lfunc_begin1             ;     jumps to Ltmp6
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp5-Lfunc_begin1             ; >> Call Site 3 <<
	.uleb128 Lfunc_end1-Ltmp5               ;   Call between Ltmp5 and Lfunc_end1
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end1:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006INS2_7EllipseENS4_IS8_EEvvEEONS0_IT_T0_EE ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006INS2_7EllipseENS4_IS8_EEvvEEONS0_IT_T0_EE
	.weak_def_can_be_hidden	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006INS2_7EllipseENS4_IS8_EEvvEEONS0_IT_T0_EE
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006INS2_7EllipseENS4_IS8_EEvvEEONS0_IT_T0_EE: ; @_ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006INS2_7EllipseENS4_IS8_EEvvEEONS0_IT_T0_EE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	bl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006INS2_7EllipseENS4_IS8_EEvvEEONS0_IT_T0_EE
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEED1B6v15006Ev ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEED1B6v15006Ev
	.globl	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEED1B6v15006Ev
	.weak_def_can_be_hidden	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEED1B6v15006Ev
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEED1B6v15006Ev: ; @_ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEED1B6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEED2B6v15006Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map6shapes7Ellipse5shiftENS_5PointE ; -- Begin function _ZN3map6shapes7Ellipse5shiftENS_5PointE
	.p2align	2
__ZN3map6shapes7Ellipse5shiftENS_5PointE: ; @_ZN3map6shapes7Ellipse5shiftENS_5PointE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	d0, [x29, #-16]
	stur	d1, [x29, #-8]
	stur	x0, [x29, #-24]
	ldur	x8, [x29, #-24]
	ldur	q0, [x29, #-16]
	str	q0, [sp, #16]
	ldr	d0, [sp, #16]
	ldr	d1, [sp, #24]
	add	x0, x8, #8
	bl	__ZN3map5PointpLES0_
	str	d0, [sp]
	str	d1, [sp, #8]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map5PointpLES0_            ; -- Begin function _ZN3map5PointpLES0_
	.weak_definition	__ZN3map5PointpLES0_
	.p2align	2
__ZN3map5PointpLES0_:                   ; @_ZN3map5PointpLES0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #112
	.cfi_def_cfa_offset 112
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	d0, [x29, #-32]
	stur	d1, [x29, #-24]
	stur	x0, [x29, #-40]
	ldur	x0, [x29, #-40]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldur	q0, [x29, #-32]
	str	q0, [sp, #16]
	ldr	d0, [sp, #16]
	ldr	d1, [sp, #24]
	bl	__ZN3map5PointplES0_
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	str	d0, [sp, #40]
	str	d1, [sp, #48]
	ldur	q0, [sp, #40]
	str	q0, [x8]
	ldr	q0, [x8]
	stur	q0, [x29, #-16]
	ldur	d0, [x29, #-16]
	ldur	d1, [x29, #-8]
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK3map6shapes7Ellipse7shiftedENS_5PointE ; -- Begin function _ZNK3map6shapes7Ellipse7shiftedENS_5PointE
	.p2align	2
__ZNK3map6shapes7Ellipse7shiftedENS_5PointE: ; @_ZNK3map6shapes7Ellipse7shiftedENS_5PointE
Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception2
; %bb.0:
	sub	sp, sp, #112
	.cfi_def_cfa_offset 112
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	stur	x8, [x29, #-8]
	stur	d0, [x29, #-24]
	stur	d1, [x29, #-16]
	stur	x0, [x29, #-32]
	ldur	x0, [x29, #-32]
	mov	w8, #0
	and	w8, w8, #0x1
	and	w8, w8, #0x1
	sturb	w8, [x29, #-33]
	add	x8, sp, #48
	str	x8, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__111make_uniqueB6v15006IN3map6shapes7EllipseEJRKS3_EEENS_11__unique_ifIT_E15__unique_singleEDpOT0_
	ldr	x1, [sp]                        ; 8-byte Folded Reload
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006INS2_7EllipseENS4_IS8_EEvvEEONS0_IT_T0_EE
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEED1B6v15006Ev
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNKSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEptB6v15006Ev
	ldur	q0, [x29, #-24]
	str	q0, [sp, #32]
	ldr	d0, [sp, #32]
	ldr	d1, [sp, #40]
	ldr	x8, [x0]
	ldr	x8, [x8, #16]
Ltmp7:
	blr	x8
Ltmp8:
	b	LBB12_1
LBB12_1:
	mov	w8, #1
	and	w8, w8, #0x1
	and	w8, w8, #0x1
	sturb	w8, [x29, #-33]
	ldurb	w8, [x29, #-33]
	tbnz	w8, #0, LBB12_4
	b	LBB12_3
LBB12_2:
Ltmp9:
	mov	x9, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	mov	x8, x1
	str	x9, [sp, #24]
	str	w8, [sp, #20]
	bl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEED1B6v15006Ev
	b	LBB12_5
LBB12_3:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEED1B6v15006Ev
	b	LBB12_4
LBB12_4:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB12_5:
	ldr	x0, [sp, #24]
	bl	__Unwind_Resume
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table12:
Lexception2:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end2-Lcst_begin2
Lcst_begin2:
	.uleb128 Lfunc_begin2-Lfunc_begin2      ; >> Call Site 1 <<
	.uleb128 Ltmp7-Lfunc_begin2             ;   Call between Lfunc_begin2 and Ltmp7
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp7-Lfunc_begin2             ; >> Call Site 2 <<
	.uleb128 Ltmp8-Ltmp7                    ;   Call between Ltmp7 and Ltmp8
	.uleb128 Ltmp9-Lfunc_begin2             ;     jumps to Ltmp9
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp8-Lfunc_begin2             ; >> Call Site 3 <<
	.uleb128 Lfunc_end2-Ltmp8               ;   Call between Ltmp8 and Lfunc_end2
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end2:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNKSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEptB6v15006Ev ; -- Begin function _ZNKSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEptB6v15006Ev
	.globl	__ZNKSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEptB6v15006Ev
	.weak_definition	__ZNKSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEptB6v15006Ev
	.p2align	2
__ZNKSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEptB6v15006Ev: ; @_ZNKSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEptB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNKSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE5firstB6v15006Ev
	ldr	x0, [x0]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEED1B6v15006Ev ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEED1B6v15006Ev
	.globl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEED1B6v15006Ev
	.weak_def_can_be_hidden	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEED1B6v15006Ev
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEED1B6v15006Ev: ; @_ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEED1B6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEED2B6v15006Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK3map6shapes7Ellipse4drawEPNS_6MapperE ; -- Begin function _ZNK3map6shapes7Ellipse4drawEPNS_6MapperE
	.p2align	2
__ZNK3map6shapes7Ellipse4drawEPNS_6MapperE: ; @_ZNK3map6shapes7Ellipse4drawEPNS_6MapperE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	x10, [x29, #-8]
	ldur	x0, [x29, #-16]
	ldur	q0, [x10, #8]
	str	q0, [sp, #16]
	ldr	w1, [x10, #64]
	ldr	w2, [x10, #68]
	ldr	w8, [x10, #24]
	str	w8, [sp, #8]
	ldrh	w8, [x10, #28]
	strh	w8, [sp, #12]
	ldrb	w9, [x10, #72]
	ldrb	w8, [x10, #73]
	ldr	w6, [x10, #32]
	ldr	w7, [x10, #76]
	ldr	d0, [sp, #16]
	ldr	d1, [sp, #24]
	ldr	w10, [sp, #8]
	str	w10, [sp]
	ldrh	w10, [sp, #12]
	strh	w10, [sp, #4]
	ldr	x3, [sp]
	and	w4, w9, #0x1
	and	w5, w8, #0x1
	bl	__ZN3map6Mapper11drawEllipseENS_5PointEiiNS_3clr3RGBEbbiNS_9AlignmentE
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map6shapes7EllipseD1Ev     ; -- Begin function _ZN3map6shapes7EllipseD1Ev
	.weak_def_can_be_hidden	__ZN3map6shapes7EllipseD1Ev
	.p2align	2
__ZN3map6shapes7EllipseD1Ev:            ; @_ZN3map6shapes7EllipseD1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN3map6shapes7EllipseD2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map6shapes7EllipseD0Ev     ; -- Begin function _ZN3map6shapes7EllipseD0Ev
	.weak_def_can_be_hidden	__ZN3map6shapes7EllipseD0Ev
	.p2align	2
__ZN3map6shapes7EllipseD0Ev:            ; @_ZN3map6shapes7EllipseD0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN3map6shapes7EllipseD1Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZdlPv
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2B6v15006Ev ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2B6v15006Ev
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2B6v15006Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2B6v15006Ev
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2B6v15006Ev: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2B6v15006Ev
Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception3
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x8, [x29, #-8]
	str	x8, [sp]                        ; 8-byte Folded Spill
                                        ; kill: def $x9 killed $xzr
	str	xzr, [x8]
	str	xzr, [x8, #8]
	add	x1, sp, #16
	str	xzr, [sp, #16]
Ltmp10:
	add	x0, x8, #16
	add	x2, sp, #15
	bl	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC1B6v15006IDnNS_18__default_init_tagEEEOT_OT0_
Ltmp11:
	b	LBB18_1
LBB18_1:
Ltmp12:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZNSt3__119__debug_db_insert_cB6v15006INS_6vectorIN3map5PointENS_9allocatorIS3_EEEEEEvPT_
Ltmp13:
	b	LBB18_2
LBB18_2:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB18_3:
Ltmp14:
	bl	___clang_call_terminate
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table18:
Lexception3:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase0-Lttbaseref0
Lttbaseref0:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end3-Lcst_begin3
Lcst_begin3:
	.uleb128 Ltmp10-Lfunc_begin3            ; >> Call Site 1 <<
	.uleb128 Ltmp13-Ltmp10                  ;   Call between Ltmp10 and Ltmp13
	.uleb128 Ltmp14-Lfunc_begin3            ;     jumps to Ltmp14
	.byte	1                               ;   On action: 1
Lcst_end3:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase0:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC1B6v15006IDnNS_18__default_init_tagEEEOT_OT0_ ; -- Begin function _ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC1B6v15006IDnNS_18__default_init_tagEEEOT_OT0_
	.weak_def_can_be_hidden	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC1B6v15006IDnNS_18__default_init_tagEEEOT_OT0_
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC1B6v15006IDnNS_18__default_init_tagEEEOT_OT0_: ; @_ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC1B6v15006IDnNS_18__default_init_tagEEEOT_OT0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldur	x0, [x29, #-8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	bl	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC2B6v15006IDnNS_18__default_init_tagEEEOT_OT0_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	___clang_call_terminate ; -- Begin function __clang_call_terminate
	.globl	___clang_call_terminate
	.weak_definition	___clang_call_terminate
	.p2align	2
___clang_call_terminate:                ; @__clang_call_terminate
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	bl	___cxa_begin_catch
	bl	__ZSt9terminatev
                                        ; -- End function
	.private_extern	__ZNSt3__119__debug_db_insert_cB6v15006INS_6vectorIN3map5PointENS_9allocatorIS3_EEEEEEvPT_ ; -- Begin function _ZNSt3__119__debug_db_insert_cB6v15006INS_6vectorIN3map5PointENS_9allocatorIS3_EEEEEEvPT_
	.globl	__ZNSt3__119__debug_db_insert_cB6v15006INS_6vectorIN3map5PointENS_9allocatorIS3_EEEEEEvPT_
	.weak_definition	__ZNSt3__119__debug_db_insert_cB6v15006INS_6vectorIN3map5PointENS_9allocatorIS3_EEEEEEvPT_
	.p2align	2
__ZNSt3__119__debug_db_insert_cB6v15006INS_6vectorIN3map5PointENS_9allocatorIS3_EEEEEEvPT_: ; @_ZNSt3__119__debug_db_insert_cB6v15006INS_6vectorIN3map5PointENS_9allocatorIS3_EEEEEEvPT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC2B6v15006IDnNS_18__default_init_tagEEEOT_OT0_ ; -- Begin function _ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC2B6v15006IDnNS_18__default_init_tagEEEOT_OT0_
	.weak_def_can_be_hidden	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC2B6v15006IDnNS_18__default_init_tagEEEOT_OT0_
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC2B6v15006IDnNS_18__default_init_tagEEEOT_OT0_: ; @_ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC2B6v15006IDnNS_18__default_init_tagEEEOT_OT0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	str	x2, [sp, #24]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldur	x1, [x29, #-16]
	bl	__ZNSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EEC2B6v15006IDnvEEOT_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EEC2B6v15006ENS_18__default_init_tagE
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EEC2B6v15006IDnvEEOT_ ; -- Begin function _ZNSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EEC2B6v15006IDnvEEOT_
	.weak_def_can_be_hidden	__ZNSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EEC2B6v15006IDnvEEOT_
	.p2align	2
__ZNSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EEC2B6v15006IDnvEEOT_: ; @_ZNSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EEC2B6v15006IDnvEEOT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
                                        ; kill: def $x8 killed $xzr
	str	xzr, [x0]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EEC2B6v15006ENS_18__default_init_tagE ; -- Begin function _ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EEC2B6v15006ENS_18__default_init_tagE
	.globl	__ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EEC2B6v15006ENS_18__default_init_tagE
	.weak_def_can_be_hidden	__ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EEC2B6v15006ENS_18__default_init_tagE
	.p2align	2
__ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EEC2B6v15006ENS_18__default_init_tagE: ; @_ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EEC2B6v15006ENS_18__default_init_tagE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #16]
	ldr	x0, [sp, #16]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNSt3__19allocatorIN3map5PointEEC2B6v15006Ev
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__19allocatorIN3map5PointEEC2B6v15006Ev ; -- Begin function _ZNSt3__19allocatorIN3map5PointEEC2B6v15006Ev
	.globl	__ZNSt3__19allocatorIN3map5PointEEC2B6v15006Ev
	.weak_def_can_be_hidden	__ZNSt3__19allocatorIN3map5PointEEC2B6v15006Ev
	.p2align	2
__ZNSt3__19allocatorIN3map5PointEEC2B6v15006Ev: ; @_ZNSt3__19allocatorIN3map5PointEEC2B6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIN3map5PointEEEEC2B6v15006Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIN3map5PointEEEEC2B6v15006Ev ; -- Begin function _ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIN3map5PointEEEEC2B6v15006Ev
	.globl	__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIN3map5PointEEEEC2B6v15006Ev
	.weak_def_can_be_hidden	__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIN3map5PointEEEEC2B6v15006Ev
	.p2align	2
__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIN3map5PointEEEEC2B6v15006Ev: ; @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIN3map5PointEEEEC2B6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1ERKS5_ ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1ERKS5_
	.weak_def_can_be_hidden	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1ERKS5_
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1ERKS5_: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1ERKS5_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2ERKS5_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map6shapes5ShapeD1Ev       ; -- Begin function _ZN3map6shapes5ShapeD1Ev
	.weak_def_can_be_hidden	__ZN3map6shapes5ShapeD1Ev
	.p2align	2
__ZN3map6shapes5ShapeD1Ev:              ; @_ZN3map6shapes5ShapeD1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	str	x8, [sp, #8]
	brk	#0x1
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map6shapes5ShapeD0Ev       ; -- Begin function _ZN3map6shapes5ShapeD0Ev
	.weak_def_can_be_hidden	__ZN3map6shapes5ShapeD0Ev
	.p2align	2
__ZN3map6shapes5ShapeD0Ev:              ; @_ZN3map6shapes5ShapeD0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	brk	#0x1
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2ERKS5_ ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2ERKS5_
	.weak_def_can_be_hidden	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2ERKS5_
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2ERKS5_: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2ERKS5_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	stur	x1, [x29, #-24]
	ldur	x8, [x29, #-16]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	mov	x9, x8
	stur	x9, [x29, #-8]
                                        ; kill: def $x9 killed $xzr
	str	xzr, [x8]
	str	xzr, [x8, #8]
	add	x8, sp, #32
	str	x8, [sp]                        ; 8-byte Folded Spill
	str	xzr, [sp, #32]
	ldur	x0, [x29, #-24]
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__allocB6v15006Ev
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE37select_on_container_copy_constructionB6v15006IS4_vvEES4_RKS4_
	ldr	x1, [sp]                        ; 8-byte Folded Reload
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	add	x0, x8, #16
	add	x2, sp, #31
	bl	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC1B6v15006IDnS5_EEOT_OT0_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__119__debug_db_insert_cB6v15006INS_6vectorIN3map5PointENS_9allocatorIS3_EEEEEEvPT_
	ldur	x0, [x29, #-24]
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4sizeB6v15006Ev
	str	x0, [sp, #16]
	ldr	x8, [sp, #16]
	subs	x8, x8, #0
	cset	w8, ls
	tbnz	w8, #0, LBB30_2
	b	LBB30_1
LBB30_1:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x1, [sp, #16]
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE11__vallocateB6v15006Em
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldur	x8, [x29, #-24]
	ldr	x1, [x8]
	ldur	x8, [x29, #-24]
	ldr	x2, [x8, #8]
	ldr	x3, [sp, #16]
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE18__construct_at_endIPS2_EENS_9enable_ifIXsr27__is_cpp17_forward_iteratorIT_EE5valueEvE4typeES9_S9_m
	b	LBB30_2
LBB30_2:
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE37select_on_container_copy_constructionB6v15006IS4_vvEES4_RKS4_ ; -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE37select_on_container_copy_constructionB6v15006IS4_vvEES4_RKS4_
	.weak_definition	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE37select_on_container_copy_constructionB6v15006IS4_vvEES4_RKS4_
	.p2align	2
__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE37select_on_container_copy_constructionB6v15006IS4_vvEES4_RKS4_: ; @_ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE37select_on_container_copy_constructionB6v15006IS4_vvEES4_RKS4_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__allocB6v15006Ev ; -- Begin function _ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__allocB6v15006Ev
	.globl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__allocB6v15006Ev
	.weak_definition	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__allocB6v15006Ev
	.p2align	2
__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__allocB6v15006Ev: ; @_ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__allocB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	add	x0, x8, #16
	bl	__ZNKSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE6secondB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC1B6v15006IDnS5_EEOT_OT0_ ; -- Begin function _ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC1B6v15006IDnS5_EEOT_OT0_
	.weak_def_can_be_hidden	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC1B6v15006IDnS5_EEOT_OT0_
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC1B6v15006IDnS5_EEOT_OT0_: ; @_ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC1B6v15006IDnS5_EEOT_OT0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldur	x0, [x29, #-8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	bl	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC2B6v15006IDnS5_EEOT_OT0_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4sizeB6v15006Ev ; -- Begin function _ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4sizeB6v15006Ev
	.globl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4sizeB6v15006Ev
	.weak_definition	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4sizeB6v15006Ev
	.p2align	2
__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4sizeB6v15006Ev: ; @_ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4sizeB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x9, [sp, #8]
	ldr	x8, [x9, #8]
	ldr	x9, [x9]
	subs	x8, x8, x9
	mov	x9, #16
	sdiv	x0, x8, x9
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE11__vallocateB6v15006Em ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE11__vallocateB6v15006Em
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE11__vallocateB6v15006Em
	.weak_definition	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE11__vallocateB6v15006Em
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE11__vallocateB6v15006Em: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE11__vallocateB6v15006Em
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
	ldur	x8, [x29, #-16]
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE8max_sizeEv
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	subs	x8, x8, x0
	cset	w8, ls
	tbnz	w8, #0, LBB35_2
	b	LBB35_1
LBB35_1:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE20__throw_length_errorB6v15006Ev
LBB35_2:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__allocB6v15006Ev
	ldur	x1, [x29, #-16]
	bl	__ZNSt3__119__allocate_at_leastB6v15006INS_9allocatorIN3map5PointEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS7_m
	mov	x8, x0
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	str	x8, [sp, #32]
	str	x1, [sp, #40]
	ldr	x8, [sp, #32]
	str	x8, [x0]
	ldr	x8, [sp, #32]
	str	x8, [x0, #8]
	ldr	x8, [x0]
	ldr	x9, [sp, #40]
	add	x8, x8, x9, lsl #4
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE9__end_capB6v15006Ev
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	mov	x9, x0
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	str	x8, [x9]
	mov	x1, #0
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE14__annotate_newB6v15006Em
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE18__construct_at_endIPS2_EENS_9enable_ifIXsr27__is_cpp17_forward_iteratorIT_EE5valueEvE4typeES9_S9_m ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE18__construct_at_endIPS2_EENS_9enable_ifIXsr27__is_cpp17_forward_iteratorIT_EE5valueEvE4typeES9_S9_m
	.weak_definition	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE18__construct_at_endIPS2_EENS_9enable_ifIXsr27__is_cpp17_forward_iteratorIT_EE5valueEvE4typeES9_S9_m
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE18__construct_at_endIPS2_EENS_9enable_ifIXsr27__is_cpp17_forward_iteratorIT_EE5valueEvE4typeES9_S9_m: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE18__construct_at_endIPS2_EENS_9enable_ifIXsr27__is_cpp17_forward_iteratorIT_EE5valueEvE4typeES9_S9_m
Lfunc_begin4:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception4
; %bb.0:
	sub	sp, sp, #112
	.cfi_def_cfa_offset 112
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	stur	x2, [x29, #-24]
	stur	x3, [x29, #-32]
	ldur	x1, [x29, #-8]
	str	x1, [sp, #8]                    ; 8-byte Folded Spill
	ldur	x2, [x29, #-32]
	add	x0, sp, #40
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionC1ERS5_m
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__allocB6v15006Ev
	ldur	x1, [x29, #-16]
	ldur	x2, [x29, #-24]
	ldr	x3, [sp, #48]
Ltmp22:
	bl	__ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEEPS3_S5_S5_EET2_RT_T0_T1_S6_
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
Ltmp23:
	b	LBB36_1
LBB36_1:
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	add	x0, sp, #40
	str	x8, [sp, #48]
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionD1Ev
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB36_2:
Ltmp24:
	mov	x8, x1
	str	x0, [sp, #32]
	str	w8, [sp, #28]
	add	x0, sp, #40
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionD1Ev
	b	LBB36_3
LBB36_3:
	ldr	x0, [sp, #32]
	bl	__Unwind_Resume
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table36:
Lexception4:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end4-Lcst_begin4
Lcst_begin4:
	.uleb128 Lfunc_begin4-Lfunc_begin4      ; >> Call Site 1 <<
	.uleb128 Ltmp22-Lfunc_begin4            ;   Call between Lfunc_begin4 and Ltmp22
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp22-Lfunc_begin4            ; >> Call Site 2 <<
	.uleb128 Ltmp23-Ltmp22                  ;   Call between Ltmp22 and Ltmp23
	.uleb128 Ltmp24-Lfunc_begin4            ;     jumps to Ltmp24
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp23-Lfunc_begin4            ; >> Call Site 3 <<
	.uleb128 Lfunc_end4-Ltmp23              ;   Call between Ltmp23 and Lfunc_end4
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end4:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNKSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE6secondB6v15006Ev ; -- Begin function _ZNKSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE6secondB6v15006Ev
	.globl	__ZNKSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE6secondB6v15006Ev
	.weak_definition	__ZNKSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE6secondB6v15006Ev
	.p2align	2
__ZNKSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE6secondB6v15006Ev: ; @_ZNKSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE6secondB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNKSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EE5__getB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EE5__getB6v15006Ev ; -- Begin function _ZNKSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EE5__getB6v15006Ev
	.globl	__ZNKSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EE5__getB6v15006Ev
	.weak_definition	__ZNKSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EE5__getB6v15006Ev
	.p2align	2
__ZNKSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EE5__getB6v15006Ev: ; @_ZNKSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EE5__getB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC2B6v15006IDnS5_EEOT_OT0_ ; -- Begin function _ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC2B6v15006IDnS5_EEOT_OT0_
	.weak_def_can_be_hidden	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC2B6v15006IDnS5_EEOT_OT0_
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC2B6v15006IDnS5_EEOT_OT0_: ; @_ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC2B6v15006IDnS5_EEOT_OT0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldur	x0, [x29, #-8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	bl	__ZNSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EEC2B6v15006IDnvEEOT_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldr	x1, [sp, #8]
	bl	__ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EEC2B6v15006IS4_vEEOT_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EEC2B6v15006IS4_vEEOT_ ; -- Begin function _ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EEC2B6v15006IS4_vEEOT_
	.weak_def_can_be_hidden	__ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EEC2B6v15006IS4_vEEOT_
	.p2align	2
__ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EEC2B6v15006IS4_vEEOT_: ; @_ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EEC2B6v15006IS4_vEEOT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE8max_sizeEv ; -- Begin function _ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE8max_sizeEv
	.weak_definition	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE8max_sizeEv
	.p2align	2
__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE8max_sizeEv: ; @_ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE8max_sizeEv
Lfunc_begin5:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception5
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x0, [x29, #-8]
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__allocB6v15006Ev
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE8max_sizeB6v15006IS4_vvEEmRKS4_
	sub	x8, x29, #16
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	stur	x0, [x29, #-16]
	bl	__ZNSt3__114numeric_limitsIlE3maxB6v15006Ev
	mov	x8, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	add	x1, sp, #24
	str	x8, [sp, #24]
Ltmp27:
	bl	__ZNSt3__13minB6v15006ImEERKT_S3_S3_
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
Ltmp28:
	b	LBB41_1
LBB41_1:
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x0, [x8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB41_2:
Ltmp29:
	bl	___clang_call_terminate
Lfunc_end5:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table41:
Lexception5:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase1-Lttbaseref1
Lttbaseref1:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end5-Lcst_begin5
Lcst_begin5:
	.uleb128 Ltmp27-Lfunc_begin5            ; >> Call Site 1 <<
	.uleb128 Ltmp28-Ltmp27                  ;   Call between Ltmp27 and Ltmp28
	.uleb128 Ltmp29-Lfunc_begin5            ;     jumps to Ltmp29
	.byte	1                               ;   On action: 1
Lcst_end5:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase1:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE20__throw_length_errorB6v15006Ev ; -- Begin function _ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE20__throw_length_errorB6v15006Ev
	.globl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE20__throw_length_errorB6v15006Ev
	.weak_definition	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE20__throw_length_errorB6v15006Ev
	.p2align	2
__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE20__throw_length_errorB6v15006Ev: ; @_ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE20__throw_length_errorB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	__ZNSt3__120__throw_length_errorB6v15006EPKc
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__119__allocate_at_leastB6v15006INS_9allocatorIN3map5PointEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS7_m ; -- Begin function _ZNSt3__119__allocate_at_leastB6v15006INS_9allocatorIN3map5PointEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS7_m
	.globl	__ZNSt3__119__allocate_at_leastB6v15006INS_9allocatorIN3map5PointEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS7_m
	.weak_definition	__ZNSt3__119__allocate_at_leastB6v15006INS_9allocatorIN3map5PointEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS7_m
	.p2align	2
__ZNSt3__119__allocate_at_leastB6v15006INS_9allocatorIN3map5PointEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS7_m: ; @_ZNSt3__119__allocate_at_leastB6v15006INS_9allocatorIN3map5PointEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS7_m
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x1, [sp]
	bl	__ZNSt3__19allocatorIN3map5PointEE8allocateB6v15006Em
	str	x0, [sp, #16]
	ldr	x8, [sp]
	str	x8, [sp, #24]
	ldr	x0, [sp, #16]
	ldr	x1, [sp, #24]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__allocB6v15006Ev ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__allocB6v15006Ev
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__allocB6v15006Ev
	.weak_definition	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__allocB6v15006Ev
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__allocB6v15006Ev: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__allocB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	add	x0, x8, #16
	bl	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE6secondB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE9__end_capB6v15006Ev ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE9__end_capB6v15006Ev
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE9__end_capB6v15006Ev
	.weak_definition	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE9__end_capB6v15006Ev
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE9__end_capB6v15006Ev: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE9__end_capB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	add	x0, x8, #16
	bl	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE5firstB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE14__annotate_newB6v15006Em ; -- Begin function _ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE14__annotate_newB6v15006Em
	.globl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE14__annotate_newB6v15006Em
	.weak_definition	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE14__annotate_newB6v15006Em
	.p2align	2
__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE14__annotate_newB6v15006Em: ; @_ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE14__annotate_newB6v15006Em
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	x0, [x29, #-8]
	stur	x0, [x29, #-24]                 ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4dataB6v15006Ev
	mov	x1, x0
	ldur	x0, [x29, #-24]                 ; 8-byte Folded Reload
	str	x1, [sp]                        ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4dataB6v15006Ev
	mov	x8, x0
	ldur	x0, [x29, #-24]                 ; 8-byte Folded Reload
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE8capacityB6v15006Ev
	mov	x8, x0
	ldur	x0, [x29, #-24]                 ; 8-byte Folded Reload
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4dataB6v15006Ev
	mov	x8, x0
	ldur	x0, [x29, #-24]                 ; 8-byte Folded Reload
	str	x8, [sp, #32]                   ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE8capacityB6v15006Ev
	mov	x8, x0
	ldur	x0, [x29, #-24]                 ; 8-byte Folded Reload
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4dataB6v15006Ev
	ldr	x1, [sp]                        ; 8-byte Folded Reload
	ldr	x13, [sp, #8]                   ; 8-byte Folded Reload
	ldr	x12, [sp, #16]                  ; 8-byte Folded Reload
	ldr	x11, [sp, #24]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #32]                  ; 8-byte Folded Reload
	mov	x8, x0
	ldur	x0, [x29, #-24]                 ; 8-byte Folded Reload
	ldur	x9, [x29, #-16]
	add	x2, x12, x13, lsl #4
	add	x3, x10, x11, lsl #4
	add	x4, x8, x9, lsl #4
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE31__annotate_contiguous_containerB6v15006EPKvS7_S7_S7_
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__13minB6v15006ImEERKT_S3_S3_ ; -- Begin function _ZNSt3__13minB6v15006ImEERKT_S3_S3_
	.globl	__ZNSt3__13minB6v15006ImEERKT_S3_S3_
	.weak_definition	__ZNSt3__13minB6v15006ImEERKT_S3_S3_
	.p2align	2
__ZNSt3__13minB6v15006ImEERKT_S3_S3_:   ; @_ZNSt3__13minB6v15006ImEERKT_S3_S3_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #16]
	bl	__ZNSt3__13minB6v15006ImNS_6__lessImmEEEERKT_S5_S5_T0_
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE8max_sizeB6v15006IS4_vvEEmRKS4_ ; -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE8max_sizeB6v15006IS4_vvEEmRKS4_
	.weak_definition	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE8max_sizeB6v15006IS4_vvEEmRKS4_
	.p2align	2
__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE8max_sizeB6v15006IS4_vvEEmRKS4_: ; @_ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE8max_sizeB6v15006IS4_vvEEmRKS4_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	bl	__ZNSt3__114numeric_limitsImE3maxB6v15006Ev
	mov	x8, #16
	udiv	x0, x0, x8
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__114numeric_limitsIlE3maxB6v15006Ev ; -- Begin function _ZNSt3__114numeric_limitsIlE3maxB6v15006Ev
	.globl	__ZNSt3__114numeric_limitsIlE3maxB6v15006Ev
	.weak_definition	__ZNSt3__114numeric_limitsIlE3maxB6v15006Ev
	.p2align	2
__ZNSt3__114numeric_limitsIlE3maxB6v15006Ev: ; @_ZNSt3__114numeric_limitsIlE3maxB6v15006Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	__ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB6v15006Ev
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__13minB6v15006ImNS_6__lessImmEEEERKT_S5_S5_T0_ ; -- Begin function _ZNSt3__13minB6v15006ImNS_6__lessImmEEEERKT_S5_S5_T0_
	.globl	__ZNSt3__13minB6v15006ImNS_6__lessImmEEEERKT_S5_S5_T0_
	.weak_definition	__ZNSt3__13minB6v15006ImNS_6__lessImmEEEERKT_S5_S5_T0_
	.p2align	2
__ZNSt3__13minB6v15006ImNS_6__lessImmEEEERKT_S5_S5_T0_: ; @_ZNSt3__13minB6v15006ImNS_6__lessImmEEEERKT_S5_S5_T0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #16]
	str	x1, [sp, #8]
	ldr	x1, [sp, #8]
	ldr	x2, [sp, #16]
	sub	x0, x29, #1
	bl	__ZNKSt3__16__lessImmEclB6v15006ERKmS3_
	tbz	w0, #0, LBB50_2
	b	LBB50_1
LBB50_1:
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	b	LBB50_3
LBB50_2:
	ldr	x8, [sp, #16]
	str	x8, [sp]                        ; 8-byte Folded Spill
	b	LBB50_3
LBB50_3:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__16__lessImmEclB6v15006ERKmS3_ ; -- Begin function _ZNKSt3__16__lessImmEclB6v15006ERKmS3_
	.globl	__ZNKSt3__16__lessImmEclB6v15006ERKmS3_
	.weak_definition	__ZNKSt3__16__lessImmEclB6v15006ERKmS3_
	.p2align	2
__ZNKSt3__16__lessImmEclB6v15006ERKmS3_: ; @_ZNKSt3__16__lessImmEclB6v15006ERKmS3_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldr	x8, [sp, #16]
	ldr	x8, [x8]
	ldr	x9, [sp, #8]
	ldr	x9, [x9]
	subs	x8, x8, x9
	cset	w8, lo
	and	w0, w8, #0x1
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__114numeric_limitsImE3maxB6v15006Ev ; -- Begin function _ZNSt3__114numeric_limitsImE3maxB6v15006Ev
	.globl	__ZNSt3__114numeric_limitsImE3maxB6v15006Ev
	.weak_definition	__ZNSt3__114numeric_limitsImE3maxB6v15006Ev
	.p2align	2
__ZNSt3__114numeric_limitsImE3maxB6v15006Ev: ; @_ZNSt3__114numeric_limitsImE3maxB6v15006Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	__ZNSt3__123__libcpp_numeric_limitsImLb1EE3maxB6v15006Ev
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__123__libcpp_numeric_limitsImLb1EE3maxB6v15006Ev ; -- Begin function _ZNSt3__123__libcpp_numeric_limitsImLb1EE3maxB6v15006Ev
	.globl	__ZNSt3__123__libcpp_numeric_limitsImLb1EE3maxB6v15006Ev
	.weak_definition	__ZNSt3__123__libcpp_numeric_limitsImLb1EE3maxB6v15006Ev
	.p2align	2
__ZNSt3__123__libcpp_numeric_limitsImLb1EE3maxB6v15006Ev: ; @_ZNSt3__123__libcpp_numeric_limitsImLb1EE3maxB6v15006Ev
	.cfi_startproc
; %bb.0:
	mov	x0, #-1
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB6v15006Ev ; -- Begin function _ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB6v15006Ev
	.globl	__ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB6v15006Ev
	.weak_definition	__ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB6v15006Ev
	.p2align	2
__ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB6v15006Ev: ; @_ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB6v15006Ev
	.cfi_startproc
; %bb.0:
	mov	x0, #9223372036854775807
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__120__throw_length_errorB6v15006EPKc ; -- Begin function _ZNSt3__120__throw_length_errorB6v15006EPKc
	.globl	__ZNSt3__120__throw_length_errorB6v15006EPKc
	.weak_definition	__ZNSt3__120__throw_length_errorB6v15006EPKc
	.p2align	2
__ZNSt3__120__throw_length_errorB6v15006EPKc: ; @_ZNSt3__120__throw_length_errorB6v15006EPKc
Lfunc_begin6:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception6
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	mov	x0, #16
	bl	___cxa_allocate_exception
	str	x0, [sp]                        ; 8-byte Folded Spill
	ldur	x1, [x29, #-8]
Ltmp31:
	bl	__ZNSt12length_errorC1B6v15006EPKc
Ltmp32:
	b	LBB55_1
LBB55_1:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	adrp	x1, __ZTISt12length_error@GOTPAGE
	ldr	x1, [x1, __ZTISt12length_error@GOTPAGEOFF]
	adrp	x2, __ZNSt12length_errorD1Ev@GOTPAGE
	ldr	x2, [x2, __ZNSt12length_errorD1Ev@GOTPAGEOFF]
	bl	___cxa_throw
LBB55_2:
Ltmp33:
	mov	x9, x0
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	mov	x8, x1
	str	x9, [sp, #16]
	str	w8, [sp, #12]
	bl	___cxa_free_exception
	b	LBB55_3
LBB55_3:
	ldr	x0, [sp, #16]
	bl	__Unwind_Resume
Lfunc_end6:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table55:
Lexception6:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end6-Lcst_begin6
Lcst_begin6:
	.uleb128 Lfunc_begin6-Lfunc_begin6      ; >> Call Site 1 <<
	.uleb128 Ltmp31-Lfunc_begin6            ;   Call between Lfunc_begin6 and Ltmp31
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp31-Lfunc_begin6            ; >> Call Site 2 <<
	.uleb128 Ltmp32-Ltmp31                  ;   Call between Ltmp31 and Ltmp32
	.uleb128 Ltmp33-Lfunc_begin6            ;     jumps to Ltmp33
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp32-Lfunc_begin6            ; >> Call Site 3 <<
	.uleb128 Lfunc_end6-Ltmp32              ;   Call between Ltmp32 and Lfunc_end6
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end6:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt12length_errorC1B6v15006EPKc ; -- Begin function _ZNSt12length_errorC1B6v15006EPKc
	.globl	__ZNSt12length_errorC1B6v15006EPKc
	.weak_def_can_be_hidden	__ZNSt12length_errorC1B6v15006EPKc
	.p2align	2
__ZNSt12length_errorC1B6v15006EPKc:     ; @_ZNSt12length_errorC1B6v15006EPKc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	bl	__ZNSt12length_errorC2B6v15006EPKc
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt12length_errorC2B6v15006EPKc ; -- Begin function _ZNSt12length_errorC2B6v15006EPKc
	.globl	__ZNSt12length_errorC2B6v15006EPKc
	.weak_def_can_be_hidden	__ZNSt12length_errorC2B6v15006EPKc
	.p2align	2
__ZNSt12length_errorC2B6v15006EPKc:     ; @_ZNSt12length_errorC2B6v15006EPKc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, __ZTVSt12length_error@GOTPAGE
	ldr	x8, [x8, __ZTVSt12length_error@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	bl	__ZNSt11logic_errorC2EPKc
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	str	x8, [x0]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__19allocatorIN3map5PointEE8allocateB6v15006Em ; -- Begin function _ZNSt3__19allocatorIN3map5PointEE8allocateB6v15006Em
	.globl	__ZNSt3__19allocatorIN3map5PointEE8allocateB6v15006Em
	.weak_definition	__ZNSt3__19allocatorIN3map5PointEE8allocateB6v15006Em
	.p2align	2
__ZNSt3__19allocatorIN3map5PointEE8allocateB6v15006Em: ; @_ZNSt3__19allocatorIN3map5PointEE8allocateB6v15006Em
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	ldr	x8, [sp, #16]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE8max_sizeB6v15006IS4_vvEEmRKS4_
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	subs	x8, x8, x0
	cset	w8, ls
	tbnz	w8, #0, LBB58_2
	b	LBB58_1
LBB58_1:
	bl	__ZSt28__throw_bad_array_new_lengthB6v15006v
LBB58_2:
	ldr	x8, [sp, #16]
	lsl	x0, x8, #4
	mov	x1, #8
	bl	__ZNSt3__117__libcpp_allocateB6v15006Emm
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZSt28__throw_bad_array_new_lengthB6v15006v ; -- Begin function _ZSt28__throw_bad_array_new_lengthB6v15006v
	.globl	__ZSt28__throw_bad_array_new_lengthB6v15006v
	.weak_definition	__ZSt28__throw_bad_array_new_lengthB6v15006v
	.p2align	2
__ZSt28__throw_bad_array_new_lengthB6v15006v: ; @_ZSt28__throw_bad_array_new_lengthB6v15006v
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x0, #8
	bl	___cxa_allocate_exception
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNSt20bad_array_new_lengthC1Ev
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	adrp	x1, __ZTISt20bad_array_new_length@GOTPAGE
	ldr	x1, [x1, __ZTISt20bad_array_new_length@GOTPAGEOFF]
	adrp	x2, __ZNSt20bad_array_new_lengthD1Ev@GOTPAGE
	ldr	x2, [x2, __ZNSt20bad_array_new_lengthD1Ev@GOTPAGEOFF]
	bl	___cxa_throw
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__117__libcpp_allocateB6v15006Emm ; -- Begin function _ZNSt3__117__libcpp_allocateB6v15006Emm
	.globl	__ZNSt3__117__libcpp_allocateB6v15006Emm
	.weak_definition	__ZNSt3__117__libcpp_allocateB6v15006Emm
	.p2align	2
__ZNSt3__117__libcpp_allocateB6v15006Emm: ; @_ZNSt3__117__libcpp_allocateB6v15006Emm
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #16]
	str	x1, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__124__is_overaligned_for_newB6v15006Em
	tbz	w0, #0, LBB60_2
	b	LBB60_1
LBB60_1:
	ldr	x8, [sp, #8]
	str	x8, [sp]
	ldr	x0, [sp, #16]
	ldr	x1, [sp]
	bl	__ZNSt3__121__libcpp_operator_newB6v15006IJmSt11align_val_tEEEPvDpT_
	stur	x0, [x29, #-8]
	b	LBB60_3
LBB60_2:
	ldr	x0, [sp, #16]
	bl	__ZNSt3__121__libcpp_operator_newB6v15006IJmEEEPvDpT_
	stur	x0, [x29, #-8]
	b	LBB60_3
LBB60_3:
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__124__is_overaligned_for_newB6v15006Em ; -- Begin function _ZNSt3__124__is_overaligned_for_newB6v15006Em
	.globl	__ZNSt3__124__is_overaligned_for_newB6v15006Em
	.weak_definition	__ZNSt3__124__is_overaligned_for_newB6v15006Em
	.p2align	2
__ZNSt3__124__is_overaligned_for_newB6v15006Em: ; @_ZNSt3__124__is_overaligned_for_newB6v15006Em
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	subs	x8, x8, #16
	cset	w8, hi
	and	w0, w8, #0x1
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__121__libcpp_operator_newB6v15006IJmSt11align_val_tEEEPvDpT_ ; -- Begin function _ZNSt3__121__libcpp_operator_newB6v15006IJmSt11align_val_tEEEPvDpT_
	.globl	__ZNSt3__121__libcpp_operator_newB6v15006IJmSt11align_val_tEEEPvDpT_
	.weak_definition	__ZNSt3__121__libcpp_operator_newB6v15006IJmSt11align_val_tEEEPvDpT_
	.p2align	2
__ZNSt3__121__libcpp_operator_newB6v15006IJmSt11align_val_tEEEPvDpT_: ; @_ZNSt3__121__libcpp_operator_newB6v15006IJmSt11align_val_tEEEPvDpT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x1, [sp]
	bl	__ZnwmSt11align_val_t
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__121__libcpp_operator_newB6v15006IJmEEEPvDpT_ ; -- Begin function _ZNSt3__121__libcpp_operator_newB6v15006IJmEEEPvDpT_
	.globl	__ZNSt3__121__libcpp_operator_newB6v15006IJmEEEPvDpT_
	.weak_definition	__ZNSt3__121__libcpp_operator_newB6v15006IJmEEEPvDpT_
	.p2align	2
__ZNSt3__121__libcpp_operator_newB6v15006IJmEEEPvDpT_: ; @_ZNSt3__121__libcpp_operator_newB6v15006IJmEEEPvDpT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__Znwm
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE6secondB6v15006Ev ; -- Begin function _ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE6secondB6v15006Ev
	.globl	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE6secondB6v15006Ev
	.weak_definition	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE6secondB6v15006Ev
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE6secondB6v15006Ev: ; @_ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE6secondB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EE5__getB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EE5__getB6v15006Ev ; -- Begin function _ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EE5__getB6v15006Ev
	.globl	__ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EE5__getB6v15006Ev
	.weak_definition	__ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EE5__getB6v15006Ev
	.p2align	2
__ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EE5__getB6v15006Ev: ; @_ZNSt3__122__compressed_pair_elemINS_9allocatorIN3map5PointEEELi1ELb1EE5__getB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE5firstB6v15006Ev ; -- Begin function _ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE5firstB6v15006Ev
	.globl	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE5firstB6v15006Ev
	.weak_definition	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE5firstB6v15006Ev
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE5firstB6v15006Ev: ; @_ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE5firstB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EE5__getB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EE5__getB6v15006Ev ; -- Begin function _ZNSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EE5__getB6v15006Ev
	.globl	__ZNSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EE5__getB6v15006Ev
	.weak_definition	__ZNSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EE5__getB6v15006Ev
	.p2align	2
__ZNSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EE5__getB6v15006Ev: ; @_ZNSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EE5__getB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE31__annotate_contiguous_containerB6v15006EPKvS7_S7_S7_ ; -- Begin function _ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE31__annotate_contiguous_containerB6v15006EPKvS7_S7_S7_
	.globl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE31__annotate_contiguous_containerB6v15006EPKvS7_S7_S7_
	.weak_definition	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE31__annotate_contiguous_containerB6v15006EPKvS7_S7_S7_
	.p2align	2
__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE31__annotate_contiguous_containerB6v15006EPKvS7_S7_S7_: ; @_ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE31__annotate_contiguous_containerB6v15006EPKvS7_S7_S7_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	x0, [sp, #40]
	str	x1, [sp, #32]
	str	x2, [sp, #24]
	str	x3, [sp, #16]
	str	x4, [sp, #8]
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4dataB6v15006Ev ; -- Begin function _ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4dataB6v15006Ev
	.globl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4dataB6v15006Ev
	.weak_definition	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4dataB6v15006Ev
	.p2align	2
__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4dataB6v15006Ev: ; @_ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4dataB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x0, [x8]
	bl	__ZNSt3__112__to_addressB6v15006IN3map5PointEEEPT_S4_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE8capacityB6v15006Ev ; -- Begin function _ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE8capacityB6v15006Ev
	.globl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE8capacityB6v15006Ev
	.weak_definition	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE8capacityB6v15006Ev
	.p2align	2
__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE8capacityB6v15006Ev: ; @_ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE8capacityB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE9__end_capB6v15006Ev
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	ldr	x8, [x0]
	ldr	x9, [x9]
	subs	x8, x8, x9
	mov	x9, #16
	sdiv	x0, x8, x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112__to_addressB6v15006IN3map5PointEEEPT_S4_ ; -- Begin function _ZNSt3__112__to_addressB6v15006IN3map5PointEEEPT_S4_
	.globl	__ZNSt3__112__to_addressB6v15006IN3map5PointEEEPT_S4_
	.weak_definition	__ZNSt3__112__to_addressB6v15006IN3map5PointEEEPT_S4_
	.p2align	2
__ZNSt3__112__to_addressB6v15006IN3map5PointEEEPT_S4_: ; @_ZNSt3__112__to_addressB6v15006IN3map5PointEEEPT_S4_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE9__end_capB6v15006Ev ; -- Begin function _ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE9__end_capB6v15006Ev
	.globl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE9__end_capB6v15006Ev
	.weak_definition	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE9__end_capB6v15006Ev
	.p2align	2
__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE9__end_capB6v15006Ev: ; @_ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE9__end_capB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	add	x0, x8, #16
	bl	__ZNKSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE5firstB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE5firstB6v15006Ev ; -- Begin function _ZNKSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE5firstB6v15006Ev
	.globl	__ZNKSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE5firstB6v15006Ev
	.weak_definition	__ZNKSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE5firstB6v15006Ev
	.p2align	2
__ZNKSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE5firstB6v15006Ev: ; @_ZNKSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEE5firstB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNKSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EE5__getB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EE5__getB6v15006Ev ; -- Begin function _ZNKSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EE5__getB6v15006Ev
	.globl	__ZNKSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EE5__getB6v15006Ev
	.weak_definition	__ZNKSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EE5__getB6v15006Ev
	.p2align	2
__ZNKSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EE5__getB6v15006Ev: ; @_ZNKSt3__122__compressed_pair_elemIPN3map5PointELi0ELb0EE5__getB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionC1ERS5_m ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionC1ERS5_m
	.weak_def_can_be_hidden	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionC1ERS5_m
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionC1ERS5_m: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionC1ERS5_m
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldur	x0, [x29, #-8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionC2ERS5_m
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEEPS3_S5_S5_EET2_RT_T0_T1_S6_ ; -- Begin function _ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEEPS3_S5_S5_EET2_RT_T0_T1_S6_
	.globl	__ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEEPS3_S5_S5_EET2_RT_T0_T1_S6_
	.weak_definition	__ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEEPS3_S5_S5_EET2_RT_T0_T1_S6_
	.p2align	2
__ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEEPS3_S5_S5_EET2_RT_T0_T1_S6_: ; @_ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEEPS3_S5_S5_EET2_RT_T0_T1_S6_
Lfunc_begin7:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception7
; %bb.0:
	sub	sp, sp, #112
	.cfi_def_cfa_offset 112
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	stur	x2, [x29, #-24]
	stur	x3, [x29, #-32]
	ldur	x8, [x29, #-32]
	stur	x8, [x29, #-40]
	b	LBB76_1
LBB76_1:                                ; =>This Inner Loop Header: Depth=1
	ldur	x8, [x29, #-16]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB76_8
	b	LBB76_2
LBB76_2:                                ;   in Loop: Header=BB76_1 Depth=1
	ldur	x8, [x29, #-8]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	ldur	x0, [x29, #-32]
	bl	__ZNSt3__112__to_addressB6v15006IN3map5PointEEEPT_S4_
	mov	x1, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldur	x2, [x29, #-16]
Ltmp40:
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE9constructB6v15006IS3_JRS3_EvvEEvRS4_PT_DpOT0_
Ltmp41:
	b	LBB76_3
LBB76_3:                                ;   in Loop: Header=BB76_1 Depth=1
	ldur	x8, [x29, #-16]
	add	x8, x8, #16
	stur	x8, [x29, #-16]
	ldur	x8, [x29, #-32]
	add	x8, x8, #16
	stur	x8, [x29, #-32]
	b	LBB76_1
LBB76_4:
Ltmp42:
	mov	x8, x1
	str	x0, [sp, #48]
	str	w8, [sp, #44]
	b	LBB76_5
LBB76_5:
	ldr	x0, [sp, #48]
	bl	___cxa_begin_catch
	ldur	x1, [x29, #-8]
Ltmp43:
	add	x0, sp, #16
	sub	x2, x29, #40
	sub	x3, x29, #32
	bl	__ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EC1B6v15006ERS4_RS5_S8_
Ltmp44:
	b	LBB76_6
LBB76_6:
Ltmp45:
	add	x0, sp, #16
	bl	__ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EclB6v15006Ev
Ltmp46:
	b	LBB76_7
LBB76_7:
Ltmp47:
	bl	___cxa_rethrow
Ltmp48:
	b	LBB76_14
LBB76_8:
	b	LBB76_11
LBB76_9:
Ltmp49:
	mov	x8, x1
	str	x0, [sp, #48]
	str	w8, [sp, #44]
Ltmp50:
	bl	___cxa_end_catch
Ltmp51:
	b	LBB76_10
LBB76_10:
	b	LBB76_12
LBB76_11:
	ldur	x0, [x29, #-32]
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB76_12:
	ldr	x0, [sp, #48]
	bl	__Unwind_Resume
LBB76_13:
Ltmp52:
	bl	___clang_call_terminate
LBB76_14:
	brk	#0x1
Lfunc_end7:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table76:
Lexception7:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase2-Lttbaseref2
Lttbaseref2:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end7-Lcst_begin7
Lcst_begin7:
	.uleb128 Ltmp40-Lfunc_begin7            ; >> Call Site 1 <<
	.uleb128 Ltmp41-Ltmp40                  ;   Call between Ltmp40 and Ltmp41
	.uleb128 Ltmp42-Lfunc_begin7            ;     jumps to Ltmp42
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp41-Lfunc_begin7            ; >> Call Site 2 <<
	.uleb128 Ltmp43-Ltmp41                  ;   Call between Ltmp41 and Ltmp43
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp43-Lfunc_begin7            ; >> Call Site 3 <<
	.uleb128 Ltmp48-Ltmp43                  ;   Call between Ltmp43 and Ltmp48
	.uleb128 Ltmp49-Lfunc_begin7            ;     jumps to Ltmp49
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp50-Lfunc_begin7            ; >> Call Site 4 <<
	.uleb128 Ltmp51-Ltmp50                  ;   Call between Ltmp50 and Ltmp51
	.uleb128 Ltmp52-Lfunc_begin7            ;     jumps to Ltmp52
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp51-Lfunc_begin7            ; >> Call Site 5 <<
	.uleb128 Lfunc_end7-Ltmp51              ;   Call between Ltmp51 and Lfunc_end7
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end7:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase2:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionD1Ev ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionD1Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionD1Ev
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionD1Ev: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionD1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionD2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionC2ERS5_m ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionC2ERS5_m
	.weak_def_can_be_hidden	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionC2ERS5_m
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionC2ERS5_m: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionC2ERS5_m
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldr	x0, [sp, #24]
	ldr	x8, [sp, #16]
	str	x8, [x0]
	ldr	x8, [sp, #16]
	ldr	x8, [x8, #8]
	str	x8, [x0, #8]
	ldr	x8, [sp, #16]
	ldr	x8, [x8, #8]
	ldr	x9, [sp, #8]
	add	x8, x8, x9, lsl #4
	str	x8, [x0, #16]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE9constructB6v15006IS3_JRS3_EvvEEvRS4_PT_DpOT0_ ; -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE9constructB6v15006IS3_JRS3_EvvEEvRS4_PT_DpOT0_
	.weak_definition	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE9constructB6v15006IS3_JRS3_EvvEEvRS4_PT_DpOT0_
	.p2align	2
__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE9constructB6v15006IS3_JRS3_EvvEEvRS4_PT_DpOT0_: ; @_ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE9constructB6v15006IS3_JRS3_EvvEEvRS4_PT_DpOT0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldr	x0, [sp, #16]
	ldr	x1, [sp, #8]
	bl	__ZNSt3__112construct_atB6v15006IN3map5PointEJRS2_EPS2_EEPT_S6_DpOT0_
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EC1B6v15006ERS4_RS5_S8_ ; -- Begin function _ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EC1B6v15006ERS4_RS5_S8_
	.globl	__ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EC1B6v15006ERS4_RS5_S8_
	.weak_def_can_be_hidden	__ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EC1B6v15006ERS4_RS5_S8_
	.p2align	2
__ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EC1B6v15006ERS4_RS5_S8_: ; @_ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EC1B6v15006ERS4_RS5_S8_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	str	x2, [sp, #24]
	str	x3, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldur	x1, [x29, #-16]
	ldr	x2, [sp, #24]
	ldr	x3, [sp, #16]
	bl	__ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EC2B6v15006ERS4_RS5_S8_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EclB6v15006Ev ; -- Begin function _ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EclB6v15006Ev
	.globl	__ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EclB6v15006Ev
	.weak_definition	__ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EclB6v15006Ev
	.p2align	2
__ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EclB6v15006Ev: ; @_ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EclB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x8, [x29, #-8]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x9, [x8]
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	ldr	x8, [x8, #16]
	ldr	x1, [x8]
	sub	x0, x29, #24
	bl	__ZNSt3__116reverse_iteratorIPN3map5PointEEC1B6v15006ES3_
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [x8, #8]
	ldr	x1, [x8]
	add	x0, sp, #24
	bl	__ZNSt3__116reverse_iteratorIPN3map5PointEEC1B6v15006ES3_
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldur	x1, [x29, #-24]
	ldur	x2, [x29, #-16]
	ldr	x3, [sp, #24]
	ldr	x4, [sp, #32]
	bl	__ZNSt3__119__allocator_destroyB6v15006INS_9allocatorIN3map5PointEEENS_16reverse_iteratorIPS3_EES7_EEvRT_T0_T1_
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112construct_atB6v15006IN3map5PointEJRS2_EPS2_EEPT_S6_DpOT0_ ; -- Begin function _ZNSt3__112construct_atB6v15006IN3map5PointEJRS2_EPS2_EEPT_S6_DpOT0_
	.globl	__ZNSt3__112construct_atB6v15006IN3map5PointEJRS2_EPS2_EEPT_S6_DpOT0_
	.weak_definition	__ZNSt3__112construct_atB6v15006IN3map5PointEJRS2_EPS2_EEPT_S6_DpOT0_
	.p2align	2
__ZNSt3__112construct_atB6v15006IN3map5PointEJRS2_EPS2_EEPT_S6_DpOT0_: ; @_ZNSt3__112construct_atB6v15006IN3map5PointEJRS2_EPS2_EEPT_S6_DpOT0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #16]
	str	x1, [sp, #8]
	ldr	x8, [sp, #16]
	str	x8, [sp, #24]
	ldr	x0, [sp, #24]
	ldr	x8, [sp, #8]
	ldr	q0, [x8]
	str	q0, [x0]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EC2B6v15006ERS4_RS5_S8_ ; -- Begin function _ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EC2B6v15006ERS4_RS5_S8_
	.globl	__ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EC2B6v15006ERS4_RS5_S8_
	.weak_def_can_be_hidden	__ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EC2B6v15006ERS4_RS5_S8_
	.p2align	2
__ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EC2B6v15006ERS4_RS5_S8_: ; @_ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EC2B6v15006ERS4_RS5_S8_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	str	x3, [sp]
	ldr	x0, [sp, #24]
	ldr	x8, [sp, #16]
	str	x8, [x0]
	ldr	x8, [sp, #8]
	str	x8, [x0, #8]
	ldr	x8, [sp]
	str	x8, [x0, #16]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__119__allocator_destroyB6v15006INS_9allocatorIN3map5PointEEENS_16reverse_iteratorIPS3_EES7_EEvRT_T0_T1_ ; -- Begin function _ZNSt3__119__allocator_destroyB6v15006INS_9allocatorIN3map5PointEEENS_16reverse_iteratorIPS3_EES7_EEvRT_T0_T1_
	.globl	__ZNSt3__119__allocator_destroyB6v15006INS_9allocatorIN3map5PointEEENS_16reverse_iteratorIPS3_EES7_EEvRT_T0_T1_
	.weak_definition	__ZNSt3__119__allocator_destroyB6v15006INS_9allocatorIN3map5PointEEENS_16reverse_iteratorIPS3_EES7_EEvRT_T0_T1_
	.p2align	2
__ZNSt3__119__allocator_destroyB6v15006INS_9allocatorIN3map5PointEEENS_16reverse_iteratorIPS3_EES7_EEvRT_T0_T1_: ; @_ZNSt3__119__allocator_destroyB6v15006INS_9allocatorIN3map5PointEEENS_16reverse_iteratorIPS3_EES7_EEvRT_T0_T1_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x1, [x29, #-16]
	stur	x2, [x29, #-8]
	str	x3, [sp, #16]
	str	x4, [sp, #24]
	str	x0, [sp, #8]
	b	LBB84_1
LBB84_1:                                ; =>This Inner Loop Header: Depth=1
	sub	x0, x29, #16
	add	x1, sp, #16
	bl	__ZNSt3__1neB6v15006IPN3map5PointES3_EEbRKNS_16reverse_iteratorIT_EERKNS4_IT0_EE
	tbz	w0, #0, LBB84_4
	b	LBB84_2
LBB84_2:                                ;   in Loop: Header=BB84_1 Depth=1
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	sub	x0, x29, #16
	bl	__ZNSt3__112__to_addressB6v15006INS_16reverse_iteratorIPN3map5PointEEEvEENS_5decayIDTclsr19__to_address_helperIT_EE6__callcl7declvalIRKS7_EEEEE4typeES9_
	mov	x1, x0
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE7destroyB6v15006IS3_vvEEvRS4_PT_
	b	LBB84_3
LBB84_3:                                ;   in Loop: Header=BB84_1 Depth=1
	sub	x0, x29, #16
	bl	__ZNSt3__116reverse_iteratorIPN3map5PointEEppB6v15006Ev
	b	LBB84_1
LBB84_4:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__116reverse_iteratorIPN3map5PointEEC1B6v15006ES3_ ; -- Begin function _ZNSt3__116reverse_iteratorIPN3map5PointEEC1B6v15006ES3_
	.globl	__ZNSt3__116reverse_iteratorIPN3map5PointEEC1B6v15006ES3_
	.weak_def_can_be_hidden	__ZNSt3__116reverse_iteratorIPN3map5PointEEC1B6v15006ES3_
	.p2align	2
__ZNSt3__116reverse_iteratorIPN3map5PointEEC1B6v15006ES3_: ; @_ZNSt3__116reverse_iteratorIPN3map5PointEEC1B6v15006ES3_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	bl	__ZNSt3__116reverse_iteratorIPN3map5PointEEC2B6v15006ES3_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__1neB6v15006IPN3map5PointES3_EEbRKNS_16reverse_iteratorIT_EERKNS4_IT0_EE ; -- Begin function _ZNSt3__1neB6v15006IPN3map5PointES3_EEbRKNS_16reverse_iteratorIT_EERKNS4_IT0_EE
	.globl	__ZNSt3__1neB6v15006IPN3map5PointES3_EEbRKNS_16reverse_iteratorIT_EERKNS4_IT0_EE
	.weak_definition	__ZNSt3__1neB6v15006IPN3map5PointES3_EEbRKNS_16reverse_iteratorIT_EERKNS4_IT0_EE
	.p2align	2
__ZNSt3__1neB6v15006IPN3map5PointES3_EEbRKNS_16reverse_iteratorIT_EERKNS4_IT0_EE: ; @_ZNSt3__1neB6v15006IPN3map5PointES3_EEbRKNS_16reverse_iteratorIT_EERKNS4_IT0_EE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	bl	__ZNKSt3__116reverse_iteratorIPN3map5PointEE4baseB6v15006Ev
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x0, [sp, #16]
	bl	__ZNKSt3__116reverse_iteratorIPN3map5PointEE4baseB6v15006Ev
	mov	x8, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	subs	x8, x0, x8
	cset	w8, ne
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE7destroyB6v15006IS3_vvEEvRS4_PT_ ; -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE7destroyB6v15006IS3_vvEEvRS4_PT_
	.weak_definition	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE7destroyB6v15006IS3_vvEEvRS4_PT_
	.p2align	2
__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE7destroyB6v15006IS3_vvEEvRS4_PT_: ; @_ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE7destroyB6v15006IS3_vvEEvRS4_PT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp]
	bl	__ZNSt3__110destroy_atB6v15006IN3map5PointELi0EEEvPT_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112__to_addressB6v15006INS_16reverse_iteratorIPN3map5PointEEEvEENS_5decayIDTclsr19__to_address_helperIT_EE6__callcl7declvalIRKS7_EEEEE4typeES9_ ; -- Begin function _ZNSt3__112__to_addressB6v15006INS_16reverse_iteratorIPN3map5PointEEEvEENS_5decayIDTclsr19__to_address_helperIT_EE6__callcl7declvalIRKS7_EEEEE4typeES9_
	.globl	__ZNSt3__112__to_addressB6v15006INS_16reverse_iteratorIPN3map5PointEEEvEENS_5decayIDTclsr19__to_address_helperIT_EE6__callcl7declvalIRKS7_EEEEE4typeES9_
	.weak_definition	__ZNSt3__112__to_addressB6v15006INS_16reverse_iteratorIPN3map5PointEEEvEENS_5decayIDTclsr19__to_address_helperIT_EE6__callcl7declvalIRKS7_EEEEE4typeES9_
	.p2align	2
__ZNSt3__112__to_addressB6v15006INS_16reverse_iteratorIPN3map5PointEEEvEENS_5decayIDTclsr19__to_address_helperIT_EE6__callcl7declvalIRKS7_EEEEE4typeES9_: ; @_ZNSt3__112__to_addressB6v15006INS_16reverse_iteratorIPN3map5PointEEEvEENS_5decayIDTclsr19__to_address_helperIT_EE6__callcl7declvalIRKS7_EEEEE4typeES9_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__119__to_address_helperINS_16reverse_iteratorIPN3map5PointEEEvE6__callB6v15006ERKS5_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__116reverse_iteratorIPN3map5PointEEppB6v15006Ev ; -- Begin function _ZNSt3__116reverse_iteratorIPN3map5PointEEppB6v15006Ev
	.globl	__ZNSt3__116reverse_iteratorIPN3map5PointEEppB6v15006Ev
	.weak_definition	__ZNSt3__116reverse_iteratorIPN3map5PointEEppB6v15006Ev
	.p2align	2
__ZNSt3__116reverse_iteratorIPN3map5PointEEppB6v15006Ev: ; @_ZNSt3__116reverse_iteratorIPN3map5PointEEppB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	ldr	x8, [x0, #8]
	subs	x8, x8, #16
	str	x8, [x0, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__116reverse_iteratorIPN3map5PointEE4baseB6v15006Ev ; -- Begin function _ZNKSt3__116reverse_iteratorIPN3map5PointEE4baseB6v15006Ev
	.globl	__ZNKSt3__116reverse_iteratorIPN3map5PointEE4baseB6v15006Ev
	.weak_definition	__ZNKSt3__116reverse_iteratorIPN3map5PointEE4baseB6v15006Ev
	.p2align	2
__ZNKSt3__116reverse_iteratorIPN3map5PointEE4baseB6v15006Ev: ; @_ZNKSt3__116reverse_iteratorIPN3map5PointEE4baseB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x0, [x8, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__110destroy_atB6v15006IN3map5PointELi0EEEvPT_ ; -- Begin function _ZNSt3__110destroy_atB6v15006IN3map5PointELi0EEEvPT_
	.globl	__ZNSt3__110destroy_atB6v15006IN3map5PointELi0EEEvPT_
	.weak_definition	__ZNSt3__110destroy_atB6v15006IN3map5PointELi0EEEvPT_
	.p2align	2
__ZNSt3__110destroy_atB6v15006IN3map5PointELi0EEEvPT_: ; @_ZNSt3__110destroy_atB6v15006IN3map5PointELi0EEEvPT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__112__destroy_atB6v15006IN3map5PointELi0EEEvPT_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112__destroy_atB6v15006IN3map5PointELi0EEEvPT_ ; -- Begin function _ZNSt3__112__destroy_atB6v15006IN3map5PointELi0EEEvPT_
	.globl	__ZNSt3__112__destroy_atB6v15006IN3map5PointELi0EEEvPT_
	.weak_definition	__ZNSt3__112__destroy_atB6v15006IN3map5PointELi0EEEvPT_
	.p2align	2
__ZNSt3__112__destroy_atB6v15006IN3map5PointELi0EEEvPT_: ; @_ZNSt3__112__destroy_atB6v15006IN3map5PointELi0EEEvPT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__119__to_address_helperINS_16reverse_iteratorIPN3map5PointEEEvE6__callB6v15006ERKS5_ ; -- Begin function _ZNSt3__119__to_address_helperINS_16reverse_iteratorIPN3map5PointEEEvE6__callB6v15006ERKS5_
	.globl	__ZNSt3__119__to_address_helperINS_16reverse_iteratorIPN3map5PointEEEvE6__callB6v15006ERKS5_
	.weak_definition	__ZNSt3__119__to_address_helperINS_16reverse_iteratorIPN3map5PointEEEvE6__callB6v15006ERKS5_
	.p2align	2
__ZNSt3__119__to_address_helperINS_16reverse_iteratorIPN3map5PointEEEvE6__callB6v15006ERKS5_: ; @_ZNSt3__119__to_address_helperINS_16reverse_iteratorIPN3map5PointEEEvE6__callB6v15006ERKS5_
Lfunc_begin8:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception8
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
Ltmp59:
	bl	__ZNKSt3__116reverse_iteratorIPN3map5PointEEptB6v15006Ev
	str	x0, [sp]                        ; 8-byte Folded Spill
Ltmp60:
	b	LBB93_1
LBB93_1:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZNSt3__112__to_addressB6v15006IN3map5PointEEEPT_S4_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
LBB93_2:
Ltmp61:
	bl	___clang_call_terminate
Lfunc_end8:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table93:
Lexception8:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase3-Lttbaseref3
Lttbaseref3:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end8-Lcst_begin8
Lcst_begin8:
	.uleb128 Ltmp59-Lfunc_begin8            ; >> Call Site 1 <<
	.uleb128 Ltmp60-Ltmp59                  ;   Call between Ltmp59 and Ltmp60
	.uleb128 Ltmp61-Lfunc_begin8            ;     jumps to Ltmp61
	.byte	1                               ;   On action: 1
Lcst_end8:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase3:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNKSt3__116reverse_iteratorIPN3map5PointEEptB6v15006Ev ; -- Begin function _ZNKSt3__116reverse_iteratorIPN3map5PointEEptB6v15006Ev
	.globl	__ZNKSt3__116reverse_iteratorIPN3map5PointEEptB6v15006Ev
	.weak_definition	__ZNKSt3__116reverse_iteratorIPN3map5PointEEptB6v15006Ev
	.p2align	2
__ZNKSt3__116reverse_iteratorIPN3map5PointEEptB6v15006Ev: ; @_ZNKSt3__116reverse_iteratorIPN3map5PointEEptB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x0, [x8, #8]
	mov	x1, #1
	bl	__ZNSt3__14prevB6v15006IPN3map5PointEEENS_9enable_ifIXsr25__is_cpp17_input_iteratorIT_EE5valueES5_E4typeES5_NS_15iterator_traitsIS5_E15difference_typeE
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__14prevB6v15006IPN3map5PointEEENS_9enable_ifIXsr25__is_cpp17_input_iteratorIT_EE5valueES5_E4typeES5_NS_15iterator_traitsIS5_E15difference_typeE ; -- Begin function _ZNSt3__14prevB6v15006IPN3map5PointEEENS_9enable_ifIXsr25__is_cpp17_input_iteratorIT_EE5valueES5_E4typeES5_NS_15iterator_traitsIS5_E15difference_typeE
	.globl	__ZNSt3__14prevB6v15006IPN3map5PointEEENS_9enable_ifIXsr25__is_cpp17_input_iteratorIT_EE5valueES5_E4typeES5_NS_15iterator_traitsIS5_E15difference_typeE
	.weak_definition	__ZNSt3__14prevB6v15006IPN3map5PointEEENS_9enable_ifIXsr25__is_cpp17_input_iteratorIT_EE5valueES5_E4typeES5_NS_15iterator_traitsIS5_E15difference_typeE
	.p2align	2
__ZNSt3__14prevB6v15006IPN3map5PointEEENS_9enable_ifIXsr25__is_cpp17_input_iteratorIT_EE5valueES5_E4typeES5_NS_15iterator_traitsIS5_E15difference_typeE: ; @_ZNSt3__14prevB6v15006IPN3map5PointEEENS_9enable_ifIXsr25__is_cpp17_input_iteratorIT_EE5valueES5_E4typeES5_NS_15iterator_traitsIS5_E15difference_typeE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x8, x0
	add	x0, sp, #8
	str	x8, [sp, #8]
	str	x1, [sp]
	ldr	x9, [sp]
	mov	x8, #0
	subs	x1, x8, x9
	bl	__ZNSt3__17advanceB6v15006IPN3map5PointEllvEEvRT_T0_
	ldr	x0, [sp, #8]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__17advanceB6v15006IPN3map5PointEllvEEvRT_T0_ ; -- Begin function _ZNSt3__17advanceB6v15006IPN3map5PointEllvEEvRT_T0_
	.globl	__ZNSt3__17advanceB6v15006IPN3map5PointEllvEEvRT_T0_
	.weak_definition	__ZNSt3__17advanceB6v15006IPN3map5PointEllvEEvRT_T0_
	.p2align	2
__ZNSt3__17advanceB6v15006IPN3map5PointEllvEEvRT_T0_: ; @_ZNSt3__17advanceB6v15006IPN3map5PointEllvEEvRT_T0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldr	x0, [sp, #16]
	bl	__ZNSt3__121__convert_to_integralB6v15006El
	str	x0, [sp, #8]
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #8]
	bl	__ZNSt3__19__advanceB6v15006IPN3map5PointEEEvRT_NS_15iterator_traitsIS4_E15difference_typeENS_26random_access_iterator_tagE
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__121__convert_to_integralB6v15006El ; -- Begin function _ZNSt3__121__convert_to_integralB6v15006El
	.globl	__ZNSt3__121__convert_to_integralB6v15006El
	.weak_definition	__ZNSt3__121__convert_to_integralB6v15006El
	.p2align	2
__ZNSt3__121__convert_to_integralB6v15006El: ; @_ZNSt3__121__convert_to_integralB6v15006El
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__19__advanceB6v15006IPN3map5PointEEEvRT_NS_15iterator_traitsIS4_E15difference_typeENS_26random_access_iterator_tagE ; -- Begin function _ZNSt3__19__advanceB6v15006IPN3map5PointEEEvRT_NS_15iterator_traitsIS4_E15difference_typeENS_26random_access_iterator_tagE
	.globl	__ZNSt3__19__advanceB6v15006IPN3map5PointEEEvRT_NS_15iterator_traitsIS4_E15difference_typeENS_26random_access_iterator_tagE
	.weak_definition	__ZNSt3__19__advanceB6v15006IPN3map5PointEEEvRT_NS_15iterator_traitsIS4_E15difference_typeENS_26random_access_iterator_tagE
	.p2align	2
__ZNSt3__19__advanceB6v15006IPN3map5PointEEEvRT_NS_15iterator_traitsIS4_E15difference_typeENS_26random_access_iterator_tagE: ; @_ZNSt3__19__advanceB6v15006IPN3map5PointEEEvRT_NS_15iterator_traitsIS4_E15difference_typeENS_26random_access_iterator_tagE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #16]
	str	x1, [sp, #8]
	ldr	x10, [sp, #8]
	ldr	x9, [sp, #16]
	ldr	x8, [x9]
	add	x8, x8, x10, lsl #4
	str	x8, [x9]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__116reverse_iteratorIPN3map5PointEEC2B6v15006ES3_ ; -- Begin function _ZNSt3__116reverse_iteratorIPN3map5PointEEC2B6v15006ES3_
	.globl	__ZNSt3__116reverse_iteratorIPN3map5PointEEC2B6v15006ES3_
	.weak_def_can_be_hidden	__ZNSt3__116reverse_iteratorIPN3map5PointEEC2B6v15006ES3_
	.p2align	2
__ZNSt3__116reverse_iteratorIPN3map5PointEEC2B6v15006ES3_: ; @_ZNSt3__116reverse_iteratorIPN3map5PointEEC2B6v15006ES3_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x8, [sp]
	str	x8, [x0]
	ldr	x8, [sp]
	str	x8, [x0, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionD2Ev ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionD2Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionD2Ev
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionD2Ev: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionD2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	ldr	x8, [x0, #8]
	ldr	x9, [x0]
	str	x8, [x9, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED2B6v15006Ev ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED2B6v15006Ev
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED2B6v15006Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED2B6v15006Ev
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED2B6v15006Ev: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED2B6v15006Ev
Lfunc_begin9:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception9
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	ldur	x0, [x29, #-16]
	str	x0, [sp, #24]                   ; 8-byte Folded Spill
	mov	x8, x0
	stur	x8, [x29, #-8]
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE17__annotate_deleteB6v15006Ev
	ldr	x0, [sp, #24]                   ; 8-byte Folded Reload
Ltmp66:
	bl	__ZNSt3__118__debug_db_erase_cB6v15006INS_6vectorIN3map5PointENS_9allocatorIS3_EEEEEEvPT_
Ltmp67:
	b	LBB101_1
LBB101_1:
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x8, [x8]
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB101_3
	b	LBB101_2
LBB101_2:
	ldr	x0, [sp, #24]                   ; 8-byte Folded Reload
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__clearB6v15006Ev
	ldr	x0, [sp, #24]                   ; 8-byte Folded Reload
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__allocB6v15006Ev
	mov	x1, x0
	ldr	x0, [sp, #24]                   ; 8-byte Folded Reload
	str	x1, [sp, #16]                   ; 8-byte Folded Spill
	ldr	x8, [x0]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE8capacityB6v15006Ev
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	mov	x2, x0
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE10deallocateB6v15006ERS4_PS3_m
	b	LBB101_3
LBB101_3:
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB101_4:
Ltmp68:
	bl	___clang_call_terminate
Lfunc_end9:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table101:
Lexception9:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase4-Lttbaseref4
Lttbaseref4:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end9-Lcst_begin9
Lcst_begin9:
	.uleb128 Ltmp66-Lfunc_begin9            ; >> Call Site 1 <<
	.uleb128 Ltmp67-Ltmp66                  ;   Call between Ltmp66 and Ltmp67
	.uleb128 Ltmp68-Lfunc_begin9            ;     jumps to Ltmp68
	.byte	1                               ;   On action: 1
Lcst_end9:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase4:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE17__annotate_deleteB6v15006Ev ; -- Begin function _ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE17__annotate_deleteB6v15006Ev
	.globl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE17__annotate_deleteB6v15006Ev
	.weak_definition	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE17__annotate_deleteB6v15006Ev
	.p2align	2
__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE17__annotate_deleteB6v15006Ev: ; @_ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE17__annotate_deleteB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x0, [x29, #-8]
	stur	x0, [x29, #-16]                 ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4dataB6v15006Ev
	mov	x1, x0
	ldur	x0, [x29, #-16]                 ; 8-byte Folded Reload
	str	x1, [sp]                        ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4dataB6v15006Ev
	mov	x8, x0
	ldur	x0, [x29, #-16]                 ; 8-byte Folded Reload
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE8capacityB6v15006Ev
	mov	x8, x0
	ldur	x0, [x29, #-16]                 ; 8-byte Folded Reload
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4dataB6v15006Ev
	mov	x8, x0
	ldur	x0, [x29, #-16]                 ; 8-byte Folded Reload
	str	x8, [sp, #32]                   ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4sizeB6v15006Ev
	mov	x8, x0
	ldur	x0, [x29, #-16]                 ; 8-byte Folded Reload
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE4dataB6v15006Ev
	mov	x8, x0
	ldur	x0, [x29, #-16]                 ; 8-byte Folded Reload
	stur	x8, [x29, #-24]                 ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE8capacityB6v15006Ev
	ldr	x1, [sp]                        ; 8-byte Folded Reload
	ldr	x13, [sp, #8]                   ; 8-byte Folded Reload
	ldr	x12, [sp, #16]                  ; 8-byte Folded Reload
	ldr	x11, [sp, #24]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #32]                  ; 8-byte Folded Reload
	ldur	x8, [x29, #-24]                 ; 8-byte Folded Reload
	mov	x9, x0
	ldur	x0, [x29, #-16]                 ; 8-byte Folded Reload
	add	x2, x12, x13, lsl #4
	add	x3, x10, x11, lsl #4
	add	x4, x8, x9, lsl #4
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE31__annotate_contiguous_containerB6v15006EPKvS7_S7_S7_
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__118__debug_db_erase_cB6v15006INS_6vectorIN3map5PointENS_9allocatorIS3_EEEEEEvPT_ ; -- Begin function _ZNSt3__118__debug_db_erase_cB6v15006INS_6vectorIN3map5PointENS_9allocatorIS3_EEEEEEvPT_
	.globl	__ZNSt3__118__debug_db_erase_cB6v15006INS_6vectorIN3map5PointENS_9allocatorIS3_EEEEEEvPT_
	.weak_definition	__ZNSt3__118__debug_db_erase_cB6v15006INS_6vectorIN3map5PointENS_9allocatorIS3_EEEEEEvPT_
	.p2align	2
__ZNSt3__118__debug_db_erase_cB6v15006INS_6vectorIN3map5PointENS_9allocatorIS3_EEEEEEvPT_: ; @_ZNSt3__118__debug_db_erase_cB6v15006INS_6vectorIN3map5PointENS_9allocatorIS3_EEEEEEvPT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__clearB6v15006Ev ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__clearB6v15006Ev
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__clearB6v15006Ev
	.weak_definition	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__clearB6v15006Ev
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__clearB6v15006Ev: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__clearB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	ldr	x1, [x0]
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE22__base_destruct_at_endB6v15006EPS2_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE10deallocateB6v15006ERS4_PS3_m ; -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE10deallocateB6v15006ERS4_PS3_m
	.globl	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE10deallocateB6v15006ERS4_PS3_m
	.weak_definition	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE10deallocateB6v15006ERS4_PS3_m
	.p2align	2
__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE10deallocateB6v15006ERS4_PS3_m: ; @_ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE10deallocateB6v15006ERS4_PS3_m
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	bl	__ZNSt3__19allocatorIN3map5PointEE10deallocateB6v15006EPS2_m
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE22__base_destruct_at_endB6v15006EPS2_ ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE22__base_destruct_at_endB6v15006EPS2_
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE22__base_destruct_at_endB6v15006EPS2_
	.weak_definition	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE22__base_destruct_at_endB6v15006EPS2_
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE22__base_destruct_at_endB6v15006EPS2_: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE22__base_destruct_at_endB6v15006EPS2_
Lfunc_begin10:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception10
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	x8, [x29, #-8]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	ldr	x8, [x8, #8]
	str	x8, [sp, #24]
	b	LBB106_1
LBB106_1:                               ; =>This Inner Loop Header: Depth=1
	ldur	x8, [x29, #-16]
	ldr	x9, [sp, #24]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB106_4
	b	LBB106_2
LBB106_2:                               ;   in Loop: Header=BB106_1 Depth=1
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__allocB6v15006Ev
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x8, [sp, #24]
	subs	x0, x8, #16
	str	x0, [sp, #24]
	bl	__ZNSt3__112__to_addressB6v15006IN3map5PointEEEPT_S4_
	mov	x1, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
Ltmp70:
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE7destroyB6v15006IS3_vvEEvRS4_PT_
Ltmp71:
	b	LBB106_3
LBB106_3:                               ;   in Loop: Header=BB106_1 Depth=1
	b	LBB106_1
LBB106_4:
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldur	x8, [x29, #-16]
	str	x8, [x9, #8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB106_5:
Ltmp72:
	bl	___clang_call_terminate
Lfunc_end10:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table106:
Lexception10:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase5-Lttbaseref5
Lttbaseref5:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end10-Lcst_begin10
Lcst_begin10:
	.uleb128 Ltmp70-Lfunc_begin10           ; >> Call Site 1 <<
	.uleb128 Ltmp71-Ltmp70                  ;   Call between Ltmp70 and Ltmp71
	.uleb128 Ltmp72-Lfunc_begin10           ;     jumps to Ltmp72
	.byte	1                               ;   On action: 1
Lcst_end10:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase5:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__19allocatorIN3map5PointEE10deallocateB6v15006EPS2_m ; -- Begin function _ZNSt3__19allocatorIN3map5PointEE10deallocateB6v15006EPS2_m
	.globl	__ZNSt3__19allocatorIN3map5PointEE10deallocateB6v15006EPS2_m
	.weak_definition	__ZNSt3__19allocatorIN3map5PointEE10deallocateB6v15006EPS2_m
	.p2align	2
__ZNSt3__19allocatorIN3map5PointEE10deallocateB6v15006EPS2_m: ; @_ZNSt3__19allocatorIN3map5PointEE10deallocateB6v15006EPS2_m
Lfunc_begin11:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception11
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldr	x0, [sp, #16]
	ldr	x8, [sp, #8]
	lsl	x1, x8, #4
Ltmp73:
	mov	x2, #8
	bl	__ZNSt3__119__libcpp_deallocateB6v15006EPvmm
Ltmp74:
	b	LBB107_1
LBB107_1:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB107_2:
Ltmp75:
	bl	___clang_call_terminate
Lfunc_end11:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table107:
Lexception11:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase6-Lttbaseref6
Lttbaseref6:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end11-Lcst_begin11
Lcst_begin11:
	.uleb128 Ltmp73-Lfunc_begin11           ; >> Call Site 1 <<
	.uleb128 Ltmp74-Ltmp73                  ;   Call between Ltmp73 and Ltmp74
	.uleb128 Ltmp75-Lfunc_begin11           ;     jumps to Ltmp75
	.byte	1                               ;   On action: 1
Lcst_end11:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase6:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__119__libcpp_deallocateB6v15006EPvmm ; -- Begin function _ZNSt3__119__libcpp_deallocateB6v15006EPvmm
	.globl	__ZNSt3__119__libcpp_deallocateB6v15006EPvmm
	.weak_definition	__ZNSt3__119__libcpp_deallocateB6v15006EPvmm
	.p2align	2
__ZNSt3__119__libcpp_deallocateB6v15006EPvmm: ; @_ZNSt3__119__libcpp_deallocateB6v15006EPvmm
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__124__is_overaligned_for_newB6v15006Em
	tbz	w0, #0, LBB108_2
	b	LBB108_1
LBB108_1:
	ldr	x8, [sp, #8]
	str	x8, [sp]
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #16]
	ldr	x2, [sp]
	bl	__ZNSt3__127__do_deallocate_handle_sizeB6v15006IJSt11align_val_tEEEvPvmDpT_
	b	LBB108_3
LBB108_2:
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #16]
	bl	__ZNSt3__127__do_deallocate_handle_sizeB6v15006IJEEEvPvmDpT_
	b	LBB108_3
LBB108_3:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__127__do_deallocate_handle_sizeB6v15006IJSt11align_val_tEEEvPvmDpT_ ; -- Begin function _ZNSt3__127__do_deallocate_handle_sizeB6v15006IJSt11align_val_tEEEvPvmDpT_
	.globl	__ZNSt3__127__do_deallocate_handle_sizeB6v15006IJSt11align_val_tEEEvPvmDpT_
	.weak_definition	__ZNSt3__127__do_deallocate_handle_sizeB6v15006IJSt11align_val_tEEEvPvmDpT_
	.p2align	2
__ZNSt3__127__do_deallocate_handle_sizeB6v15006IJSt11align_val_tEEEvPvmDpT_: ; @_ZNSt3__127__do_deallocate_handle_sizeB6v15006IJSt11align_val_tEEEvPvmDpT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #8]
	bl	__ZNSt3__124__libcpp_operator_deleteB6v15006IJPvSt11align_val_tEEEvDpT_
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__127__do_deallocate_handle_sizeB6v15006IJEEEvPvmDpT_ ; -- Begin function _ZNSt3__127__do_deallocate_handle_sizeB6v15006IJEEEvPvmDpT_
	.globl	__ZNSt3__127__do_deallocate_handle_sizeB6v15006IJEEEvPvmDpT_
	.weak_definition	__ZNSt3__127__do_deallocate_handle_sizeB6v15006IJEEEvPvmDpT_
	.p2align	2
__ZNSt3__127__do_deallocate_handle_sizeB6v15006IJEEEvPvmDpT_: ; @_ZNSt3__127__do_deallocate_handle_sizeB6v15006IJEEEvPvmDpT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__124__libcpp_operator_deleteB6v15006IJPvEEEvDpT_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__124__libcpp_operator_deleteB6v15006IJPvSt11align_val_tEEEvDpT_ ; -- Begin function _ZNSt3__124__libcpp_operator_deleteB6v15006IJPvSt11align_val_tEEEvDpT_
	.globl	__ZNSt3__124__libcpp_operator_deleteB6v15006IJPvSt11align_val_tEEEvDpT_
	.weak_definition	__ZNSt3__124__libcpp_operator_deleteB6v15006IJPvSt11align_val_tEEEvDpT_
	.p2align	2
__ZNSt3__124__libcpp_operator_deleteB6v15006IJPvSt11align_val_tEEEvDpT_: ; @_ZNSt3__124__libcpp_operator_deleteB6v15006IJPvSt11align_val_tEEEvDpT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x1, [sp]
	bl	__ZdlPvSt11align_val_t
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__124__libcpp_operator_deleteB6v15006IJPvEEEvDpT_ ; -- Begin function _ZNSt3__124__libcpp_operator_deleteB6v15006IJPvEEEvDpT_
	.globl	__ZNSt3__124__libcpp_operator_deleteB6v15006IJPvEEEvDpT_
	.weak_definition	__ZNSt3__124__libcpp_operator_deleteB6v15006IJPvEEEvDpT_
	.p2align	2
__ZNSt3__124__libcpp_operator_deleteB6v15006IJPvEEEvDpT_: ; @_ZNSt3__124__libcpp_operator_deleteB6v15006IJPvEEEvDpT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map5PointplES0_            ; -- Begin function _ZN3map5PointplES0_
	.weak_definition	__ZN3map5PointplES0_
	.p2align	2
__ZN3map5PointplES0_:                   ; @_ZN3map5PointplES0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	d0, [sp, #16]
	str	d1, [sp, #24]
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	d0, [x8]
	ldr	d1, [sp, #16]
	fadd	d0, d0, d1
	ldr	d1, [x8, #8]
	ldr	d2, [sp, #24]
	fadd	d1, d1, d2
	sub	x0, x29, #16
	bl	__ZN3map5PointC1Edd
	ldur	d0, [x29, #-16]
	ldur	d1, [x29, #-8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map5PointC1Edd             ; -- Begin function _ZN3map5PointC1Edd
	.weak_def_can_be_hidden	__ZN3map5PointC1Edd
	.p2align	2
__ZN3map5PointC1Edd:                    ; @_ZN3map5PointC1Edd
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	d0, [sp, #16]
	str	d1, [sp, #8]
	ldur	x0, [x29, #-8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	ldr	d0, [sp, #16]
	ldr	d1, [sp, #8]
	bl	__ZN3map5PointC2Edd
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map5PointC2Edd             ; -- Begin function _ZN3map5PointC2Edd
	.weak_def_can_be_hidden	__ZN3map5PointC2Edd
	.p2align	2
__ZN3map5PointC2Edd:                    ; @_ZN3map5PointC2Edd
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	d0, [sp, #16]
	str	d1, [sp, #8]
	ldr	x0, [sp, #24]
	ldr	d0, [sp, #16]
	str	d0, [x0]
	ldr	d0, [sp, #8]
	str	d0, [x0, #8]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map6shapes7EllipseD2Ev     ; -- Begin function _ZN3map6shapes7EllipseD2Ev
	.weak_def_can_be_hidden	__ZN3map6shapes7EllipseD2Ev
	.p2align	2
__ZN3map6shapes7EllipseD2Ev:            ; @_ZN3map6shapes7EllipseD2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN3map6shapes5ShapeD2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map6shapes5ShapeD2Ev       ; -- Begin function _ZN3map6shapes5ShapeD2Ev
	.weak_def_can_be_hidden	__ZN3map6shapes5ShapeD2Ev
	.p2align	2
__ZN3map6shapes5ShapeD2Ev:              ; @_ZN3map6shapes5ShapeD2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, __ZTVN3map6shapes5ShapeE@GOTPAGE
	ldr	x8, [x8, __ZTVN3map6shapes5ShapeE@GOTPAGEOFF]
	add	x9, x8, #16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	str	x9, [x8]
	add	x0, x8, #40
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED1B6v15006Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map6shapes7EllipseC1ERKS1_ ; -- Begin function _ZN3map6shapes7EllipseC1ERKS1_
	.weak_def_can_be_hidden	__ZN3map6shapes7EllipseC1ERKS1_
	.p2align	2
__ZN3map6shapes7EllipseC1ERKS1_:        ; @_ZN3map6shapes7EllipseC1ERKS1_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	bl	__ZN3map6shapes7EllipseC2ERKS1_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEEC1B6v15006ILb1EvEEPS3_ ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEEC1B6v15006ILb1EvEEPS3_
	.weak_def_can_be_hidden	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEEC1B6v15006ILb1EvEEPS3_
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEEC1B6v15006ILb1EvEEPS3_: ; @_ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEEC1B6v15006ILb1EvEEPS3_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	bl	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEEC2B6v15006ILb1EvEEPS3_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map6shapes7EllipseC2ERKS1_ ; -- Begin function _ZN3map6shapes7EllipseC2ERKS1_
	.weak_def_can_be_hidden	__ZN3map6shapes7EllipseC2ERKS1_
	.p2align	2
__ZN3map6shapes7EllipseC2ERKS1_:        ; @_ZN3map6shapes7EllipseC2ERKS1_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, __ZTVN3map6shapes7EllipseE@PAGE
	add	x8, x8, __ZTVN3map6shapes7EllipseE@PAGEOFF
	add	x8, x8, #16
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	bl	__ZN3map6shapes5ShapeC2ERKS1_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	str	x8, [x0]
	ldr	x8, [sp, #16]
	ldr	q0, [x8, #64]
	str	q0, [x0, #64]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map6shapes5ShapeC2ERKS1_   ; -- Begin function _ZN3map6shapes5ShapeC2ERKS1_
	.weak_def_can_be_hidden	__ZN3map6shapes5ShapeC2ERKS1_
	.p2align	2
__ZN3map6shapes5ShapeC2ERKS1_:          ; @_ZN3map6shapes5ShapeC2ERKS1_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, __ZTVN3map6shapes5ShapeE@GOTPAGE
	ldr	x8, [x8, __ZTVN3map6shapes5ShapeE@GOTPAGEOFF]
	add	x8, x8, #16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x9, [x29, #-8]
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	str	x8, [x9]
	ldr	x8, [sp, #16]
	ldur	q0, [x8, #8]
	stur	q0, [x9, #8]
	ldur	q0, [x8, #20]
	stur	q0, [x9, #20]
	ldr	x8, [sp, #16]
	add	x0, x9, #40
	add	x1, x8, #40
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1ERKS5_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEEC2B6v15006ILb1EvEEPS3_ ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEEC2B6v15006ILb1EvEEPS3_
	.weak_def_can_be_hidden	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEEC2B6v15006ILb1EvEEPS3_
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEEC2B6v15006ILb1EvEEPS3_: ; @_ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEEC2B6v15006ILb1EvEEPS3_
Lfunc_begin12:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception12
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x8, x1
	stur	x0, [x29, #-8]
	add	x1, sp, #16
	str	x8, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp]                        ; 8-byte Folded Spill
Ltmp77:
	add	x2, sp, #15
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEEC1B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_
Ltmp78:
	b	LBB122_1
LBB122_1:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB122_2:
Ltmp79:
	bl	___clang_call_terminate
Lfunc_end12:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table122:
Lexception12:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase7-Lttbaseref7
Lttbaseref7:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end12-Lcst_begin12
Lcst_begin12:
	.uleb128 Ltmp77-Lfunc_begin12           ; >> Call Site 1 <<
	.uleb128 Ltmp78-Ltmp77                  ;   Call between Ltmp77 and Ltmp78
	.uleb128 Ltmp79-Lfunc_begin12           ;     jumps to Ltmp79
	.byte	1                               ;   On action: 1
Lcst_end12:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase7:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEEC1B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_ ; -- Begin function _ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEEC1B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_
	.weak_def_can_be_hidden	__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEEC1B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEEC1B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_: ; @_ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEEC1B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldur	x0, [x29, #-8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEEC2B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEEC2B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_ ; -- Begin function _ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEEC2B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_
	.weak_def_can_be_hidden	__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEEC2B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEEC2B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_: ; @_ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEEC2B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	str	x2, [sp, #24]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldur	x1, [x29, #-16]
	bl	__ZNSt3__122__compressed_pair_elemIPN3map6shapes7EllipseELi0ELb0EEC2B6v15006IRS4_vEEOT_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes7EllipseEEELi1ELb1EEC2B6v15006ENS_16__value_init_tagE
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__122__compressed_pair_elemIPN3map6shapes7EllipseELi0ELb0EEC2B6v15006IRS4_vEEOT_ ; -- Begin function _ZNSt3__122__compressed_pair_elemIPN3map6shapes7EllipseELi0ELb0EEC2B6v15006IRS4_vEEOT_
	.weak_def_can_be_hidden	__ZNSt3__122__compressed_pair_elemIPN3map6shapes7EllipseELi0ELb0EEC2B6v15006IRS4_vEEOT_
	.p2align	2
__ZNSt3__122__compressed_pair_elemIPN3map6shapes7EllipseELi0ELb0EEC2B6v15006IRS4_vEEOT_: ; @_ZNSt3__122__compressed_pair_elemIPN3map6shapes7EllipseELi0ELb0EEC2B6v15006IRS4_vEEOT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x8, [sp]
	ldr	x8, [x8]
	str	x8, [x0]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes7EllipseEEELi1ELb1EEC2B6v15006ENS_16__value_init_tagE ; -- Begin function _ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes7EllipseEEELi1ELb1EEC2B6v15006ENS_16__value_init_tagE
	.globl	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes7EllipseEEELi1ELb1EEC2B6v15006ENS_16__value_init_tagE
	.weak_def_can_be_hidden	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes7EllipseEEELi1ELb1EEC2B6v15006ENS_16__value_init_tagE
	.p2align	2
__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes7EllipseEEELi1ELb1EEC2B6v15006ENS_16__value_init_tagE: ; @_ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes7EllipseEEELi1ELb1EEC2B6v15006ENS_16__value_init_tagE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x0, [sp]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEED2B6v15006Ev ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEED2B6v15006Ev
	.globl	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEED2B6v15006Ev
	.weak_def_can_be_hidden	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEED2B6v15006Ev
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEED2B6v15006Ev: ; @_ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEED2B6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	mov	x1, #0
	bl	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE5resetB6v15006EPS3_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE5resetB6v15006EPS3_ ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE5resetB6v15006EPS3_
	.globl	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE5resetB6v15006EPS3_
	.weak_definition	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE5resetB6v15006EPS3_
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE5resetB6v15006EPS3_: ; @_ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE5resetB6v15006EPS3_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEE5firstB6v15006Ev
	mov	x8, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [x8]
	str	x8, [sp, #24]
	ldur	x8, [x29, #-16]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEE5firstB6v15006Ev
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	str	x8, [x0]
	ldr	x8, [sp, #24]
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB128_2
	b	LBB128_1
LBB128_1:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEE6secondB6v15006Ev
	ldr	x1, [sp, #24]
	bl	__ZNKSt3__114default_deleteIN3map6shapes7EllipseEEclB6v15006EPS3_
	b	LBB128_2
LBB128_2:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEE5firstB6v15006Ev ; -- Begin function _ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEE5firstB6v15006Ev
	.globl	__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEE5firstB6v15006Ev
	.weak_definition	__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEE5firstB6v15006Ev
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEE5firstB6v15006Ev: ; @_ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEE5firstB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__122__compressed_pair_elemIPN3map6shapes7EllipseELi0ELb0EE5__getB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEE6secondB6v15006Ev ; -- Begin function _ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEE6secondB6v15006Ev
	.globl	__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEE6secondB6v15006Ev
	.weak_definition	__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEE6secondB6v15006Ev
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEE6secondB6v15006Ev: ; @_ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEE6secondB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes7EllipseEEELi1ELb1EE5__getB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__114default_deleteIN3map6shapes7EllipseEEclB6v15006EPS3_ ; -- Begin function _ZNKSt3__114default_deleteIN3map6shapes7EllipseEEclB6v15006EPS3_
	.globl	__ZNKSt3__114default_deleteIN3map6shapes7EllipseEEclB6v15006EPS3_
	.weak_definition	__ZNKSt3__114default_deleteIN3map6shapes7EllipseEEclB6v15006EPS3_
	.p2align	2
__ZNKSt3__114default_deleteIN3map6shapes7EllipseEEclB6v15006EPS3_: ; @_ZNKSt3__114default_deleteIN3map6shapes7EllipseEEclB6v15006EPS3_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldr	x8, [sp, #16]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB131_2
	b	LBB131_1
LBB131_1:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	blr	x8
	b	LBB131_2
LBB131_2:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__122__compressed_pair_elemIPN3map6shapes7EllipseELi0ELb0EE5__getB6v15006Ev ; -- Begin function _ZNSt3__122__compressed_pair_elemIPN3map6shapes7EllipseELi0ELb0EE5__getB6v15006Ev
	.globl	__ZNSt3__122__compressed_pair_elemIPN3map6shapes7EllipseELi0ELb0EE5__getB6v15006Ev
	.weak_definition	__ZNSt3__122__compressed_pair_elemIPN3map6shapes7EllipseELi0ELb0EE5__getB6v15006Ev
	.p2align	2
__ZNSt3__122__compressed_pair_elemIPN3map6shapes7EllipseELi0ELb0EE5__getB6v15006Ev: ; @_ZNSt3__122__compressed_pair_elemIPN3map6shapes7EllipseELi0ELb0EE5__getB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes7EllipseEEELi1ELb1EE5__getB6v15006Ev ; -- Begin function _ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes7EllipseEEELi1ELb1EE5__getB6v15006Ev
	.globl	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes7EllipseEEELi1ELb1EE5__getB6v15006Ev
	.weak_definition	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes7EllipseEEELi1ELb1EE5__getB6v15006Ev
	.p2align	2
__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes7EllipseEEELi1ELb1EE5__getB6v15006Ev: ; @_ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes7EllipseEEELi1ELb1EE5__getB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006INS2_7EllipseENS4_IS8_EEvvEEONS0_IT_T0_EE ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006INS2_7EllipseENS4_IS8_EEvvEEONS0_IT_T0_EE
	.weak_def_can_be_hidden	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006INS2_7EllipseENS4_IS8_EEvvEEONS0_IT_T0_EE
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006INS2_7EllipseENS4_IS8_EEvvEEONS0_IT_T0_EE: ; @_ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006INS2_7EllipseENS4_IS8_EEvvEEONS0_IT_T0_EE
Lfunc_begin13:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception13
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	x8, [x29, #-8]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	ldur	x0, [x29, #-16]
	bl	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE7releaseB6v15006Ev
	add	x8, sp, #24
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	str	x0, [sp, #24]
	ldur	x0, [x29, #-16]
	bl	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE11get_deleterB6v15006Ev
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	mov	x2, x0
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
Ltmp84:
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006IPNS2_7EllipseENS5_IS9_EEEEOT_OT0_
Ltmp85:
	b	LBB134_1
LBB134_1:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB134_2:
Ltmp86:
	bl	___clang_call_terminate
Lfunc_end13:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table134:
Lexception13:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase8-Lttbaseref8
Lttbaseref8:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end13-Lcst_begin13
Lcst_begin13:
	.uleb128 Ltmp84-Lfunc_begin13           ; >> Call Site 1 <<
	.uleb128 Ltmp85-Ltmp84                  ;   Call between Ltmp84 and Ltmp85
	.uleb128 Ltmp86-Lfunc_begin13           ;     jumps to Ltmp86
	.byte	1                               ;   On action: 1
Lcst_end13:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase8:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE7releaseB6v15006Ev ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE7releaseB6v15006Ev
	.globl	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE7releaseB6v15006Ev
	.weak_definition	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE7releaseB6v15006Ev
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE7releaseB6v15006Ev: ; @_ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE7releaseB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEE5firstB6v15006Ev
	mov	x8, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [x8]
	str	x8, [sp, #16]
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEE5firstB6v15006Ev
                                        ; kill: def $x8 killed $xzr
	str	xzr, [x0]
	ldr	x0, [sp, #16]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE11get_deleterB6v15006Ev ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE11get_deleterB6v15006Ev
	.globl	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE11get_deleterB6v15006Ev
	.weak_definition	__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE11get_deleterB6v15006Ev
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE11get_deleterB6v15006Ev: ; @_ZNSt3__110unique_ptrIN3map6shapes7EllipseENS_14default_deleteIS3_EEE11get_deleterB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes7EllipseENS_14default_deleteIS3_EEE6secondB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006IPNS2_7EllipseENS5_IS9_EEEEOT_OT0_ ; -- Begin function _ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006IPNS2_7EllipseENS5_IS9_EEEEOT_OT0_
	.weak_def_can_be_hidden	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006IPNS2_7EllipseENS5_IS9_EEEEOT_OT0_
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006IPNS2_7EllipseENS5_IS9_EEEEOT_OT0_: ; @_ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006IPNS2_7EllipseENS5_IS9_EEEEOT_OT0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldur	x0, [x29, #-8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006IPNS2_7EllipseENS5_IS9_EEEEOT_OT0_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006IPNS2_7EllipseENS5_IS9_EEEEOT_OT0_ ; -- Begin function _ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006IPNS2_7EllipseENS5_IS9_EEEEOT_OT0_
	.weak_def_can_be_hidden	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006IPNS2_7EllipseENS5_IS9_EEEEOT_OT0_
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006IPNS2_7EllipseENS5_IS9_EEEEOT_OT0_: ; @_ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006IPNS2_7EllipseENS5_IS9_EEEEOT_OT0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldur	x0, [x29, #-8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	bl	__ZNSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EEC2B6v15006IPNS2_7EllipseEvEEOT_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldr	x1, [sp, #8]
	bl	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes5ShapeEEELi1ELb1EEC2B6v15006INS1_INS3_7EllipseEEEvEEOT_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EEC2B6v15006IPNS2_7EllipseEvEEOT_ ; -- Begin function _ZNSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EEC2B6v15006IPNS2_7EllipseEvEEOT_
	.weak_def_can_be_hidden	__ZNSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EEC2B6v15006IPNS2_7EllipseEvEEOT_
	.p2align	2
__ZNSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EEC2B6v15006IPNS2_7EllipseEvEEOT_: ; @_ZNSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EEC2B6v15006IPNS2_7EllipseEvEEOT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x8, [sp]
	ldr	x8, [x8]
	str	x8, [x0]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes5ShapeEEELi1ELb1EEC2B6v15006INS1_INS3_7EllipseEEEvEEOT_ ; -- Begin function _ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes5ShapeEEELi1ELb1EEC2B6v15006INS1_INS3_7EllipseEEEvEEOT_
	.weak_def_can_be_hidden	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes5ShapeEEELi1ELb1EEC2B6v15006INS1_INS3_7EllipseEEEvEEOT_
	.p2align	2
__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes5ShapeEEELi1ELb1EEC2B6v15006INS1_INS3_7EllipseEEEvEEOT_: ; @_ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes5ShapeEEELi1ELb1EEC2B6v15006INS1_INS3_7EllipseEEEvEEOT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	mov	x2, #0
	bl	__ZNSt3__114default_deleteIN3map6shapes5ShapeEEC2B6v15006INS2_7EllipseEEERKNS0_IT_EEPNS_9enable_ifIXsr14is_convertibleIPS7_PS3_EE5valueEvE4typeE
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__114default_deleteIN3map6shapes5ShapeEEC2B6v15006INS2_7EllipseEEERKNS0_IT_EEPNS_9enable_ifIXsr14is_convertibleIPS7_PS3_EE5valueEvE4typeE ; -- Begin function _ZNSt3__114default_deleteIN3map6shapes5ShapeEEC2B6v15006INS2_7EllipseEEERKNS0_IT_EEPNS_9enable_ifIXsr14is_convertibleIPS7_PS3_EE5valueEvE4typeE
	.weak_def_can_be_hidden	__ZNSt3__114default_deleteIN3map6shapes5ShapeEEC2B6v15006INS2_7EllipseEEERKNS0_IT_EEPNS_9enable_ifIXsr14is_convertibleIPS7_PS3_EE5valueEvE4typeE
	.p2align	2
__ZNSt3__114default_deleteIN3map6shapes5ShapeEEC2B6v15006INS2_7EllipseEEERKNS0_IT_EEPNS_9enable_ifIXsr14is_convertibleIPS7_PS3_EE5valueEvE4typeE: ; @_ZNSt3__114default_deleteIN3map6shapes5ShapeEEC2B6v15006INS2_7EllipseEEERKNS0_IT_EEPNS_9enable_ifIXsr14is_convertibleIPS7_PS3_EE5valueEvE4typeE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldr	x0, [sp, #24]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEED2B6v15006Ev ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEED2B6v15006Ev
	.globl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEED2B6v15006Ev
	.weak_def_can_be_hidden	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEED2B6v15006Ev
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEED2B6v15006Ev: ; @_ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEED2B6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	mov	x1, #0
	bl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEE5resetB6v15006EPS3_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEE5resetB6v15006EPS3_ ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEE5resetB6v15006EPS3_
	.globl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEE5resetB6v15006EPS3_
	.weak_definition	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEE5resetB6v15006EPS3_
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEE5resetB6v15006EPS3_: ; @_ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEE5resetB6v15006EPS3_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE5firstB6v15006Ev
	mov	x8, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [x8]
	str	x8, [sp, #24]
	ldur	x8, [x29, #-16]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE5firstB6v15006Ev
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	str	x8, [x0]
	ldr	x8, [sp, #24]
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB143_2
	b	LBB143_1
LBB143_1:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE6secondB6v15006Ev
	ldr	x1, [sp, #24]
	bl	__ZNKSt3__114default_deleteIN3map6shapes5ShapeEEclB6v15006EPS3_
	b	LBB143_2
LBB143_2:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE5firstB6v15006Ev ; -- Begin function _ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE5firstB6v15006Ev
	.globl	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE5firstB6v15006Ev
	.weak_definition	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE5firstB6v15006Ev
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE5firstB6v15006Ev: ; @_ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE5firstB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EE5__getB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE6secondB6v15006Ev ; -- Begin function _ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE6secondB6v15006Ev
	.globl	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE6secondB6v15006Ev
	.weak_definition	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE6secondB6v15006Ev
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE6secondB6v15006Ev: ; @_ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE6secondB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes5ShapeEEELi1ELb1EE5__getB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__114default_deleteIN3map6shapes5ShapeEEclB6v15006EPS3_ ; -- Begin function _ZNKSt3__114default_deleteIN3map6shapes5ShapeEEclB6v15006EPS3_
	.globl	__ZNKSt3__114default_deleteIN3map6shapes5ShapeEEclB6v15006EPS3_
	.weak_definition	__ZNKSt3__114default_deleteIN3map6shapes5ShapeEEclB6v15006EPS3_
	.p2align	2
__ZNKSt3__114default_deleteIN3map6shapes5ShapeEEclB6v15006EPS3_: ; @_ZNKSt3__114default_deleteIN3map6shapes5ShapeEEclB6v15006EPS3_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldr	x8, [sp, #16]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB146_2
	b	LBB146_1
LBB146_1:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	blr	x8
	b	LBB146_2
LBB146_2:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EE5__getB6v15006Ev ; -- Begin function _ZNSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EE5__getB6v15006Ev
	.globl	__ZNSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EE5__getB6v15006Ev
	.weak_definition	__ZNSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EE5__getB6v15006Ev
	.p2align	2
__ZNSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EE5__getB6v15006Ev: ; @_ZNSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EE5__getB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes5ShapeEEELi1ELb1EE5__getB6v15006Ev ; -- Begin function _ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes5ShapeEEELi1ELb1EE5__getB6v15006Ev
	.globl	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes5ShapeEEELi1ELb1EE5__getB6v15006Ev
	.weak_definition	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes5ShapeEEELi1ELb1EE5__getB6v15006Ev
	.p2align	2
__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes5ShapeEEELi1ELb1EE5__getB6v15006Ev: ; @_ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes5ShapeEEELi1ELb1EE5__getB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE5firstB6v15006Ev ; -- Begin function _ZNKSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE5firstB6v15006Ev
	.globl	__ZNKSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE5firstB6v15006Ev
	.weak_definition	__ZNKSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE5firstB6v15006Ev
	.p2align	2
__ZNKSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE5firstB6v15006Ev: ; @_ZNKSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE5firstB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNKSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EE5__getB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EE5__getB6v15006Ev ; -- Begin function _ZNKSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EE5__getB6v15006Ev
	.globl	__ZNKSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EE5__getB6v15006Ev
	.weak_definition	__ZNKSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EE5__getB6v15006Ev
	.p2align	2
__ZNKSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EE5__getB6v15006Ev: ; @_ZNKSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EE5__getB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__DATA,__const
	.globl	__ZTVN3map6shapes7EllipseE      ; @_ZTVN3map6shapes7EllipseE
	.p2align	3
__ZTVN3map6shapes7EllipseE:
	.quad	0
	.quad	__ZTIN3map6shapes7EllipseE
	.quad	__ZN3map6shapes7Ellipse6rotateEd
	.quad	__ZNK3map6shapes7Ellipse7rotatedEd
	.quad	__ZN3map6shapes7Ellipse5shiftENS_5PointE
	.quad	__ZNK3map6shapes7Ellipse7shiftedENS_5PointE
	.quad	__ZN3map6shapes7EllipseD1Ev
	.quad	__ZN3map6shapes7EllipseD0Ev
	.quad	__ZNK3map6shapes7Ellipse4drawEPNS_6MapperE

	.section	__TEXT,__const
	.globl	__ZTSN3map6shapes7EllipseE      ; @_ZTSN3map6shapes7EllipseE
__ZTSN3map6shapes7EllipseE:
	.asciz	"N3map6shapes7EllipseE"

	.private_extern	__ZTSN3map6shapes5ShapeE ; @_ZTSN3map6shapes5ShapeE
	.globl	__ZTSN3map6shapes5ShapeE
	.weak_definition	__ZTSN3map6shapes5ShapeE
__ZTSN3map6shapes5ShapeE:
	.asciz	"N3map6shapes5ShapeE"

	.private_extern	__ZTIN3map6shapes5ShapeE ; @_ZTIN3map6shapes5ShapeE
	.section	__DATA,__const
	.globl	__ZTIN3map6shapes5ShapeE
	.weak_definition	__ZTIN3map6shapes5ShapeE
	.p2align	3
__ZTIN3map6shapes5ShapeE:
	.quad	__ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	__ZTSN3map6shapes5ShapeE-9223372036854775808

	.globl	__ZTIN3map6shapes7EllipseE      ; @_ZTIN3map6shapes7EllipseE
	.p2align	3
__ZTIN3map6shapes7EllipseE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN3map6shapes7EllipseE
	.quad	__ZTIN3map6shapes5ShapeE

	.globl	__ZTVN3map6shapes5ShapeE        ; @_ZTVN3map6shapes5ShapeE
	.weak_def_can_be_hidden	__ZTVN3map6shapes5ShapeE
	.p2align	3
__ZTVN3map6shapes5ShapeE:
	.quad	0
	.quad	__ZTIN3map6shapes5ShapeE
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	__ZN3map6shapes5ShapeD1Ev
	.quad	__ZN3map6shapes5ShapeD0Ev
	.quad	___cxa_pure_virtual

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"vector"

.subsections_via_symbols
