	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	__ZN3map6shapes8TriangleC2ENS_5PointES2_S2_ONS1_4DataE ; -- Begin function _ZN3map6shapes8TriangleC2ENS_5PointES2_S2_ONS1_4DataE
	.p2align	2
__ZN3map6shapes8TriangleC2ENS_5PointES2_S2_ONS1_4DataE: ; @_ZN3map6shapes8TriangleC2ENS_5PointES2_S2_ONS1_4DataE
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
; %bb.0:
	sub	sp, sp, #288
	.cfi_def_cfa_offset 288
	stp	x28, x27, [sp, #256]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #272]            ; 16-byte Folded Spill
	add	x29, sp, #272
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
	sub	x8, x29, #96
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	adrp	x9, __ZTVN3map6shapes8TriangleE@PAGE
	add	x9, x9, __ZTVN3map6shapes8TriangleE@PAGEOFF
	add	x9, x9, #16
	str	x9, [sp]                        ; 8-byte Folded Spill
	adrp	x9, ___stack_chk_guard@GOTPAGE
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x9, [x9]
	stur	x9, [x29, #-24]
	str	d0, [x8]
	str	d1, [x8, #8]
	stur	d2, [x29, #-112]
	stur	d3, [x29, #-104]
	stur	d4, [x29, #-128]
	stur	d5, [x29, #-120]
	str	x0, [sp, #136]
	str	x1, [sp, #128]
	ldr	x9, [sp, #136]
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	ldr	d0, [x8]
	ldur	d1, [x29, #-112]
	fadd	d0, d0, d1
	ldur	d1, [x29, #-128]
	fadd	d0, d0, d1
	fmov	d2, #3.00000000
	fdiv	d0, d0, d2
	ldr	d1, [x8, #8]
	ldur	d3, [x29, #-104]
	fadd	d1, d1, d3
	ldur	d3, [x29, #-120]
	fadd	d1, d1, d3
	fdiv	d1, d1, d2
	add	x0, sp, #112
	bl	__ZN3map5PointC1Edd
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [sp, #128]
	ldr	w10, [x8]
	str	w10, [sp, #104]
	ldrh	w8, [x8, #4]
	strh	w8, [sp, #108]
	ldr	x8, [sp, #128]
	ldr	w8, [x8, #8]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	ldr	q0, [x9]
	sub	x8, x29, #80
	str	q0, [x9, #16]
	ldur	q0, [x29, #-112]
	str	q0, [x9, #32]
	ldur	q0, [x29, #-128]
	str	q0, [x9, #48]
	str	x8, [sp, #64]
	mov	x8, #3
	str	x8, [sp, #72]
	ldr	x1, [sp, #64]
	ldr	x2, [sp, #72]
	add	x0, sp, #80
	str	x0, [sp, #32]                   ; 8-byte Folded Spill
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1B6v15006ESt16initializer_listIS2_E
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldr	w2, [sp, #28]                   ; 4-byte Folded Reload
	ldr	x3, [sp, #32]                   ; 8-byte Folded Reload
	ldr	d0, [sp, #112]
	ldr	d1, [sp, #120]
	ldr	w8, [sp, #104]
	str	w8, [sp, #56]
	ldrh	w8, [sp, #108]
	strh	w8, [sp, #60]
	ldr	x1, [sp, #56]
Ltmp0:
	bl	__ZN3map6shapes5ShapeC2ENS_5PointENS_3clr3RGBEiNSt3__16vectorIS2_NS5_9allocatorIS2_EEEE
Ltmp1:
	b	LBB0_1
LBB0_1:
	add	x0, sp, #80
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED1B6v15006Ev
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	str	x8, [x9]
	ldur	x9, [x29, #-24]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB0_3
	b	LBB0_2
LBB0_2:
	bl	___stack_chk_fail
LBB0_3:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #272]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #256]            ; 16-byte Folded Reload
	add	sp, sp, #288
	ret
LBB0_4:
Ltmp2:
	mov	x8, x1
	str	x0, [sp, #48]
	str	w8, [sp, #44]
	add	x0, sp, #80
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED1B6v15006Ev
	b	LBB0_5
LBB0_5:
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
	.uleb128 Lfunc_begin0-Lfunc_begin0      ; >> Call Site 1 <<
	.uleb128 Ltmp0-Lfunc_begin0             ;   Call between Lfunc_begin0 and Ltmp0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp0-Lfunc_begin0             ; >> Call Site 2 <<
	.uleb128 Ltmp1-Ltmp0                    ;   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp2-Lfunc_begin0             ;     jumps to Ltmp2
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp1-Lfunc_begin0             ; >> Call Site 3 <<
	.uleb128 Lfunc_end0-Ltmp1               ;   Call between Ltmp1 and Lfunc_end0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end0:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
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
	.private_extern	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1B6v15006ESt16initializer_listIS2_E ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1B6v15006ESt16initializer_listIS2_E
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1B6v15006ESt16initializer_listIS2_E
	.weak_def_can_be_hidden	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1B6v15006ESt16initializer_listIS2_E
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1B6v15006ESt16initializer_listIS2_E: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC1B6v15006ESt16initializer_listIS2_E
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x1, [sp, #16]
	str	x2, [sp, #24]
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #24]
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2B6v15006ESt16initializer_listIS2_E
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	.globl	__ZN3map6shapes8TriangleC1ENS_5PointES2_S2_ONS1_4DataE ; -- Begin function _ZN3map6shapes8TriangleC1ENS_5PointES2_S2_ONS1_4DataE
	.p2align	2
__ZN3map6shapes8TriangleC1ENS_5PointES2_S2_ONS1_4DataE: ; @_ZN3map6shapes8TriangleC1ENS_5PointES2_S2_ONS1_4DataE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	.cfi_def_cfa_offset 96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	d0, [x29, #-16]
	stur	d1, [x29, #-8]
	stur	d2, [x29, #-32]
	stur	d3, [x29, #-24]
	str	d4, [sp, #32]
	str	d5, [sp, #40]
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	ldr	x0, [sp, #24]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	ldur	d0, [x29, #-16]
	ldur	d1, [x29, #-8]
	ldur	d2, [x29, #-32]
	ldur	d3, [x29, #-24]
	ldr	d4, [sp, #32]
	ldr	d5, [sp, #40]
	bl	__ZN3map6shapes8TriangleC2ENS_5PointES2_S2_ONS1_4DataE
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map6shapes8Triangle6rotateEd ; -- Begin function _ZN3map6shapes8Triangle6rotateEd
	.p2align	2
__ZN3map6shapes8Triangle6rotateEd:      ; @_ZN3map6shapes8Triangle6rotateEd
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #224
	.cfi_def_cfa_offset 224
	stp	x29, x30, [sp, #208]            ; 16-byte Folded Spill
	add	x29, sp, #208
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	stur	x0, [x29, #-48]
	stur	d0, [x29, #-56]
	ldur	x8, [x29, #-48]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	add	x8, x8, #40
	stur	x8, [x29, #-64]
	ldur	x0, [x29, #-64]
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE5beginB6v15006Ev
	stur	x0, [x29, #-72]
	ldur	x0, [x29, #-64]
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE3endB6v15006Ev
	stur	x0, [x29, #-80]
	b	LBB6_1
LBB6_1:                                 ; =>This Inner Loop Header: Depth=1
	sub	x0, x29, #72
	sub	x1, x29, #80
	bl	__ZNSt3__1neB6v15006IPN3map5PointEEEbRKNS_11__wrap_iterIT_EES8_
	tbz	w0, #0, LBB6_4
	b	LBB6_2
LBB6_2:                                 ;   in Loop: Header=BB6_1 Depth=1
	sub	x0, x29, #72
	bl	__ZNKSt3__111__wrap_iterIPN3map5PointEEdeB6v15006Ev
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	stur	x0, [x29, #-88]
	ldur	q0, [x8, #8]
	str	q0, [sp, #96]
	ldur	x0, [x29, #-88]
	ldr	d0, [sp, #96]
	ldr	d1, [sp, #104]
	bl	__ZN3map5PointmIES0_
	str	d0, [sp, #80]
	str	d1, [sp, #88]
	ldur	d0, [x29, #-56]
	bl	_cos
	sub	x8, x29, #40
	str	x8, [sp]                        ; 8-byte Folded Spill
	stur	d0, [x29, #-40]
	ldur	d0, [x29, #-56]
	bl	_sin
	fneg	d0, d0
	stur	d0, [x29, #-32]
	ldur	d0, [x29, #-56]
	bl	_sin
	stur	d0, [x29, #-24]
	ldur	d0, [x29, #-56]
	bl	_cos
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	stur	d0, [x29, #-16]
	ldur	x8, [x29, #-88]
	ldr	q0, [x8]
	str	q0, [sp, #48]
	ldr	d0, [sp, #48]
	ldr	d1, [sp, #56]
	bl	__ZN3mapmlEPA2_dNS_5PointE
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	str	d0, [sp, #64]
	str	d1, [sp, #72]
	ldur	x9, [x29, #-88]
	ldr	q0, [sp, #64]
	str	q0, [x9]
	ldur	q0, [x8, #8]
	str	q0, [sp, #32]
	ldur	x0, [x29, #-88]
	ldr	d0, [sp, #32]
	ldr	d1, [sp, #40]
	bl	__ZN3map5PointpLES0_
	str	d0, [sp, #16]
	str	d1, [sp, #24]
	b	LBB6_3
LBB6_3:                                 ;   in Loop: Header=BB6_1 Depth=1
	sub	x0, x29, #72
	bl	__ZNSt3__111__wrap_iterIPN3map5PointEEppB6v15006Ev
	b	LBB6_1
LBB6_4:
	ldur	x9, [x29, #-8]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB6_6
	b	LBB6_5
LBB6_5:
	bl	___stack_chk_fail
LBB6_6:
	ldp	x29, x30, [sp, #208]            ; 16-byte Folded Reload
	add	sp, sp, #224
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE5beginB6v15006Ev ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE5beginB6v15006Ev
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE5beginB6v15006Ev
	.weak_definition	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE5beginB6v15006Ev
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE5beginB6v15006Ev: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE5beginB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp]
	ldr	x1, [sp]
	ldr	x2, [x1]
	add	x0, sp, #8
	bl	__ZNSt3__111__wrap_iterIPN3map5PointEEC1B6v15006EPKvS3_
	ldr	x0, [sp, #8]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE3endB6v15006Ev ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE3endB6v15006Ev
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE3endB6v15006Ev
	.weak_definition	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE3endB6v15006Ev
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE3endB6v15006Ev: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE3endB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp]
	ldr	x1, [sp]
	ldr	x2, [x1, #8]
	add	x0, sp, #8
	bl	__ZNSt3__111__wrap_iterIPN3map5PointEEC1B6v15006EPKvS3_
	ldr	x0, [sp, #8]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__1neB6v15006IPN3map5PointEEEbRKNS_11__wrap_iterIT_EES8_ ; -- Begin function _ZNSt3__1neB6v15006IPN3map5PointEEEbRKNS_11__wrap_iterIT_EES8_
	.globl	__ZNSt3__1neB6v15006IPN3map5PointEEEbRKNS_11__wrap_iterIT_EES8_
	.weak_definition	__ZNSt3__1neB6v15006IPN3map5PointEEEbRKNS_11__wrap_iterIT_EES8_
	.p2align	2
__ZNSt3__1neB6v15006IPN3map5PointEEEbRKNS_11__wrap_iterIT_EES8_: ; @_ZNSt3__1neB6v15006IPN3map5PointEEEbRKNS_11__wrap_iterIT_EES8_
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
	bl	__ZNSt3__1eqB6v15006IPN3map5PointEEEbRKNS_11__wrap_iterIT_EES8_
	eor	w8, w0, #0x1
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__111__wrap_iterIPN3map5PointEEdeB6v15006Ev ; -- Begin function _ZNKSt3__111__wrap_iterIPN3map5PointEEdeB6v15006Ev
	.globl	__ZNKSt3__111__wrap_iterIPN3map5PointEEdeB6v15006Ev
	.weak_definition	__ZNKSt3__111__wrap_iterIPN3map5PointEEdeB6v15006Ev
	.p2align	2
__ZNKSt3__111__wrap_iterIPN3map5PointEEdeB6v15006Ev: ; @_ZNKSt3__111__wrap_iterIPN3map5PointEEdeB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x0, [x8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map5PointmIES0_            ; -- Begin function _ZN3map5PointmIES0_
	.weak_definition	__ZN3map5PointmIES0_
	.p2align	2
__ZN3map5PointmIES0_:                   ; @_ZN3map5PointmIES0_
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
	bl	__ZN3map5PointmiES0_
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
	.globl	__ZN3mapmlEPA2_dNS_5PointE      ; -- Begin function _ZN3mapmlEPA2_dNS_5PointE
	.weak_definition	__ZN3mapmlEPA2_dNS_5PointE
	.p2align	2
__ZN3mapmlEPA2_dNS_5PointE:             ; @_ZN3mapmlEPA2_dNS_5PointE
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
	ldr	d0, [sp, #16]
	ldr	x8, [sp, #8]
	ldr	d1, [x8]
	ldr	d2, [sp, #24]
	ldr	x8, [sp, #8]
	ldr	d3, [x8, #8]
	fmul	d2, d2, d3
	fmadd	d0, d0, d1, d2
	ldr	d1, [sp, #16]
	ldr	x8, [sp, #8]
	ldr	d2, [x8, #16]
	ldr	d3, [sp, #24]
	ldr	x8, [sp, #8]
	ldr	d4, [x8, #24]
	fmul	d3, d3, d4
	fmadd	d1, d1, d2, d3
	sub	x0, x29, #16
	bl	__ZN3map5PointC1Edd
	ldur	d0, [x29, #-16]
	ldur	d1, [x29, #-8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
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
	.private_extern	__ZNSt3__111__wrap_iterIPN3map5PointEEppB6v15006Ev ; -- Begin function _ZNSt3__111__wrap_iterIPN3map5PointEEppB6v15006Ev
	.globl	__ZNSt3__111__wrap_iterIPN3map5PointEEppB6v15006Ev
	.weak_definition	__ZNSt3__111__wrap_iterIPN3map5PointEEppB6v15006Ev
	.p2align	2
__ZNSt3__111__wrap_iterIPN3map5PointEEppB6v15006Ev: ; @_ZNSt3__111__wrap_iterIPN3map5PointEEppB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	ldr	x8, [x0]
	add	x8, x8, #16
	str	x8, [x0]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK3map6shapes8Triangle7rotatedEd ; -- Begin function _ZNK3map6shapes8Triangle7rotatedEd
	.p2align	2
__ZNK3map6shapes8Triangle7rotatedEd:    ; @_ZNK3map6shapes8Triangle7rotatedEd
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
; %bb.0:
	sub	sp, sp, #96
	.cfi_def_cfa_offset 96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	stur	x8, [x29, #-8]
	stur	x0, [x29, #-16]
	stur	d0, [x29, #-24]
	ldur	x0, [x29, #-16]
	mov	w8, #0
	and	w8, w8, #0x1
	and	w8, w8, #0x1
	sturb	w8, [x29, #-25]
	add	x8, sp, #40
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNSt3__111make_uniqueB6v15006IN3map6shapes8TriangleEJRKS3_EEENS_11__unique_ifIT_E15__unique_singleEDpOT0_
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006INS2_8TriangleENS4_IS8_EEvvEEONS0_IT_T0_EE
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEED1B6v15006Ev
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNKSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEptB6v15006Ev
	ldur	d0, [x29, #-24]
	ldr	x8, [x0]
	ldr	x8, [x8]
Ltmp5:
	blr	x8
Ltmp6:
	b	LBB15_1
LBB15_1:
	mov	w8, #1
	and	w8, w8, #0x1
	and	w8, w8, #0x1
	sturb	w8, [x29, #-25]
	ldurb	w8, [x29, #-25]
	tbnz	w8, #0, LBB15_4
	b	LBB15_3
LBB15_2:
Ltmp7:
	mov	x9, x0
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	mov	x8, x1
	str	x9, [sp, #32]
	str	w8, [sp, #28]
	bl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEED1B6v15006Ev
	b	LBB15_5
LBB15_3:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEED1B6v15006Ev
	b	LBB15_4
LBB15_4:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
LBB15_5:
	ldr	x0, [sp, #32]
	bl	__Unwind_Resume
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table15:
Lexception1:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Lfunc_begin1-Lfunc_begin1      ; >> Call Site 1 <<
	.uleb128 Ltmp5-Lfunc_begin1             ;   Call between Lfunc_begin1 and Ltmp5
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp5-Lfunc_begin1             ; >> Call Site 2 <<
	.uleb128 Ltmp6-Ltmp5                    ;   Call between Ltmp5 and Ltmp6
	.uleb128 Ltmp7-Lfunc_begin1             ;     jumps to Ltmp7
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp6-Lfunc_begin1             ; >> Call Site 3 <<
	.uleb128 Lfunc_end1-Ltmp6               ;   Call between Ltmp6 and Lfunc_end1
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end1:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__111make_uniqueB6v15006IN3map6shapes8TriangleEJRKS3_EEENS_11__unique_ifIT_E15__unique_singleEDpOT0_ ; -- Begin function _ZNSt3__111make_uniqueB6v15006IN3map6shapes8TriangleEJRKS3_EEENS_11__unique_ifIT_E15__unique_singleEDpOT0_
	.globl	__ZNSt3__111make_uniqueB6v15006IN3map6shapes8TriangleEJRKS3_EEENS_11__unique_ifIT_E15__unique_singleEDpOT0_
	.weak_definition	__ZNSt3__111make_uniqueB6v15006IN3map6shapes8TriangleEJRKS3_EEENS_11__unique_ifIT_E15__unique_singleEDpOT0_
	.p2align	2
__ZNSt3__111make_uniqueB6v15006IN3map6shapes8TriangleEJRKS3_EEENS_11__unique_ifIT_E15__unique_singleEDpOT0_: ; @_ZNSt3__111make_uniqueB6v15006IN3map6shapes8TriangleEJRKS3_EEENS_11__unique_ifIT_E15__unique_singleEDpOT0_
Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception2
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
	mov	x0, #64
	bl	__Znwm
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldur	x1, [x29, #-16]
Ltmp8:
	bl	__ZN3map6shapes8TriangleC1ERKS1_
Ltmp9:
	b	LBB16_1
LBB16_1:
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEEC1B6v15006ILb1EvEEPS3_
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB16_2:
Ltmp10:
	mov	x9, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	mov	x8, x1
	str	x9, [sp, #24]
	str	w8, [sp, #20]
	bl	__ZdlPv
	b	LBB16_3
LBB16_3:
	ldr	x0, [sp, #24]
	bl	__Unwind_Resume
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table16:
Lexception2:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end2-Lcst_begin2
Lcst_begin2:
	.uleb128 Lfunc_begin2-Lfunc_begin2      ; >> Call Site 1 <<
	.uleb128 Ltmp8-Lfunc_begin2             ;   Call between Lfunc_begin2 and Ltmp8
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp8-Lfunc_begin2             ; >> Call Site 2 <<
	.uleb128 Ltmp9-Ltmp8                    ;   Call between Ltmp8 and Ltmp9
	.uleb128 Ltmp10-Lfunc_begin2            ;     jumps to Ltmp10
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp9-Lfunc_begin2             ; >> Call Site 3 <<
	.uleb128 Lfunc_end2-Ltmp9               ;   Call between Ltmp9 and Lfunc_end2
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end2:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006INS2_8TriangleENS4_IS8_EEvvEEONS0_IT_T0_EE ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006INS2_8TriangleENS4_IS8_EEvvEEONS0_IT_T0_EE
	.weak_def_can_be_hidden	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006INS2_8TriangleENS4_IS8_EEvvEEONS0_IT_T0_EE
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006INS2_8TriangleENS4_IS8_EEvvEEONS0_IT_T0_EE: ; @_ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006INS2_8TriangleENS4_IS8_EEvvEEONS0_IT_T0_EE
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
	bl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006INS2_8TriangleENS4_IS8_EEvvEEONS0_IT_T0_EE
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEED1B6v15006Ev ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEED1B6v15006Ev
	.globl	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEED1B6v15006Ev
	.weak_def_can_be_hidden	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEED1B6v15006Ev
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEED1B6v15006Ev: ; @_ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEED1B6v15006Ev
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
	bl	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEED2B6v15006Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
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
	.globl	__ZN3map6shapes8Triangle5shiftENS_5PointE ; -- Begin function _ZN3map6shapes8Triangle5shiftENS_5PointE
	.p2align	2
__ZN3map6shapes8Triangle5shiftENS_5PointE: ; @_ZN3map6shapes8Triangle5shiftENS_5PointE
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
	.globl	__ZNK3map6shapes8Triangle7shiftedENS_5PointE ; -- Begin function _ZNK3map6shapes8Triangle7shiftedENS_5PointE
	.p2align	2
__ZNK3map6shapes8Triangle7shiftedENS_5PointE: ; @_ZNK3map6shapes8Triangle7shiftedENS_5PointE
Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception3
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
	bl	__ZNSt3__111make_uniqueB6v15006IN3map6shapes8TriangleEJRKS3_EEENS_11__unique_ifIT_E15__unique_singleEDpOT0_
	ldr	x1, [sp]                        ; 8-byte Folded Reload
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006INS2_8TriangleENS4_IS8_EEvvEEONS0_IT_T0_EE
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEED1B6v15006Ev
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNKSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEptB6v15006Ev
	ldur	q0, [x29, #-24]
	str	q0, [sp, #32]
	ldr	d0, [sp, #32]
	ldr	d1, [sp, #40]
	ldr	x8, [x0]
	ldr	x8, [x8, #16]
Ltmp11:
	blr	x8
Ltmp12:
	b	LBB22_1
LBB22_1:
	mov	w8, #1
	and	w8, w8, #0x1
	and	w8, w8, #0x1
	sturb	w8, [x29, #-33]
	ldurb	w8, [x29, #-33]
	tbnz	w8, #0, LBB22_4
	b	LBB22_3
LBB22_2:
Ltmp13:
	mov	x9, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	mov	x8, x1
	str	x9, [sp, #24]
	str	w8, [sp, #20]
	bl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEED1B6v15006Ev
	b	LBB22_5
LBB22_3:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEED1B6v15006Ev
	b	LBB22_4
LBB22_4:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB22_5:
	ldr	x0, [sp, #24]
	bl	__Unwind_Resume
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table22:
Lexception3:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end3-Lcst_begin3
Lcst_begin3:
	.uleb128 Lfunc_begin3-Lfunc_begin3      ; >> Call Site 1 <<
	.uleb128 Ltmp11-Lfunc_begin3            ;   Call between Lfunc_begin3 and Ltmp11
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp11-Lfunc_begin3            ; >> Call Site 2 <<
	.uleb128 Ltmp12-Ltmp11                  ;   Call between Ltmp11 and Ltmp12
	.uleb128 Ltmp13-Lfunc_begin3            ;     jumps to Ltmp13
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp12-Lfunc_begin3            ; >> Call Site 3 <<
	.uleb128 Lfunc_end3-Ltmp12              ;   Call between Ltmp12 and Lfunc_end3
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end3:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNK3map6shapes8Triangle4drawEPNS_6MapperE ; -- Begin function _ZNK3map6shapes8Triangle4drawEPNS_6MapperE
	.p2align	2
__ZNK3map6shapes8Triangle4drawEPNS_6MapperE: ; @_ZNK3map6shapes8Triangle4drawEPNS_6MapperE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map6shapes8TriangleD1Ev    ; -- Begin function _ZN3map6shapes8TriangleD1Ev
	.weak_def_can_be_hidden	__ZN3map6shapes8TriangleD1Ev
	.p2align	2
__ZN3map6shapes8TriangleD1Ev:           ; @_ZN3map6shapes8TriangleD1Ev
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
	bl	__ZN3map6shapes8TriangleD2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map6shapes8TriangleD0Ev    ; -- Begin function _ZN3map6shapes8TriangleD0Ev
	.weak_def_can_be_hidden	__ZN3map6shapes8TriangleD0Ev
	.p2align	2
__ZN3map6shapes8TriangleD0Ev:           ; @_ZN3map6shapes8TriangleD0Ev
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
	bl	__ZN3map6shapes8TriangleD1Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZdlPv
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
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
	.private_extern	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2B6v15006ESt16initializer_listIS2_E ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2B6v15006ESt16initializer_listIS2_E
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2B6v15006ESt16initializer_listIS2_E
	.weak_def_can_be_hidden	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2B6v15006ESt16initializer_listIS2_E
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2B6v15006ESt16initializer_listIS2_E: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEEC2B6v15006ESt16initializer_listIS2_E
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #112
	.cfi_def_cfa_offset 112
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	sub	x8, x29, #24
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	stur	x1, [x29, #-24]
	stur	x2, [x29, #-16]
	stur	x0, [x29, #-32]
	ldur	x8, [x29, #-32]
	str	x8, [sp, #32]                   ; 8-byte Folded Spill
	mov	x9, x8
	stur	x9, [x29, #-8]
                                        ; kill: def $x9 killed $xzr
	str	xzr, [x8]
	str	xzr, [x8, #8]
	sub	x1, x29, #40
	stur	xzr, [x29, #-40]
	add	x0, x8, #16
	sub	x2, x29, #41
	bl	__ZNSt3__117__compressed_pairIPN3map5PointENS_9allocatorIS2_EEEC1B6v15006IDnNS_18__default_init_tagEEEOT_OT0_
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	bl	__ZNSt3__119__debug_db_insert_cB6v15006INS_6vectorIN3map5PointENS_9allocatorIS3_EEEEEEvPT_
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	bl	__ZNKSt16initializer_listIN3map5PointEE4sizeB6v15006Ev
	subs	x8, x0, #0
	cset	w8, ls
	tbnz	w8, #0, LBB27_2
	b	LBB27_1
LBB27_1:
	sub	x0, x29, #24
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNKSt16initializer_listIN3map5PointEE4sizeB6v15006Ev
	mov	x1, x0
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE11__vallocateB6v15006Em
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNKSt16initializer_listIN3map5PointEE5beginB6v15006Ev
	mov	x1, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	str	x1, [sp, #16]                   ; 8-byte Folded Spill
	bl	__ZNKSt16initializer_listIN3map5PointEE3endB6v15006Ev
	mov	x1, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	str	x1, [sp, #24]                   ; 8-byte Folded Spill
	bl	__ZNKSt16initializer_listIN3map5PointEE4sizeB6v15006Ev
	ldr	x1, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x2, [sp, #24]                   ; 8-byte Folded Reload
	mov	x3, x0
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE18__construct_at_endIPKS2_EENS_9enable_ifIXsr27__is_cpp17_forward_iteratorIT_EE5valueEvE4typeESA_SA_m
	b	LBB27_2
LBB27_2:
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
	.cfi_endproc
                                        ; -- End function
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
	.private_extern	__ZNKSt16initializer_listIN3map5PointEE4sizeB6v15006Ev ; -- Begin function _ZNKSt16initializer_listIN3map5PointEE4sizeB6v15006Ev
	.globl	__ZNKSt16initializer_listIN3map5PointEE4sizeB6v15006Ev
	.weak_definition	__ZNKSt16initializer_listIN3map5PointEE4sizeB6v15006Ev
	.p2align	2
__ZNKSt16initializer_listIN3map5PointEE4sizeB6v15006Ev: ; @_ZNKSt16initializer_listIN3map5PointEE4sizeB6v15006Ev
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
	tbnz	w8, #0, LBB31_2
	b	LBB31_1
LBB31_1:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNKSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE20__throw_length_errorB6v15006Ev
LBB31_2:
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
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE18__construct_at_endIPKS2_EENS_9enable_ifIXsr27__is_cpp17_forward_iteratorIT_EE5valueEvE4typeESA_SA_m ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE18__construct_at_endIPKS2_EENS_9enable_ifIXsr27__is_cpp17_forward_iteratorIT_EE5valueEvE4typeESA_SA_m
	.weak_definition	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE18__construct_at_endIPKS2_EENS_9enable_ifIXsr27__is_cpp17_forward_iteratorIT_EE5valueEvE4typeESA_SA_m
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE18__construct_at_endIPKS2_EENS_9enable_ifIXsr27__is_cpp17_forward_iteratorIT_EE5valueEvE4typeESA_SA_m: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE18__construct_at_endIPKS2_EENS_9enable_ifIXsr27__is_cpp17_forward_iteratorIT_EE5valueEvE4typeESA_SA_m
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
Ltmp18:
	bl	__ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEES3_S3_LPv0EEEPT0_RT_PKS6_SB_S7_
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
Ltmp19:
	b	LBB32_1
LBB32_1:
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	add	x0, sp, #40
	str	x8, [sp, #48]
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionD1Ev
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB32_2:
Ltmp20:
	mov	x8, x1
	str	x0, [sp, #32]
	str	w8, [sp, #28]
	add	x0, sp, #40
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionD1Ev
	b	LBB32_3
LBB32_3:
	ldr	x0, [sp, #32]
	bl	__Unwind_Resume
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table32:
Lexception4:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end4-Lcst_begin4
Lcst_begin4:
	.uleb128 Lfunc_begin4-Lfunc_begin4      ; >> Call Site 1 <<
	.uleb128 Ltmp18-Lfunc_begin4            ;   Call between Lfunc_begin4 and Ltmp18
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp18-Lfunc_begin4            ; >> Call Site 2 <<
	.uleb128 Ltmp19-Ltmp18                  ;   Call between Ltmp18 and Ltmp19
	.uleb128 Ltmp20-Lfunc_begin4            ;     jumps to Ltmp20
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp19-Lfunc_begin4            ; >> Call Site 3 <<
	.uleb128 Lfunc_end4-Ltmp19              ;   Call between Ltmp19 and Lfunc_end4
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end4:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNKSt16initializer_listIN3map5PointEE5beginB6v15006Ev ; -- Begin function _ZNKSt16initializer_listIN3map5PointEE5beginB6v15006Ev
	.globl	__ZNKSt16initializer_listIN3map5PointEE5beginB6v15006Ev
	.weak_definition	__ZNKSt16initializer_listIN3map5PointEE5beginB6v15006Ev
	.p2align	2
__ZNKSt16initializer_listIN3map5PointEE5beginB6v15006Ev: ; @_ZNKSt16initializer_listIN3map5PointEE5beginB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x0, [x8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt16initializer_listIN3map5PointEE3endB6v15006Ev ; -- Begin function _ZNKSt16initializer_listIN3map5PointEE3endB6v15006Ev
	.globl	__ZNKSt16initializer_listIN3map5PointEE3endB6v15006Ev
	.weak_definition	__ZNKSt16initializer_listIN3map5PointEE3endB6v15006Ev
	.p2align	2
__ZNKSt16initializer_listIN3map5PointEE3endB6v15006Ev: ; @_ZNKSt16initializer_listIN3map5PointEE3endB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x9, [sp, #8]
	ldr	x8, [x9]
	ldr	x9, [x9, #8]
	add	x0, x8, x9, lsl #4
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
Ltmp25:
	bl	__ZNSt3__13minB6v15006ImEERKT_S3_S3_
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
Ltmp26:
	b	LBB40_1
LBB40_1:
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x0, [x8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB40_2:
Ltmp27:
	bl	___clang_call_terminate
Lfunc_end5:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table40:
Lexception5:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase0-Lttbaseref0
Lttbaseref0:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end5-Lcst_begin5
Lcst_begin5:
	.uleb128 Ltmp25-Lfunc_begin5            ; >> Call Site 1 <<
	.uleb128 Ltmp26-Ltmp25                  ;   Call between Ltmp25 and Ltmp26
	.uleb128 Ltmp27-Lfunc_begin5            ;     jumps to Ltmp27
	.byte	1                               ;   On action: 1
Lcst_end5:
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
	tbz	w0, #0, LBB51_2
	b	LBB51_1
LBB51_1:
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	b	LBB51_3
LBB51_2:
	ldr	x8, [sp, #16]
	str	x8, [sp]                        ; 8-byte Folded Spill
	b	LBB51_3
LBB51_3:
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
Ltmp30:
	bl	__ZNSt12length_errorC1B6v15006EPKc
Ltmp31:
	b	LBB58_1
LBB58_1:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	adrp	x1, __ZTISt12length_error@GOTPAGE
	ldr	x1, [x1, __ZTISt12length_error@GOTPAGEOFF]
	adrp	x2, __ZNSt12length_errorD1Ev@GOTPAGE
	ldr	x2, [x2, __ZNSt12length_errorD1Ev@GOTPAGEOFF]
	bl	___cxa_throw
LBB58_2:
Ltmp32:
	mov	x9, x0
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	mov	x8, x1
	str	x9, [sp, #16]
	str	w8, [sp, #12]
	bl	___cxa_free_exception
	b	LBB58_3
LBB58_3:
	ldr	x0, [sp, #16]
	bl	__Unwind_Resume
Lfunc_end6:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table58:
Lexception6:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end6-Lcst_begin6
Lcst_begin6:
	.uleb128 Lfunc_begin6-Lfunc_begin6      ; >> Call Site 1 <<
	.uleb128 Ltmp30-Lfunc_begin6            ;   Call between Lfunc_begin6 and Ltmp30
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp30-Lfunc_begin6            ; >> Call Site 2 <<
	.uleb128 Ltmp31-Ltmp30                  ;   Call between Ltmp30 and Ltmp31
	.uleb128 Ltmp32-Lfunc_begin6            ;     jumps to Ltmp32
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp31-Lfunc_begin6            ; >> Call Site 3 <<
	.uleb128 Lfunc_end6-Ltmp31              ;   Call between Ltmp31 and Lfunc_end6
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
	tbnz	w8, #0, LBB61_2
	b	LBB61_1
LBB61_1:
	bl	__ZSt28__throw_bad_array_new_lengthB6v15006v
LBB61_2:
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
	tbz	w0, #0, LBB63_2
	b	LBB63_1
LBB63_1:
	ldr	x8, [sp, #8]
	str	x8, [sp]
	ldr	x0, [sp, #16]
	ldr	x1, [sp]
	bl	__ZNSt3__121__libcpp_operator_newB6v15006IJmSt11align_val_tEEEPvDpT_
	stur	x0, [x29, #-8]
	b	LBB63_3
LBB63_2:
	ldr	x0, [sp, #16]
	bl	__ZNSt3__121__libcpp_operator_newB6v15006IJmEEEPvDpT_
	stur	x0, [x29, #-8]
	b	LBB63_3
LBB63_3:
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
	.private_extern	__ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEES3_S3_LPv0EEEPT0_RT_PKS6_SB_S7_ ; -- Begin function _ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEES3_S3_LPv0EEEPT0_RT_PKS6_SB_S7_
	.globl	__ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEES3_S3_LPv0EEEPT0_RT_PKS6_SB_S7_
	.weak_definition	__ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEES3_S3_LPv0EEEPT0_RT_PKS6_SB_S7_
	.p2align	2
__ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEES3_S3_LPv0EEEPT0_RT_PKS6_SB_S7_: ; @_ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEES3_S3_LPv0EEEPT0_RT_PKS6_SB_S7_
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
	str	x3, [sp]
	ldr	x0, [sp, #16]
	ldr	x1, [sp, #8]
	ldr	x2, [sp]
	bl	__ZNSt3__14copyB6v15006IPKN3map5PointEPS2_EET0_T_S7_S6_
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
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
	.private_extern	__ZNSt3__14copyB6v15006IPKN3map5PointEPS2_EET0_T_S7_S6_ ; -- Begin function _ZNSt3__14copyB6v15006IPKN3map5PointEPS2_EET0_T_S7_S6_
	.globl	__ZNSt3__14copyB6v15006IPKN3map5PointEPS2_EET0_T_S7_S6_
	.weak_definition	__ZNSt3__14copyB6v15006IPKN3map5PointEPS2_EET0_T_S7_S6_
	.p2align	2
__ZNSt3__14copyB6v15006IPKN3map5PointEPS2_EET0_T_S7_S6_: ; @_ZNSt3__14copyB6v15006IPKN3map5PointEPS2_EET0_T_S7_S6_
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
	ldur	x1, [x29, #-16]
	ldr	x2, [sp, #24]
	bl	__ZNSt3__16__copyB6v15006IPKN3map5PointES4_PS2_Li0EEENS_4pairIT_T1_EES7_T0_S8_
	str	x0, [sp, #8]
	str	x1, [sp, #16]
	ldr	x0, [sp, #16]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16__copyB6v15006IPKN3map5PointES4_PS2_Li0EEENS_4pairIT_T1_EES7_T0_S8_ ; -- Begin function _ZNSt3__16__copyB6v15006IPKN3map5PointES4_PS2_Li0EEENS_4pairIT_T1_EES7_T0_S8_
	.globl	__ZNSt3__16__copyB6v15006IPKN3map5PointES4_PS2_Li0EEENS_4pairIT_T1_EES7_T0_S8_
	.weak_definition	__ZNSt3__16__copyB6v15006IPKN3map5PointES4_PS2_Li0EEENS_4pairIT_T1_EES7_T0_S8_
	.p2align	2
__ZNSt3__16__copyB6v15006IPKN3map5PointES4_PS2_Li0EEENS_4pairIT_T1_EES7_T0_S8_: ; @_ZNSt3__16__copyB6v15006IPKN3map5PointES4_PS2_Li0EEENS_4pairIT_T1_EES7_T0_S8_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #128
	.cfi_def_cfa_offset 128
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-24]
	stur	x1, [x29, #-32]
	stur	x2, [x29, #-40]
	ldur	x0, [x29, #-24]
	ldur	x1, [x29, #-32]
	bl	__ZNSt3__114__unwrap_rangeB6v15006IPKN3map5PointES4_EEDaT_T0_
	str	x0, [sp, #56]
	str	x1, [sp, #64]
	ldr	x8, [sp, #56]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x8, [sp, #64]
	str	x8, [sp]                        ; 8-byte Folded Spill
	ldur	x0, [x29, #-40]
	bl	__ZNSt3__113__unwrap_iterB6v15006IPN3map5PointENS_18__unwrap_iter_implIS3_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES7_
	ldr	x1, [sp]                        ; 8-byte Folded Reload
	mov	x2, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__111__copy_implB6v15006IKN3map5PointES2_vEENS_4pairIPT_PT0_EES6_S6_S8_
	str	x0, [sp, #40]
	str	x1, [sp, #48]
	ldur	x0, [x29, #-24]
	ldr	x1, [sp, #40]
	bl	__ZNSt3__114__rewrap_rangeB6v15006IPKN3map5PointES4_S4_EET0_S5_T1_
	add	x8, sp, #32
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	str	x0, [sp, #32]
	ldur	x0, [x29, #-40]
	ldr	x1, [sp, #48]
	bl	__ZNSt3__113__rewrap_iterB6v15006IPN3map5PointES3_NS_18__unwrap_iter_implIS3_Lb1EEEEET_S6_T0_
	mov	x8, x0
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	add	x1, sp, #24
	str	x8, [sp, #24]
	bl	__ZNSt3__19make_pairB6v15006IPKN3map5PointEPS2_EENS_4pairINS_18__unwrap_ref_decayIT_E4typeENS7_IT0_E4typeEEEOS8_OSB_
	stur	x0, [x29, #-16]
	stur	x1, [x29, #-8]
	ldur	x0, [x29, #-16]
	ldur	x1, [x29, #-8]
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__114__unwrap_rangeB6v15006IPKN3map5PointES4_EEDaT_T0_ ; -- Begin function _ZNSt3__114__unwrap_rangeB6v15006IPKN3map5PointES4_EEDaT_T0_
	.globl	__ZNSt3__114__unwrap_rangeB6v15006IPKN3map5PointES4_EEDaT_T0_
	.weak_definition	__ZNSt3__114__unwrap_rangeB6v15006IPKN3map5PointES4_EEDaT_T0_
	.p2align	2
__ZNSt3__114__unwrap_rangeB6v15006IPKN3map5PointES4_EEDaT_T0_: ; @_ZNSt3__114__unwrap_rangeB6v15006IPKN3map5PointES4_EEDaT_T0_
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
	bl	__ZNSt3__119__unwrap_range_implIPKN3map5PointES4_E8__unwrapB6v15006ES4_S4_
	str	x0, [sp, #16]
	str	x1, [sp, #24]
	ldr	x0, [sp, #16]
	ldr	x1, [sp, #24]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__111__copy_implB6v15006IKN3map5PointES2_vEENS_4pairIPT_PT0_EES6_S6_S8_ ; -- Begin function _ZNSt3__111__copy_implB6v15006IKN3map5PointES2_vEENS_4pairIPT_PT0_EES6_S6_S8_
	.globl	__ZNSt3__111__copy_implB6v15006IKN3map5PointES2_vEENS_4pairIPT_PT0_EES6_S6_S8_
	.weak_definition	__ZNSt3__111__copy_implB6v15006IKN3map5PointES2_vEENS_4pairIPT_PT0_EES6_S6_S8_
	.p2align	2
__ZNSt3__111__copy_implB6v15006IKN3map5PointES2_vEENS_4pairIPT_PT0_EES6_S6_S8_: ; @_ZNSt3__111__copy_implB6v15006IKN3map5PointES2_vEENS_4pairIPT_PT0_EES6_S6_S8_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-24]
	str	x1, [sp, #32]
	str	x2, [sp, #24]
	ldr	x8, [sp, #32]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	mov	x9, #16
	sdiv	x8, x8, x9
	str	x8, [sp, #16]
	ldr	x8, [sp, #16]
	subs	x8, x8, #0
	cset	w8, ls
	tbnz	w8, #0, LBB85_2
	b	LBB85_1
LBB85_1:
	ldr	x0, [sp, #24]
	ldur	x1, [x29, #-24]
	ldr	x8, [sp, #16]
	lsl	x2, x8, #4
	bl	_memmove
	b	LBB85_2
LBB85_2:
	ldur	x8, [x29, #-24]
	ldr	x9, [sp, #16]
	add	x8, x8, x9, lsl #4
	add	x0, sp, #8
	str	x8, [sp, #8]
	ldr	x8, [sp, #24]
	ldr	x9, [sp, #16]
	add	x8, x8, x9, lsl #4
	mov	x1, sp
	str	x8, [sp]
	bl	__ZNSt3__19make_pairB6v15006IPKN3map5PointEPS2_EENS_4pairINS_18__unwrap_ref_decayIT_E4typeENS7_IT0_E4typeEEEOS8_OSB_
	stur	x0, [x29, #-16]
	stur	x1, [x29, #-8]
	ldur	x0, [x29, #-16]
	ldur	x1, [x29, #-8]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__113__unwrap_iterB6v15006IPN3map5PointENS_18__unwrap_iter_implIS3_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES7_ ; -- Begin function _ZNSt3__113__unwrap_iterB6v15006IPN3map5PointENS_18__unwrap_iter_implIS3_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES7_
	.globl	__ZNSt3__113__unwrap_iterB6v15006IPN3map5PointENS_18__unwrap_iter_implIS3_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES7_
	.weak_definition	__ZNSt3__113__unwrap_iterB6v15006IPN3map5PointENS_18__unwrap_iter_implIS3_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES7_
	.p2align	2
__ZNSt3__113__unwrap_iterB6v15006IPN3map5PointENS_18__unwrap_iter_implIS3_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES7_: ; @_ZNSt3__113__unwrap_iterB6v15006IPN3map5PointENS_18__unwrap_iter_implIS3_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES7_
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
	bl	__ZNSt3__118__unwrap_iter_implIPN3map5PointELb1EE8__unwrapB6v15006ES3_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__19make_pairB6v15006IPKN3map5PointEPS2_EENS_4pairINS_18__unwrap_ref_decayIT_E4typeENS7_IT0_E4typeEEEOS8_OSB_ ; -- Begin function _ZNSt3__19make_pairB6v15006IPKN3map5PointEPS2_EENS_4pairINS_18__unwrap_ref_decayIT_E4typeENS7_IT0_E4typeEEEOS8_OSB_
	.globl	__ZNSt3__19make_pairB6v15006IPKN3map5PointEPS2_EENS_4pairINS_18__unwrap_ref_decayIT_E4typeENS7_IT0_E4typeEEEOS8_OSB_
	.weak_definition	__ZNSt3__19make_pairB6v15006IPKN3map5PointEPS2_EENS_4pairINS_18__unwrap_ref_decayIT_E4typeENS7_IT0_E4typeEEEOS8_OSB_
	.p2align	2
__ZNSt3__19make_pairB6v15006IPKN3map5PointEPS2_EENS_4pairINS_18__unwrap_ref_decayIT_E4typeENS7_IT0_E4typeEEEOS8_OSB_: ; @_ZNSt3__19make_pairB6v15006IPKN3map5PointEPS2_EENS_4pairINS_18__unwrap_ref_decayIT_E4typeENS7_IT0_E4typeEEEOS8_OSB_
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
	ldr	x1, [sp, #8]
	ldr	x2, [sp]
	add	x0, sp, #16
	bl	__ZNSt3__14pairIPKN3map5PointEPS2_EC1B6v15006IS4_S5_LPv0EEEOT_OT0_
	ldr	x0, [sp, #16]
	ldr	x1, [sp, #24]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__114__rewrap_rangeB6v15006IPKN3map5PointES4_S4_EET0_S5_T1_ ; -- Begin function _ZNSt3__114__rewrap_rangeB6v15006IPKN3map5PointES4_S4_EET0_S5_T1_
	.globl	__ZNSt3__114__rewrap_rangeB6v15006IPKN3map5PointES4_S4_EET0_S5_T1_
	.weak_definition	__ZNSt3__114__rewrap_rangeB6v15006IPKN3map5PointES4_S4_EET0_S5_T1_
	.p2align	2
__ZNSt3__114__rewrap_rangeB6v15006IPKN3map5PointES4_S4_EET0_S5_T1_: ; @_ZNSt3__114__rewrap_rangeB6v15006IPKN3map5PointES4_S4_EET0_S5_T1_
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
	bl	__ZNSt3__119__unwrap_range_implIPKN3map5PointES4_E8__rewrapB6v15006ES4_S4_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__113__rewrap_iterB6v15006IPN3map5PointES3_NS_18__unwrap_iter_implIS3_Lb1EEEEET_S6_T0_ ; -- Begin function _ZNSt3__113__rewrap_iterB6v15006IPN3map5PointES3_NS_18__unwrap_iter_implIS3_Lb1EEEEET_S6_T0_
	.globl	__ZNSt3__113__rewrap_iterB6v15006IPN3map5PointES3_NS_18__unwrap_iter_implIS3_Lb1EEEEET_S6_T0_
	.weak_definition	__ZNSt3__113__rewrap_iterB6v15006IPN3map5PointES3_NS_18__unwrap_iter_implIS3_Lb1EEEEET_S6_T0_
	.p2align	2
__ZNSt3__113__rewrap_iterB6v15006IPN3map5PointES3_NS_18__unwrap_iter_implIS3_Lb1EEEEET_S6_T0_: ; @_ZNSt3__113__rewrap_iterB6v15006IPN3map5PointES3_NS_18__unwrap_iter_implIS3_Lb1EEEEET_S6_T0_
Lfunc_begin7:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception7
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
Ltmp40:
	bl	__ZNSt3__118__unwrap_iter_implIPN3map5PointELb1EE8__rewrapB6v15006ES3_S3_
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
Ltmp41:
	b	LBB89_1
LBB89_1:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB89_2:
Ltmp42:
	bl	___clang_call_terminate
Lfunc_end7:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table89:
Lexception7:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase1-Lttbaseref1
Lttbaseref1:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end7-Lcst_begin7
Lcst_begin7:
	.uleb128 Ltmp40-Lfunc_begin7            ; >> Call Site 1 <<
	.uleb128 Ltmp41-Ltmp40                  ;   Call between Ltmp40 and Ltmp41
	.uleb128 Ltmp42-Lfunc_begin7            ;     jumps to Ltmp42
	.byte	1                               ;   On action: 1
Lcst_end7:
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
	.private_extern	__ZNSt3__119__unwrap_range_implIPKN3map5PointES4_E8__unwrapB6v15006ES4_S4_ ; -- Begin function _ZNSt3__119__unwrap_range_implIPKN3map5PointES4_E8__unwrapB6v15006ES4_S4_
	.globl	__ZNSt3__119__unwrap_range_implIPKN3map5PointES4_E8__unwrapB6v15006ES4_S4_
	.weak_definition	__ZNSt3__119__unwrap_range_implIPKN3map5PointES4_E8__unwrapB6v15006ES4_S4_
	.p2align	2
__ZNSt3__119__unwrap_range_implIPKN3map5PointES4_E8__unwrapB6v15006ES4_S4_: ; @_ZNSt3__119__unwrap_range_implIPKN3map5PointES4_E8__unwrapB6v15006ES4_S4_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-24]
	str	x1, [sp, #32]
	ldur	x0, [x29, #-24]
	bl	__ZNSt3__113__unwrap_iterB6v15006IPKN3map5PointENS_18__unwrap_iter_implIS4_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES8_
	add	x8, sp, #24
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	str	x0, [sp, #24]
	ldr	x0, [sp, #32]
	bl	__ZNSt3__113__unwrap_iterB6v15006IPKN3map5PointENS_18__unwrap_iter_implIS4_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES8_
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	add	x2, sp, #16
	str	x0, [sp, #16]
	sub	x0, x29, #16
	bl	__ZNSt3__14pairIPKN3map5PointES4_EC1B6v15006IS4_S4_LPv0EEEOT_OT0_
	ldur	x0, [x29, #-16]
	ldur	x1, [x29, #-8]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__113__unwrap_iterB6v15006IPKN3map5PointENS_18__unwrap_iter_implIS4_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES8_ ; -- Begin function _ZNSt3__113__unwrap_iterB6v15006IPKN3map5PointENS_18__unwrap_iter_implIS4_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES8_
	.globl	__ZNSt3__113__unwrap_iterB6v15006IPKN3map5PointENS_18__unwrap_iter_implIS4_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES8_
	.weak_definition	__ZNSt3__113__unwrap_iterB6v15006IPKN3map5PointENS_18__unwrap_iter_implIS4_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES8_
	.p2align	2
__ZNSt3__113__unwrap_iterB6v15006IPKN3map5PointENS_18__unwrap_iter_implIS4_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES8_: ; @_ZNSt3__113__unwrap_iterB6v15006IPKN3map5PointENS_18__unwrap_iter_implIS4_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES8_
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
	bl	__ZNSt3__118__unwrap_iter_implIPKN3map5PointELb1EE8__unwrapB6v15006ES4_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__14pairIPKN3map5PointES4_EC1B6v15006IS4_S4_LPv0EEEOT_OT0_ ; -- Begin function _ZNSt3__14pairIPKN3map5PointES4_EC1B6v15006IS4_S4_LPv0EEEOT_OT0_
	.weak_def_can_be_hidden	__ZNSt3__14pairIPKN3map5PointES4_EC1B6v15006IS4_S4_LPv0EEEOT_OT0_
	.p2align	2
__ZNSt3__14pairIPKN3map5PointES4_EC1B6v15006IS4_S4_LPv0EEEOT_OT0_: ; @_ZNSt3__14pairIPKN3map5PointES4_EC1B6v15006IS4_S4_LPv0EEEOT_OT0_
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
	bl	__ZNSt3__14pairIPKN3map5PointES4_EC2B6v15006IS4_S4_LPv0EEEOT_OT0_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__118__unwrap_iter_implIPKN3map5PointELb1EE8__unwrapB6v15006ES4_ ; -- Begin function _ZNSt3__118__unwrap_iter_implIPKN3map5PointELb1EE8__unwrapB6v15006ES4_
	.globl	__ZNSt3__118__unwrap_iter_implIPKN3map5PointELb1EE8__unwrapB6v15006ES4_
	.weak_definition	__ZNSt3__118__unwrap_iter_implIPKN3map5PointELb1EE8__unwrapB6v15006ES4_
	.p2align	2
__ZNSt3__118__unwrap_iter_implIPKN3map5PointELb1EE8__unwrapB6v15006ES4_: ; @_ZNSt3__118__unwrap_iter_implIPKN3map5PointELb1EE8__unwrapB6v15006ES4_
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
	bl	__ZNSt3__112__to_addressB6v15006IKN3map5PointEEEPT_S5_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112__to_addressB6v15006IKN3map5PointEEEPT_S5_ ; -- Begin function _ZNSt3__112__to_addressB6v15006IKN3map5PointEEEPT_S5_
	.globl	__ZNSt3__112__to_addressB6v15006IKN3map5PointEEEPT_S5_
	.weak_definition	__ZNSt3__112__to_addressB6v15006IKN3map5PointEEEPT_S5_
	.p2align	2
__ZNSt3__112__to_addressB6v15006IKN3map5PointEEEPT_S5_: ; @_ZNSt3__112__to_addressB6v15006IKN3map5PointEEEPT_S5_
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
	.globl	__ZNSt3__14pairIPKN3map5PointES4_EC2B6v15006IS4_S4_LPv0EEEOT_OT0_ ; -- Begin function _ZNSt3__14pairIPKN3map5PointES4_EC2B6v15006IS4_S4_LPv0EEEOT_OT0_
	.weak_def_can_be_hidden	__ZNSt3__14pairIPKN3map5PointES4_EC2B6v15006IS4_S4_LPv0EEEOT_OT0_
	.p2align	2
__ZNSt3__14pairIPKN3map5PointES4_EC2B6v15006IS4_S4_LPv0EEEOT_OT0_: ; @_ZNSt3__14pairIPKN3map5PointES4_EC2B6v15006IS4_S4_LPv0EEEOT_OT0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldr	x0, [sp, #24]
	ldr	x8, [sp, #16]
	ldr	x8, [x8]
	str	x8, [x0]
	ldr	x8, [sp, #8]
	ldr	x8, [x8]
	str	x8, [x0, #8]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__118__unwrap_iter_implIPN3map5PointELb1EE8__unwrapB6v15006ES3_ ; -- Begin function _ZNSt3__118__unwrap_iter_implIPN3map5PointELb1EE8__unwrapB6v15006ES3_
	.globl	__ZNSt3__118__unwrap_iter_implIPN3map5PointELb1EE8__unwrapB6v15006ES3_
	.weak_definition	__ZNSt3__118__unwrap_iter_implIPN3map5PointELb1EE8__unwrapB6v15006ES3_
	.p2align	2
__ZNSt3__118__unwrap_iter_implIPN3map5PointELb1EE8__unwrapB6v15006ES3_: ; @_ZNSt3__118__unwrap_iter_implIPN3map5PointELb1EE8__unwrapB6v15006ES3_
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
	bl	__ZNSt3__112__to_addressB6v15006IN3map5PointEEEPT_S4_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__14pairIPKN3map5PointEPS2_EC1B6v15006IS4_S5_LPv0EEEOT_OT0_ ; -- Begin function _ZNSt3__14pairIPKN3map5PointEPS2_EC1B6v15006IS4_S5_LPv0EEEOT_OT0_
	.weak_def_can_be_hidden	__ZNSt3__14pairIPKN3map5PointEPS2_EC1B6v15006IS4_S5_LPv0EEEOT_OT0_
	.p2align	2
__ZNSt3__14pairIPKN3map5PointEPS2_EC1B6v15006IS4_S5_LPv0EEEOT_OT0_: ; @_ZNSt3__14pairIPKN3map5PointEPS2_EC1B6v15006IS4_S5_LPv0EEEOT_OT0_
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
	bl	__ZNSt3__14pairIPKN3map5PointEPS2_EC2B6v15006IS4_S5_LPv0EEEOT_OT0_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__14pairIPKN3map5PointEPS2_EC2B6v15006IS4_S5_LPv0EEEOT_OT0_ ; -- Begin function _ZNSt3__14pairIPKN3map5PointEPS2_EC2B6v15006IS4_S5_LPv0EEEOT_OT0_
	.weak_def_can_be_hidden	__ZNSt3__14pairIPKN3map5PointEPS2_EC2B6v15006IS4_S5_LPv0EEEOT_OT0_
	.p2align	2
__ZNSt3__14pairIPKN3map5PointEPS2_EC2B6v15006IS4_S5_LPv0EEEOT_OT0_: ; @_ZNSt3__14pairIPKN3map5PointEPS2_EC2B6v15006IS4_S5_LPv0EEEOT_OT0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldr	x0, [sp, #24]
	ldr	x8, [sp, #16]
	ldr	x8, [x8]
	str	x8, [x0]
	ldr	x8, [sp, #8]
	ldr	x8, [x8]
	str	x8, [x0, #8]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__119__unwrap_range_implIPKN3map5PointES4_E8__rewrapB6v15006ES4_S4_ ; -- Begin function _ZNSt3__119__unwrap_range_implIPKN3map5PointES4_E8__rewrapB6v15006ES4_S4_
	.globl	__ZNSt3__119__unwrap_range_implIPKN3map5PointES4_E8__rewrapB6v15006ES4_S4_
	.weak_definition	__ZNSt3__119__unwrap_range_implIPKN3map5PointES4_E8__rewrapB6v15006ES4_S4_
	.p2align	2
__ZNSt3__119__unwrap_range_implIPKN3map5PointES4_E8__rewrapB6v15006ES4_S4_: ; @_ZNSt3__119__unwrap_range_implIPKN3map5PointES4_E8__rewrapB6v15006ES4_S4_
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
	bl	__ZNSt3__113__rewrap_iterB6v15006IPKN3map5PointES4_NS_18__unwrap_iter_implIS4_Lb1EEEEET_S7_T0_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__113__rewrap_iterB6v15006IPKN3map5PointES4_NS_18__unwrap_iter_implIS4_Lb1EEEEET_S7_T0_ ; -- Begin function _ZNSt3__113__rewrap_iterB6v15006IPKN3map5PointES4_NS_18__unwrap_iter_implIS4_Lb1EEEEET_S7_T0_
	.globl	__ZNSt3__113__rewrap_iterB6v15006IPKN3map5PointES4_NS_18__unwrap_iter_implIS4_Lb1EEEEET_S7_T0_
	.weak_definition	__ZNSt3__113__rewrap_iterB6v15006IPKN3map5PointES4_NS_18__unwrap_iter_implIS4_Lb1EEEEET_S7_T0_
	.p2align	2
__ZNSt3__113__rewrap_iterB6v15006IPKN3map5PointES4_NS_18__unwrap_iter_implIS4_Lb1EEEEET_S7_T0_: ; @_ZNSt3__113__rewrap_iterB6v15006IPKN3map5PointES4_NS_18__unwrap_iter_implIS4_Lb1EEEEET_S7_T0_
Lfunc_begin8:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception8
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
Ltmp46:
	bl	__ZNSt3__118__unwrap_iter_implIPKN3map5PointELb1EE8__rewrapB6v15006ES4_S4_
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
Ltmp47:
	b	LBB100_1
LBB100_1:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB100_2:
Ltmp48:
	bl	___clang_call_terminate
Lfunc_end8:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table100:
Lexception8:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase2-Lttbaseref2
Lttbaseref2:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end8-Lcst_begin8
Lcst_begin8:
	.uleb128 Ltmp46-Lfunc_begin8            ; >> Call Site 1 <<
	.uleb128 Ltmp47-Ltmp46                  ;   Call between Ltmp46 and Ltmp47
	.uleb128 Ltmp48-Lfunc_begin8            ;     jumps to Ltmp48
	.byte	1                               ;   On action: 1
Lcst_end8:
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
	.private_extern	__ZNSt3__118__unwrap_iter_implIPKN3map5PointELb1EE8__rewrapB6v15006ES4_S4_ ; -- Begin function _ZNSt3__118__unwrap_iter_implIPKN3map5PointELb1EE8__rewrapB6v15006ES4_S4_
	.globl	__ZNSt3__118__unwrap_iter_implIPKN3map5PointELb1EE8__rewrapB6v15006ES4_S4_
	.weak_definition	__ZNSt3__118__unwrap_iter_implIPKN3map5PointELb1EE8__rewrapB6v15006ES4_S4_
	.p2align	2
__ZNSt3__118__unwrap_iter_implIPKN3map5PointELb1EE8__rewrapB6v15006ES4_S4_: ; @_ZNSt3__118__unwrap_iter_implIPKN3map5PointELb1EE8__rewrapB6v15006ES4_S4_
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
	ldur	x8, [x29, #-8]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x8, [sp, #16]
	str	x8, [sp]                        ; 8-byte Folded Spill
	ldur	x0, [x29, #-8]
	bl	__ZNSt3__112__to_addressB6v15006IKN3map5PointEEEPT_S5_
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	subs	x9, x9, x0
	mov	x10, #16
	sdiv	x9, x9, x10
	add	x0, x8, x9, lsl #4
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__118__unwrap_iter_implIPN3map5PointELb1EE8__rewrapB6v15006ES3_S3_ ; -- Begin function _ZNSt3__118__unwrap_iter_implIPN3map5PointELb1EE8__rewrapB6v15006ES3_S3_
	.globl	__ZNSt3__118__unwrap_iter_implIPN3map5PointELb1EE8__rewrapB6v15006ES3_S3_
	.weak_definition	__ZNSt3__118__unwrap_iter_implIPN3map5PointELb1EE8__rewrapB6v15006ES3_S3_
	.p2align	2
__ZNSt3__118__unwrap_iter_implIPN3map5PointELb1EE8__rewrapB6v15006ES3_S3_: ; @_ZNSt3__118__unwrap_iter_implIPN3map5PointELb1EE8__rewrapB6v15006ES3_S3_
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
	ldur	x8, [x29, #-8]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x8, [sp, #16]
	str	x8, [sp]                        ; 8-byte Folded Spill
	ldur	x0, [x29, #-8]
	bl	__ZNSt3__112__to_addressB6v15006IN3map5PointEEEPT_S4_
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	subs	x9, x9, x0
	mov	x10, #16
	sdiv	x9, x9, x10
	add	x0, x8, x9, lsl #4
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	tbnz	w8, #0, LBB107_2
	b	LBB107_1
LBB107_1:
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
	b	LBB107_2
LBB107_2:
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
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE18__construct_at_endIPS2_EENS_9enable_ifIXsr27__is_cpp17_forward_iteratorIT_EE5valueEvE4typeES9_S9_m ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE18__construct_at_endIPS2_EENS_9enable_ifIXsr27__is_cpp17_forward_iteratorIT_EE5valueEvE4typeES9_S9_m
	.weak_definition	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE18__construct_at_endIPS2_EENS_9enable_ifIXsr27__is_cpp17_forward_iteratorIT_EE5valueEvE4typeES9_S9_m
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE18__construct_at_endIPS2_EENS_9enable_ifIXsr27__is_cpp17_forward_iteratorIT_EE5valueEvE4typeES9_S9_m: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE18__construct_at_endIPS2_EENS_9enable_ifIXsr27__is_cpp17_forward_iteratorIT_EE5valueEvE4typeES9_S9_m
Lfunc_begin9:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception9
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
Ltmp54:
	bl	__ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEEPS3_S5_S5_EET2_RT_T0_T1_S6_
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
Ltmp55:
	b	LBB111_1
LBB111_1:
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	add	x0, sp, #40
	str	x8, [sp, #48]
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionD1Ev
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB111_2:
Ltmp56:
	mov	x8, x1
	str	x0, [sp, #32]
	str	w8, [sp, #28]
	add	x0, sp, #40
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE21_ConstructTransactionD1Ev
	b	LBB111_3
LBB111_3:
	ldr	x0, [sp, #32]
	bl	__Unwind_Resume
Lfunc_end9:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table111:
Lexception9:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end9-Lcst_begin9
Lcst_begin9:
	.uleb128 Lfunc_begin9-Lfunc_begin9      ; >> Call Site 1 <<
	.uleb128 Ltmp54-Lfunc_begin9            ;   Call between Lfunc_begin9 and Ltmp54
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp54-Lfunc_begin9            ; >> Call Site 2 <<
	.uleb128 Ltmp55-Ltmp54                  ;   Call between Ltmp54 and Ltmp55
	.uleb128 Ltmp56-Lfunc_begin9            ;     jumps to Ltmp56
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp55-Lfunc_begin9            ; >> Call Site 3 <<
	.uleb128 Lfunc_end9-Ltmp55              ;   Call between Ltmp55 and Lfunc_end9
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end9:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
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
	.private_extern	__ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEEPS3_S5_S5_EET2_RT_T0_T1_S6_ ; -- Begin function _ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEEPS3_S5_S5_EET2_RT_T0_T1_S6_
	.globl	__ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEEPS3_S5_S5_EET2_RT_T0_T1_S6_
	.weak_definition	__ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEEPS3_S5_S5_EET2_RT_T0_T1_S6_
	.p2align	2
__ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEEPS3_S5_S5_EET2_RT_T0_T1_S6_: ; @_ZNSt3__130__uninitialized_allocator_copyB6v15006INS_9allocatorIN3map5PointEEEPS3_S5_S5_EET2_RT_T0_T1_S6_
Lfunc_begin10:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception10
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
	b	LBB114_1
LBB114_1:                               ; =>This Inner Loop Header: Depth=1
	ldur	x8, [x29, #-16]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB114_8
	b	LBB114_2
LBB114_2:                               ;   in Loop: Header=BB114_1 Depth=1
	ldur	x8, [x29, #-8]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	ldur	x0, [x29, #-32]
	bl	__ZNSt3__112__to_addressB6v15006IN3map5PointEEEPT_S4_
	mov	x1, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldur	x2, [x29, #-16]
Ltmp58:
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE9constructB6v15006IS3_JRS3_EvvEEvRS4_PT_DpOT0_
Ltmp59:
	b	LBB114_3
LBB114_3:                               ;   in Loop: Header=BB114_1 Depth=1
	ldur	x8, [x29, #-16]
	add	x8, x8, #16
	stur	x8, [x29, #-16]
	ldur	x8, [x29, #-32]
	add	x8, x8, #16
	stur	x8, [x29, #-32]
	b	LBB114_1
LBB114_4:
Ltmp60:
	mov	x8, x1
	str	x0, [sp, #48]
	str	w8, [sp, #44]
	b	LBB114_5
LBB114_5:
	ldr	x0, [sp, #48]
	bl	___cxa_begin_catch
	ldur	x1, [x29, #-8]
Ltmp61:
	add	x0, sp, #16
	sub	x2, x29, #40
	sub	x3, x29, #32
	bl	__ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EC1B6v15006ERS4_RS5_S8_
Ltmp62:
	b	LBB114_6
LBB114_6:
Ltmp63:
	add	x0, sp, #16
	bl	__ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorIN3map5PointEEEPS3_EclB6v15006Ev
Ltmp64:
	b	LBB114_7
LBB114_7:
Ltmp65:
	bl	___cxa_rethrow
Ltmp66:
	b	LBB114_14
LBB114_8:
	b	LBB114_11
LBB114_9:
Ltmp67:
	mov	x8, x1
	str	x0, [sp, #48]
	str	w8, [sp, #44]
Ltmp68:
	bl	___cxa_end_catch
Ltmp69:
	b	LBB114_10
LBB114_10:
	b	LBB114_12
LBB114_11:
	ldur	x0, [x29, #-32]
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB114_12:
	ldr	x0, [sp, #48]
	bl	__Unwind_Resume
LBB114_13:
Ltmp70:
	bl	___clang_call_terminate
LBB114_14:
	brk	#0x1
Lfunc_end10:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table114:
Lexception10:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase3-Lttbaseref3
Lttbaseref3:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end10-Lcst_begin10
Lcst_begin10:
	.uleb128 Ltmp58-Lfunc_begin10           ; >> Call Site 1 <<
	.uleb128 Ltmp59-Ltmp58                  ;   Call between Ltmp58 and Ltmp59
	.uleb128 Ltmp60-Lfunc_begin10           ;     jumps to Ltmp60
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp59-Lfunc_begin10           ; >> Call Site 2 <<
	.uleb128 Ltmp61-Ltmp59                  ;   Call between Ltmp59 and Ltmp61
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp61-Lfunc_begin10           ; >> Call Site 3 <<
	.uleb128 Ltmp66-Ltmp61                  ;   Call between Ltmp61 and Ltmp66
	.uleb128 Ltmp67-Lfunc_begin10           ;     jumps to Ltmp67
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp68-Lfunc_begin10           ; >> Call Site 4 <<
	.uleb128 Ltmp69-Ltmp68                  ;   Call between Ltmp68 and Ltmp69
	.uleb128 Ltmp70-Lfunc_begin10           ;     jumps to Ltmp70
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp69-Lfunc_begin10           ; >> Call Site 5 <<
	.uleb128 Lfunc_end10-Ltmp69             ;   Call between Ltmp69 and Lfunc_end10
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end10:
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
	b	LBB120_1
LBB120_1:                               ; =>This Inner Loop Header: Depth=1
	sub	x0, x29, #16
	add	x1, sp, #16
	bl	__ZNSt3__1neB6v15006IPN3map5PointES3_EEbRKNS_16reverse_iteratorIT_EERKNS4_IT0_EE
	tbz	w0, #0, LBB120_4
	b	LBB120_2
LBB120_2:                               ;   in Loop: Header=BB120_1 Depth=1
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	sub	x0, x29, #16
	bl	__ZNSt3__112__to_addressB6v15006INS_16reverse_iteratorIPN3map5PointEEEvEENS_5decayIDTclsr19__to_address_helperIT_EE6__callcl7declvalIRKS7_EEEEE4typeES9_
	mov	x1, x0
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE7destroyB6v15006IS3_vvEEvRS4_PT_
	b	LBB120_3
LBB120_3:                               ;   in Loop: Header=BB120_1 Depth=1
	sub	x0, x29, #16
	bl	__ZNSt3__116reverse_iteratorIPN3map5PointEEppB6v15006Ev
	b	LBB120_1
LBB120_4:
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
Lfunc_begin11:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception11
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
Ltmp76:
	bl	__ZNKSt3__116reverse_iteratorIPN3map5PointEEptB6v15006Ev
	str	x0, [sp]                        ; 8-byte Folded Spill
Ltmp77:
	b	LBB129_1
LBB129_1:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZNSt3__112__to_addressB6v15006IN3map5PointEEEPT_S4_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
LBB129_2:
Ltmp78:
	bl	___clang_call_terminate
Lfunc_end11:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table129:
Lexception11:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase4-Lttbaseref4
Lttbaseref4:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end11-Lcst_begin11
Lcst_begin11:
	.uleb128 Ltmp76-Lfunc_begin11           ; >> Call Site 1 <<
	.uleb128 Ltmp77-Ltmp76                  ;   Call between Ltmp76 and Ltmp77
	.uleb128 Ltmp78-Lfunc_begin11           ;     jumps to Ltmp78
	.byte	1                               ;   On action: 1
Lcst_end11:
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
	.private_extern	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED2B6v15006Ev ; -- Begin function _ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED2B6v15006Ev
	.globl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED2B6v15006Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED2B6v15006Ev
	.p2align	2
__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED2B6v15006Ev: ; @_ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEED2B6v15006Ev
Lfunc_begin12:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception12
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
Ltmp82:
	bl	__ZNSt3__118__debug_db_erase_cB6v15006INS_6vectorIN3map5PointENS_9allocatorIS3_EEEEEEvPT_
Ltmp83:
	b	LBB136_1
LBB136_1:
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x8, [x8]
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB136_3
	b	LBB136_2
LBB136_2:
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
	b	LBB136_3
LBB136_3:
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB136_4:
Ltmp84:
	bl	___clang_call_terminate
Lfunc_end12:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table136:
Lexception12:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase5-Lttbaseref5
Lttbaseref5:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end12-Lcst_begin12
Lcst_begin12:
	.uleb128 Ltmp82-Lfunc_begin12           ; >> Call Site 1 <<
	.uleb128 Ltmp83-Ltmp82                  ;   Call between Ltmp82 and Ltmp83
	.uleb128 Ltmp84-Lfunc_begin12           ;     jumps to Ltmp84
	.byte	1                               ;   On action: 1
Lcst_end12:
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
	ldr	x8, [x8, #8]
	str	x8, [sp, #24]
	b	LBB141_1
LBB141_1:                               ; =>This Inner Loop Header: Depth=1
	ldur	x8, [x29, #-16]
	ldr	x9, [sp, #24]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB141_4
	b	LBB141_2
LBB141_2:                               ;   in Loop: Header=BB141_1 Depth=1
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNSt3__16vectorIN3map5PointENS_9allocatorIS2_EEE7__allocB6v15006Ev
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x8, [sp, #24]
	subs	x0, x8, #16
	str	x0, [sp, #24]
	bl	__ZNSt3__112__to_addressB6v15006IN3map5PointEEEPT_S4_
	mov	x1, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
Ltmp86:
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIN3map5PointEEEE7destroyB6v15006IS3_vvEEvRS4_PT_
Ltmp87:
	b	LBB141_3
LBB141_3:                               ;   in Loop: Header=BB141_1 Depth=1
	b	LBB141_1
LBB141_4:
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldur	x8, [x29, #-16]
	str	x8, [x9, #8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB141_5:
Ltmp88:
	bl	___clang_call_terminate
Lfunc_end13:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table141:
Lexception13:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase6-Lttbaseref6
Lttbaseref6:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end13-Lcst_begin13
Lcst_begin13:
	.uleb128 Ltmp86-Lfunc_begin13           ; >> Call Site 1 <<
	.uleb128 Ltmp87-Ltmp86                  ;   Call between Ltmp86 and Ltmp87
	.uleb128 Ltmp88-Lfunc_begin13           ;     jumps to Ltmp88
	.byte	1                               ;   On action: 1
Lcst_end13:
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
	.private_extern	__ZNSt3__19allocatorIN3map5PointEE10deallocateB6v15006EPS2_m ; -- Begin function _ZNSt3__19allocatorIN3map5PointEE10deallocateB6v15006EPS2_m
	.globl	__ZNSt3__19allocatorIN3map5PointEE10deallocateB6v15006EPS2_m
	.weak_definition	__ZNSt3__19allocatorIN3map5PointEE10deallocateB6v15006EPS2_m
	.p2align	2
__ZNSt3__19allocatorIN3map5PointEE10deallocateB6v15006EPS2_m: ; @_ZNSt3__19allocatorIN3map5PointEE10deallocateB6v15006EPS2_m
Lfunc_begin14:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception14
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
Ltmp89:
	mov	x2, #8
	bl	__ZNSt3__119__libcpp_deallocateB6v15006EPvmm
Ltmp90:
	b	LBB142_1
LBB142_1:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB142_2:
Ltmp91:
	bl	___clang_call_terminate
Lfunc_end14:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table142:
Lexception14:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase7-Lttbaseref7
Lttbaseref7:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end14-Lcst_begin14
Lcst_begin14:
	.uleb128 Ltmp89-Lfunc_begin14           ; >> Call Site 1 <<
	.uleb128 Ltmp90-Ltmp89                  ;   Call between Ltmp89 and Ltmp90
	.uleb128 Ltmp91-Lfunc_begin14           ;     jumps to Ltmp91
	.byte	1                               ;   On action: 1
Lcst_end14:
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
	tbz	w0, #0, LBB143_2
	b	LBB143_1
LBB143_1:
	ldr	x8, [sp, #8]
	str	x8, [sp]
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #16]
	ldr	x2, [sp]
	bl	__ZNSt3__127__do_deallocate_handle_sizeB6v15006IJSt11align_val_tEEEvPvmDpT_
	b	LBB143_3
LBB143_2:
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #16]
	bl	__ZNSt3__127__do_deallocate_handle_sizeB6v15006IJEEEvPvmDpT_
	b	LBB143_3
LBB143_3:
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
	.private_extern	__ZNSt3__111__wrap_iterIPN3map5PointEEC1B6v15006EPKvS3_ ; -- Begin function _ZNSt3__111__wrap_iterIPN3map5PointEEC1B6v15006EPKvS3_
	.globl	__ZNSt3__111__wrap_iterIPN3map5PointEEC1B6v15006EPKvS3_
	.weak_def_can_be_hidden	__ZNSt3__111__wrap_iterIPN3map5PointEEC1B6v15006EPKvS3_
	.p2align	2
__ZNSt3__111__wrap_iterIPN3map5PointEEC1B6v15006EPKvS3_: ; @_ZNSt3__111__wrap_iterIPN3map5PointEEC1B6v15006EPKvS3_
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
	bl	__ZNSt3__111__wrap_iterIPN3map5PointEEC2B6v15006EPKvS3_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__111__wrap_iterIPN3map5PointEEC2B6v15006EPKvS3_ ; -- Begin function _ZNSt3__111__wrap_iterIPN3map5PointEEC2B6v15006EPKvS3_
	.globl	__ZNSt3__111__wrap_iterIPN3map5PointEEC2B6v15006EPKvS3_
	.weak_def_can_be_hidden	__ZNSt3__111__wrap_iterIPN3map5PointEEC2B6v15006EPKvS3_
	.p2align	2
__ZNSt3__111__wrap_iterIPN3map5PointEEC2B6v15006EPKvS3_: ; @_ZNSt3__111__wrap_iterIPN3map5PointEEC2B6v15006EPKvS3_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldr	x0, [sp, #24]
	ldr	x8, [sp, #8]
	str	x8, [x0]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__1eqB6v15006IPN3map5PointEEEbRKNS_11__wrap_iterIT_EES8_ ; -- Begin function _ZNSt3__1eqB6v15006IPN3map5PointEEEbRKNS_11__wrap_iterIT_EES8_
	.globl	__ZNSt3__1eqB6v15006IPN3map5PointEEEbRKNS_11__wrap_iterIT_EES8_
	.weak_definition	__ZNSt3__1eqB6v15006IPN3map5PointEEEbRKNS_11__wrap_iterIT_EES8_
	.p2align	2
__ZNSt3__1eqB6v15006IPN3map5PointEEEbRKNS_11__wrap_iterIT_EES8_: ; @_ZNSt3__1eqB6v15006IPN3map5PointEEEbRKNS_11__wrap_iterIT_EES8_
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
	bl	__ZNKSt3__111__wrap_iterIPN3map5PointEE4baseB6v15006Ev
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x0, [sp, #16]
	bl	__ZNKSt3__111__wrap_iterIPN3map5PointEE4baseB6v15006Ev
	mov	x8, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	subs	x8, x0, x8
	cset	w8, eq
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__111__wrap_iterIPN3map5PointEE4baseB6v15006Ev ; -- Begin function _ZNKSt3__111__wrap_iterIPN3map5PointEE4baseB6v15006Ev
	.globl	__ZNKSt3__111__wrap_iterIPN3map5PointEE4baseB6v15006Ev
	.weak_definition	__ZNKSt3__111__wrap_iterIPN3map5PointEE4baseB6v15006Ev
	.p2align	2
__ZNKSt3__111__wrap_iterIPN3map5PointEE4baseB6v15006Ev: ; @_ZNKSt3__111__wrap_iterIPN3map5PointEE4baseB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x0, [x8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map5PointmiES0_            ; -- Begin function _ZN3map5PointmiES0_
	.weak_definition	__ZN3map5PointmiES0_
	.p2align	2
__ZN3map5PointmiES0_:                   ; @_ZN3map5PointmiES0_
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
	fsub	d0, d0, d1
	ldr	d1, [x8, #8]
	ldr	d2, [sp, #24]
	fsub	d1, d1, d2
	sub	x0, x29, #16
	bl	__ZN3map5PointC1Edd
	ldur	d0, [x29, #-16]
	ldur	d1, [x29, #-8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
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
	.globl	__ZN3map6shapes8TriangleD2Ev    ; -- Begin function _ZN3map6shapes8TriangleD2Ev
	.weak_def_can_be_hidden	__ZN3map6shapes8TriangleD2Ev
	.p2align	2
__ZN3map6shapes8TriangleD2Ev:           ; @_ZN3map6shapes8TriangleD2Ev
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
	.globl	__ZN3map6shapes8TriangleC1ERKS1_ ; -- Begin function _ZN3map6shapes8TriangleC1ERKS1_
	.weak_def_can_be_hidden	__ZN3map6shapes8TriangleC1ERKS1_
	.p2align	2
__ZN3map6shapes8TriangleC1ERKS1_:       ; @_ZN3map6shapes8TriangleC1ERKS1_
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
	bl	__ZN3map6shapes8TriangleC2ERKS1_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEEC1B6v15006ILb1EvEEPS3_ ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEEC1B6v15006ILb1EvEEPS3_
	.weak_def_can_be_hidden	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEEC1B6v15006ILb1EvEEPS3_
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEEC1B6v15006ILb1EvEEPS3_: ; @_ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEEC1B6v15006ILb1EvEEPS3_
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
	bl	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEEC2B6v15006ILb1EvEEPS3_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN3map6shapes8TriangleC2ERKS1_ ; -- Begin function _ZN3map6shapes8TriangleC2ERKS1_
	.weak_def_can_be_hidden	__ZN3map6shapes8TriangleC2ERKS1_
	.p2align	2
__ZN3map6shapes8TriangleC2ERKS1_:       ; @_ZN3map6shapes8TriangleC2ERKS1_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, __ZTVN3map6shapes8TriangleE@PAGE
	add	x8, x8, __ZTVN3map6shapes8TriangleE@PAGEOFF
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
	.globl	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEEC2B6v15006ILb1EvEEPS3_ ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEEC2B6v15006ILb1EvEEPS3_
	.weak_def_can_be_hidden	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEEC2B6v15006ILb1EvEEPS3_
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEEC2B6v15006ILb1EvEEPS3_: ; @_ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEEC2B6v15006ILb1EvEEPS3_
Lfunc_begin15:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception15
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
Ltmp94:
	add	x2, sp, #15
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEEC1B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_
Ltmp95:
	b	LBB160_1
LBB160_1:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB160_2:
Ltmp96:
	bl	___clang_call_terminate
Lfunc_end15:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table160:
Lexception15:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase8-Lttbaseref8
Lttbaseref8:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end15-Lcst_begin15
Lcst_begin15:
	.uleb128 Ltmp94-Lfunc_begin15           ; >> Call Site 1 <<
	.uleb128 Ltmp95-Ltmp94                  ;   Call between Ltmp94 and Ltmp95
	.uleb128 Ltmp96-Lfunc_begin15           ;     jumps to Ltmp96
	.byte	1                               ;   On action: 1
Lcst_end15:
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
	.globl	__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEEC1B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_ ; -- Begin function _ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEEC1B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_
	.weak_def_can_be_hidden	__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEEC1B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEEC1B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_: ; @_ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEEC1B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_
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
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEEC2B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEEC2B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_ ; -- Begin function _ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEEC2B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_
	.weak_def_can_be_hidden	__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEEC2B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEEC2B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_: ; @_ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEEC2B6v15006IRS4_NS_16__value_init_tagEEEOT_OT0_
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
	bl	__ZNSt3__122__compressed_pair_elemIPN3map6shapes8TriangleELi0ELb0EEC2B6v15006IRS4_vEEOT_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes8TriangleEEELi1ELb1EEC2B6v15006ENS_16__value_init_tagE
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__122__compressed_pair_elemIPN3map6shapes8TriangleELi0ELb0EEC2B6v15006IRS4_vEEOT_ ; -- Begin function _ZNSt3__122__compressed_pair_elemIPN3map6shapes8TriangleELi0ELb0EEC2B6v15006IRS4_vEEOT_
	.weak_def_can_be_hidden	__ZNSt3__122__compressed_pair_elemIPN3map6shapes8TriangleELi0ELb0EEC2B6v15006IRS4_vEEOT_
	.p2align	2
__ZNSt3__122__compressed_pair_elemIPN3map6shapes8TriangleELi0ELb0EEC2B6v15006IRS4_vEEOT_: ; @_ZNSt3__122__compressed_pair_elemIPN3map6shapes8TriangleELi0ELb0EEC2B6v15006IRS4_vEEOT_
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
	.private_extern	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes8TriangleEEELi1ELb1EEC2B6v15006ENS_16__value_init_tagE ; -- Begin function _ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes8TriangleEEELi1ELb1EEC2B6v15006ENS_16__value_init_tagE
	.globl	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes8TriangleEEELi1ELb1EEC2B6v15006ENS_16__value_init_tagE
	.weak_def_can_be_hidden	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes8TriangleEEELi1ELb1EEC2B6v15006ENS_16__value_init_tagE
	.p2align	2
__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes8TriangleEEELi1ELb1EEC2B6v15006ENS_16__value_init_tagE: ; @_ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes8TriangleEEELi1ELb1EEC2B6v15006ENS_16__value_init_tagE
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
	.private_extern	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEED2B6v15006Ev ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEED2B6v15006Ev
	.globl	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEED2B6v15006Ev
	.weak_def_can_be_hidden	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEED2B6v15006Ev
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEED2B6v15006Ev: ; @_ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEED2B6v15006Ev
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
	bl	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE5resetB6v15006EPS3_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE5resetB6v15006EPS3_ ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE5resetB6v15006EPS3_
	.globl	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE5resetB6v15006EPS3_
	.weak_definition	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE5resetB6v15006EPS3_
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE5resetB6v15006EPS3_: ; @_ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE5resetB6v15006EPS3_
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
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEE5firstB6v15006Ev
	mov	x8, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [x8]
	str	x8, [sp, #24]
	ldur	x8, [x29, #-16]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEE5firstB6v15006Ev
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	str	x8, [x0]
	ldr	x8, [sp, #24]
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB166_2
	b	LBB166_1
LBB166_1:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEE6secondB6v15006Ev
	ldr	x1, [sp, #24]
	bl	__ZNKSt3__114default_deleteIN3map6shapes8TriangleEEclB6v15006EPS3_
	b	LBB166_2
LBB166_2:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEE5firstB6v15006Ev ; -- Begin function _ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEE5firstB6v15006Ev
	.globl	__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEE5firstB6v15006Ev
	.weak_definition	__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEE5firstB6v15006Ev
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEE5firstB6v15006Ev: ; @_ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEE5firstB6v15006Ev
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
	bl	__ZNSt3__122__compressed_pair_elemIPN3map6shapes8TriangleELi0ELb0EE5__getB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEE6secondB6v15006Ev ; -- Begin function _ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEE6secondB6v15006Ev
	.globl	__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEE6secondB6v15006Ev
	.weak_definition	__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEE6secondB6v15006Ev
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEE6secondB6v15006Ev: ; @_ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEE6secondB6v15006Ev
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
	bl	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes8TriangleEEELi1ELb1EE5__getB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__114default_deleteIN3map6shapes8TriangleEEclB6v15006EPS3_ ; -- Begin function _ZNKSt3__114default_deleteIN3map6shapes8TriangleEEclB6v15006EPS3_
	.globl	__ZNKSt3__114default_deleteIN3map6shapes8TriangleEEclB6v15006EPS3_
	.weak_definition	__ZNKSt3__114default_deleteIN3map6shapes8TriangleEEclB6v15006EPS3_
	.p2align	2
__ZNKSt3__114default_deleteIN3map6shapes8TriangleEEclB6v15006EPS3_: ; @_ZNKSt3__114default_deleteIN3map6shapes8TriangleEEclB6v15006EPS3_
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
	tbnz	w8, #0, LBB169_2
	b	LBB169_1
LBB169_1:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	blr	x8
	b	LBB169_2
LBB169_2:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__122__compressed_pair_elemIPN3map6shapes8TriangleELi0ELb0EE5__getB6v15006Ev ; -- Begin function _ZNSt3__122__compressed_pair_elemIPN3map6shapes8TriangleELi0ELb0EE5__getB6v15006Ev
	.globl	__ZNSt3__122__compressed_pair_elemIPN3map6shapes8TriangleELi0ELb0EE5__getB6v15006Ev
	.weak_definition	__ZNSt3__122__compressed_pair_elemIPN3map6shapes8TriangleELi0ELb0EE5__getB6v15006Ev
	.p2align	2
__ZNSt3__122__compressed_pair_elemIPN3map6shapes8TriangleELi0ELb0EE5__getB6v15006Ev: ; @_ZNSt3__122__compressed_pair_elemIPN3map6shapes8TriangleELi0ELb0EE5__getB6v15006Ev
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
	.private_extern	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes8TriangleEEELi1ELb1EE5__getB6v15006Ev ; -- Begin function _ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes8TriangleEEELi1ELb1EE5__getB6v15006Ev
	.globl	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes8TriangleEEELi1ELb1EE5__getB6v15006Ev
	.weak_definition	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes8TriangleEEELi1ELb1EE5__getB6v15006Ev
	.p2align	2
__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes8TriangleEEELi1ELb1EE5__getB6v15006Ev: ; @_ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes8TriangleEEELi1ELb1EE5__getB6v15006Ev
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
	.globl	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006INS2_8TriangleENS4_IS8_EEvvEEONS0_IT_T0_EE ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006INS2_8TriangleENS4_IS8_EEvvEEONS0_IT_T0_EE
	.weak_def_can_be_hidden	__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006INS2_8TriangleENS4_IS8_EEvvEEONS0_IT_T0_EE
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006INS2_8TriangleENS4_IS8_EEvvEEONS0_IT_T0_EE: ; @_ZNSt3__110unique_ptrIN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006INS2_8TriangleENS4_IS8_EEvvEEONS0_IT_T0_EE
Lfunc_begin16:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception16
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
	bl	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE7releaseB6v15006Ev
	add	x8, sp, #24
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	str	x0, [sp, #24]
	ldur	x0, [x29, #-16]
	bl	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE11get_deleterB6v15006Ev
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	mov	x2, x0
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
Ltmp101:
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006IPNS2_8TriangleENS5_IS9_EEEEOT_OT0_
Ltmp102:
	b	LBB172_1
LBB172_1:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB172_2:
Ltmp103:
	bl	___clang_call_terminate
Lfunc_end16:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table172:
Lexception16:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase9-Lttbaseref9
Lttbaseref9:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end16-Lcst_begin16
Lcst_begin16:
	.uleb128 Ltmp101-Lfunc_begin16          ; >> Call Site 1 <<
	.uleb128 Ltmp102-Ltmp101                ;   Call between Ltmp101 and Ltmp102
	.uleb128 Ltmp103-Lfunc_begin16          ;     jumps to Ltmp103
	.byte	1                               ;   On action: 1
Lcst_end16:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase9:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE7releaseB6v15006Ev ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE7releaseB6v15006Ev
	.globl	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE7releaseB6v15006Ev
	.weak_definition	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE7releaseB6v15006Ev
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE7releaseB6v15006Ev: ; @_ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE7releaseB6v15006Ev
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
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEE5firstB6v15006Ev
	mov	x8, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [x8]
	str	x8, [sp, #16]
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEE5firstB6v15006Ev
                                        ; kill: def $x8 killed $xzr
	str	xzr, [x0]
	ldr	x0, [sp, #16]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE11get_deleterB6v15006Ev ; -- Begin function _ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE11get_deleterB6v15006Ev
	.globl	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE11get_deleterB6v15006Ev
	.weak_definition	__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE11get_deleterB6v15006Ev
	.p2align	2
__ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE11get_deleterB6v15006Ev: ; @_ZNSt3__110unique_ptrIN3map6shapes8TriangleENS_14default_deleteIS3_EEE11get_deleterB6v15006Ev
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
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes8TriangleENS_14default_deleteIS3_EEE6secondB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006IPNS2_8TriangleENS5_IS9_EEEEOT_OT0_ ; -- Begin function _ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006IPNS2_8TriangleENS5_IS9_EEEEOT_OT0_
	.weak_def_can_be_hidden	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006IPNS2_8TriangleENS5_IS9_EEEEOT_OT0_
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006IPNS2_8TriangleENS5_IS9_EEEEOT_OT0_: ; @_ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC1B6v15006IPNS2_8TriangleENS5_IS9_EEEEOT_OT0_
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
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006IPNS2_8TriangleENS5_IS9_EEEEOT_OT0_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006IPNS2_8TriangleENS5_IS9_EEEEOT_OT0_ ; -- Begin function _ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006IPNS2_8TriangleENS5_IS9_EEEEOT_OT0_
	.weak_def_can_be_hidden	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006IPNS2_8TriangleENS5_IS9_EEEEOT_OT0_
	.p2align	2
__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006IPNS2_8TriangleENS5_IS9_EEEEOT_OT0_: ; @_ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEEC2B6v15006IPNS2_8TriangleENS5_IS9_EEEEOT_OT0_
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
	bl	__ZNSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EEC2B6v15006IPNS2_8TriangleEvEEOT_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldr	x1, [sp, #8]
	bl	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes5ShapeEEELi1ELb1EEC2B6v15006INS1_INS3_8TriangleEEEvEEOT_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EEC2B6v15006IPNS2_8TriangleEvEEOT_ ; -- Begin function _ZNSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EEC2B6v15006IPNS2_8TriangleEvEEOT_
	.weak_def_can_be_hidden	__ZNSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EEC2B6v15006IPNS2_8TriangleEvEEOT_
	.p2align	2
__ZNSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EEC2B6v15006IPNS2_8TriangleEvEEOT_: ; @_ZNSt3__122__compressed_pair_elemIPN3map6shapes5ShapeELi0ELb0EEC2B6v15006IPNS2_8TriangleEvEEOT_
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
	.globl	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes5ShapeEEELi1ELb1EEC2B6v15006INS1_INS3_8TriangleEEEvEEOT_ ; -- Begin function _ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes5ShapeEEELi1ELb1EEC2B6v15006INS1_INS3_8TriangleEEEvEEOT_
	.weak_def_can_be_hidden	__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes5ShapeEEELi1ELb1EEC2B6v15006INS1_INS3_8TriangleEEEvEEOT_
	.p2align	2
__ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes5ShapeEEELi1ELb1EEC2B6v15006INS1_INS3_8TriangleEEEvEEOT_: ; @_ZNSt3__122__compressed_pair_elemINS_14default_deleteIN3map6shapes5ShapeEEELi1ELb1EEC2B6v15006INS1_INS3_8TriangleEEEvEEOT_
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
	bl	__ZNSt3__114default_deleteIN3map6shapes5ShapeEEC2B6v15006INS2_8TriangleEEERKNS0_IT_EEPNS_9enable_ifIXsr14is_convertibleIPS7_PS3_EE5valueEvE4typeE
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__114default_deleteIN3map6shapes5ShapeEEC2B6v15006INS2_8TriangleEEERKNS0_IT_EEPNS_9enable_ifIXsr14is_convertibleIPS7_PS3_EE5valueEvE4typeE ; -- Begin function _ZNSt3__114default_deleteIN3map6shapes5ShapeEEC2B6v15006INS2_8TriangleEEERKNS0_IT_EEPNS_9enable_ifIXsr14is_convertibleIPS7_PS3_EE5valueEvE4typeE
	.weak_def_can_be_hidden	__ZNSt3__114default_deleteIN3map6shapes5ShapeEEC2B6v15006INS2_8TriangleEEERKNS0_IT_EEPNS_9enable_ifIXsr14is_convertibleIPS7_PS3_EE5valueEvE4typeE
	.p2align	2
__ZNSt3__114default_deleteIN3map6shapes5ShapeEEC2B6v15006INS2_8TriangleEEERKNS0_IT_EEPNS_9enable_ifIXsr14is_convertibleIPS7_PS3_EE5valueEvE4typeE: ; @_ZNSt3__114default_deleteIN3map6shapes5ShapeEEC2B6v15006INS2_8TriangleEEERKNS0_IT_EEPNS_9enable_ifIXsr14is_convertibleIPS7_PS3_EE5valueEvE4typeE
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
	tbnz	w8, #0, LBB181_2
	b	LBB181_1
LBB181_1:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__117__compressed_pairIPN3map6shapes5ShapeENS_14default_deleteIS3_EEE6secondB6v15006Ev
	ldr	x1, [sp, #24]
	bl	__ZNKSt3__114default_deleteIN3map6shapes5ShapeEEclB6v15006EPS3_
	b	LBB181_2
LBB181_2:
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
	tbnz	w8, #0, LBB184_2
	b	LBB184_1
LBB184_1:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	blr	x8
	b	LBB184_2
LBB184_2:
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
	.globl	__ZTVN3map6shapes8TriangleE     ; @_ZTVN3map6shapes8TriangleE
	.p2align	3
__ZTVN3map6shapes8TriangleE:
	.quad	0
	.quad	__ZTIN3map6shapes8TriangleE
	.quad	__ZN3map6shapes8Triangle6rotateEd
	.quad	__ZNK3map6shapes8Triangle7rotatedEd
	.quad	__ZN3map6shapes8Triangle5shiftENS_5PointE
	.quad	__ZNK3map6shapes8Triangle7shiftedENS_5PointE
	.quad	__ZN3map6shapes8TriangleD1Ev
	.quad	__ZN3map6shapes8TriangleD0Ev
	.quad	__ZNK3map6shapes8Triangle4drawEPNS_6MapperE

	.section	__TEXT,__const
	.globl	__ZTSN3map6shapes8TriangleE     ; @_ZTSN3map6shapes8TriangleE
__ZTSN3map6shapes8TriangleE:
	.asciz	"N3map6shapes8TriangleE"

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

	.globl	__ZTIN3map6shapes8TriangleE     ; @_ZTIN3map6shapes8TriangleE
	.p2align	3
__ZTIN3map6shapes8TriangleE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN3map6shapes8TriangleE
	.quad	__ZTIN3map6shapes5ShapeE

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"vector"

	.section	__DATA,__const
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

.subsections_via_symbols
