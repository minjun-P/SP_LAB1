	.file	"decomment.c"
	.text
	.section	.rodata
.LC0:
	.string	"/%c"
.LC1:
	.string	" %c"
	.align 8
.LC2:
	.string	"Error: line %d: unterminated comment\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	stdout(%rip), %rax
	movq	%rax, -16(%rbp)
	movl	$0, -44(%rbp)
	movl	$1, -40(%rbp)
	movl	$-1, -36(%rbp)
	movl	$0, -48(%rbp)
	jmp	.L3
.L39:
	cmpl	$5, -44(%rbp)
	ja	.L3
	movl	-44(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L5(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L5(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L5:
	.long	.L10-.L5
	.long	.L9-.L5
	.long	.L8-.L5
	.long	.L7-.L5
	.long	.L6-.L5
	.long	.L4-.L5
	.text
.L10:
	cmpl	$47, -32(%rbp)
	je	.L11
	cmpl	$47, -32(%rbp)
	jg	.L12
	cmpl	$34, -32(%rbp)
	je	.L13
	cmpl	$39, -32(%rbp)
	je	.L14
	jmp	.L12
.L11:
	movl	$1, -44(%rbp)
	jmp	.L15
.L14:
	movl	$4, -44(%rbp)
	movl	-32(%rbp), %eax
	movl	%eax, %edi
	call	putchar@PLT
	jmp	.L15
.L13:
	movl	$5, -44(%rbp)
	movl	-32(%rbp), %eax
	movl	%eax, %edi
	call	putchar@PLT
	jmp	.L15
.L12:
	movl	$0, -44(%rbp)
	movl	-32(%rbp), %eax
	movl	%eax, %edi
	call	putchar@PLT
	cmpl	$10, -32(%rbp)
	jne	.L43
	addl	$1, -40(%rbp)
.L43:
	nop
.L15:
	jmp	.L3
.L9:
	cmpl	$47, -32(%rbp)
	je	.L18
	cmpl	$47, -32(%rbp)
	jg	.L19
	cmpl	$42, -32(%rbp)
	je	.L20
	cmpl	$42, -32(%rbp)
	jg	.L19
	cmpl	$34, -32(%rbp)
	je	.L21
	cmpl	$39, -32(%rbp)
	je	.L22
	jmp	.L19
.L18:
	movl	$2, -44(%rbp)
	jmp	.L23
.L20:
	movl	$3, -44(%rbp)
	movl	-40(%rbp), %eax
	movl	%eax, -36(%rbp)
	jmp	.L23
.L22:
	movl	$4, -44(%rbp)
	movl	-32(%rbp), %edx
	movq	-16(%rbp), %rax
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L23
.L21:
	movl	$5, -44(%rbp)
	movl	-32(%rbp), %edx
	movq	-16(%rbp), %rax
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L23
.L19:
	movl	$0, -44(%rbp)
	movl	-32(%rbp), %edx
	movq	-16(%rbp), %rax
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	cmpl	$10, -32(%rbp)
	jne	.L44
	addl	$1, -40(%rbp)
.L44:
	nop
.L23:
	jmp	.L3
.L8:
	cmpl	$10, -32(%rbp)
	jne	.L45
	movl	-32(%rbp), %edx
	movq	-16(%rbp), %rax
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, -44(%rbp)
	addl	$1, -40(%rbp)
	jmp	.L45
.L7:
	cmpl	$10, -32(%rbp)
	je	.L26
	cmpl	$42, -32(%rbp)
	je	.L27
	jmp	.L29
.L26:
	addl	$1, -40(%rbp)
	movl	-48(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -48(%rbp)
	jmp	.L29
.L27:
	call	getchar@PLT
	movl	%eax, -20(%rbp)
	cmpl	$47, -20(%rbp)
	jne	.L30
	movl	$0, -44(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	terminate_multi_line_comment
	jmp	.L46
.L30:
	movq	stdin(%rip), %rdx
	movl	-20(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	ungetc@PLT
.L46:
	nop
.L29:
	jmp	.L3
.L6:
	movl	-32(%rbp), %eax
	movl	%eax, %edi
	call	putchar@PLT
	cmpl	$39, -32(%rbp)
	je	.L32
	cmpl	$92, -32(%rbp)
	jne	.L47
	call	getchar@PLT
	movl	%eax, -24(%rbp)
	cmpl	$-1, -24(%rbp)
	jne	.L34
	movl	$0, %eax
	jmp	.L41
.L34:
	movl	-24(%rbp), %eax
	movl	%eax, %edi
	call	putchar@PLT
	jmp	.L33
.L32:
	movl	$0, -44(%rbp)
	nop
.L33:
	jmp	.L47
.L4:
	movl	-32(%rbp), %eax
	movl	%eax, %edi
	call	putchar@PLT
	cmpl	$34, -32(%rbp)
	je	.L36
	cmpl	$92, -32(%rbp)
	jne	.L48
	call	getchar@PLT
	movl	%eax, -28(%rbp)
	cmpl	$-1, -28(%rbp)
	jne	.L38
	movl	$0, %eax
	jmp	.L41
.L38:
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	putchar@PLT
	jmp	.L37
.L36:
	movl	$0, -44(%rbp)
	nop
.L37:
	jmp	.L48
.L45:
	nop
	jmp	.L3
.L47:
	nop
	jmp	.L3
.L48:
	nop
.L3:
	call	getchar@PLT
	movl	%eax, -32(%rbp)
	cmpl	$-1, -32(%rbp)
	jne	.L39
	cmpl	$3, -44(%rbp)
	jne	.L40
	movq	stderr(%rip), %rax
	movl	-36(%rbp), %edx
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	terminate_multi_line_comment
	movl	$1, %eax
	jmp	.L41
.L40:
	movl	$0, %eax
.L41:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L42
	call	__stack_chk_fail@PLT
.L42:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.globl	terminate_multi_line_comment
	.type	terminate_multi_line_comment, @function
terminate_multi_line_comment:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$32, %edi
	call	putchar@PLT
	movl	$0, -4(%rbp)
	jmp	.L50
.L51:
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -4(%rbp)
.L50:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L51
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	terminate_multi_line_comment, .-terminate_multi_line_comment
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
