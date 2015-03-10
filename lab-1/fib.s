	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}

	@ R4 = R0 - 0 (update flags)
	@ if(R0 <= 0) goto .L3 (which returns 0)
   mov r4, r0 
   cmp r4, #0
   itt ls
	movls r0, #0			@ R0 = 0
	popls {r3, r4, r5, pc}		@ EPILOG
    

	@ Compare R4 wtih 1
	@ If R4 == 1 goto .L4 (which returns 1)

   cmp r4, #1
   itt eq
   moveq r0, #1
   popeq {r3, r4, r5, pc}

	@ R0 = R4 - 1
	@ Recursive call to fibonacci with R4 - 1 as parameter
   sub r0, r4, #1
   bl fibonacci

	@ R5 = R0
	@ R0 = R4 - 2
	@ Recursive call to fibonacci with R4 - 2 as parameter
   mov r5, r0
   sub r0, r4, #2
   bl fibonacci

	@ R0 = R5 + R0 (update flags)
   add r0, r5, r0

	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
