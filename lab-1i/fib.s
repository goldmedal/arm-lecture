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

   @ previous = -1
   @ result = 1
   @ i = 0
   @ sum = 0

   MOV r3, #-1
   MOV r4, #1
   MOV r5, #0 
   MOV r6, #0
   
   @ for(i=0 i<=x i++)
   @ sum = previous + result
   @ previous = result
   @ result = sum

.for:

   ADD r6, r3, r4
   MOV r3, r4
   MOV r4, r6
   ADD r5, r5, #1

   cmp r5, r0
   ble .for

   mov r0, r4
	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
