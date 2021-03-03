    .file  "main.java"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__tmp_reg__ = 0
__zero_reg__ = 1
    .global __do_copy_data
    .global __do_clear_bss
    .text
.global main
    .type   main, @function
main:
    push r29
    push r28
    in r28,__SP_L__
    in r29,__SP_H__
/* prologue: function */
    call _Z18MeggyJrSimpleSetupv 
    /* Need to call this so that the meggy library gets set up */


    # NewExp
    ldi    r24, lo8(2)
    ldi    r25, hi8(2)
    # allocating object of size 2 on heap
    call    malloc
    # push object address
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 1
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 2
    ldi    r24,lo8(2)
    ldi    r25,hi8(2)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 3
    ldi    r24,lo8(3)
    ldi    r25,hi8(3)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 4
    ldi    r24,lo8(4)
    ldi    r25,hi8(4)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 5
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 6
    ldi    r24,lo8(6)
    ldi    r25,hi8(6)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 7
    ldi    r24,lo8(7)
    ldi    r25,hi8(7)
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 8
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    # push two byte expression onto stack
    push   r25
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # load a two byte expression off stack
    pop    r8
    pop    r9
    # load a two byte expression off stack
    pop    r10
    pop    r11
    # load a two byte expression off stack
    pop    r12
    pop    r13
    # load a two byte expression off stack
    pop    r14
    pop    r15
    # load a two byte expression off stack
    pop    r16
    pop    r17
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # load a two byte expression off stack
    pop    r20
    pop    r21
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Dots_run


/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



    .text
.global Dots_run
    .type  Dots_run, @function
Dots_run:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
    std    Y + 4, r23
    std    Y + 3, r22
    std    Y + 6, r21
    std    Y + 5, r20
    std    Y + 8, r19
    std    Y + 7, r18
    std    Y + 10, r17
    std    Y + 9, r16
    std    Y + 12, r15
    std    Y + 11, r14
    std    Y + 14, r13
    std    Y + 13, r12
    std    Y + 16, r11
    std    Y + 15, r10
    std    Y + 18, r9
    std    Y + 17, r8
/* done with function Dots_run prologue */


    # Load constant int 8
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    # push two byte expression onto stack
    push   r25
    push   r24

    ### NewArrayExp, allocating a new array
    # loading array size in elements
    # load a two byte expression off stack
    pop    r26
    pop    r27
    # since num elems might be in caller-saved registers
    # need to push num elems onto the stack around call to malloc
    # if had three-address code reg alloc could work around this
    push   r27
    push   r26
    # add size in elems to self to multiply by 2
    # complements of Jason Mealler
    add    r26,r26
    adc    r27,r27
    # need bytes for elems + 2 in bytes
    ldi    r24, 2
    ldi    r25, 0
    add    r24,r26
    adc    r25,r27
    # call malloc, it expects r25:r24 as input
    call   malloc
    # set .length field to number of elements
    mov    r31, r25
    mov    r30, r24
    pop    r26
    pop    r27
    std    Z+0,r26
    std    Z+1,r27
    # store object address
    # push two byte expression onto stack
    push   r31
    push   r30

    ### AssignStatement
    # load rhs exp
    # load a two byte expression off stack
    pop    r24
    pop    r25

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # store rhs into var p
    std    Z + 1, r25
    std    Z + 0, r24

    # IdExp
    # load value for variable p

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a two byte variable from base+offset
    ldd    r25, Z + 1
    ldd    r24, Z + 0
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 0
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    # push two byte expression onto stack
    push   r25
    push   r24

    # IdExp
    # load value for variable r1
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
    # push two byte expression onto stack
    push   r25
    push   r24

    ### ArrayAssignStatement
    # load rhs
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # calculate the array element address by first
    # loading index
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # add size in elems to self to multiply by 2
    # complements of Jason Mealler
    add    r18,r18
    adc    r19,r19
    # put index*(elem size in bytes) into r31:r30
    mov    r31, r19
    mov    r30, r18
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # loading array reference
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # store rhs into memory location for array element
    std    Z+0, r24
    std    Z+1, r25

    # IdExp
    # load value for variable p

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a two byte variable from base+offset
    ldd    r25, Z + 1
    ldd    r24, Z + 0
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 1
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    # push two byte expression onto stack
    push   r25
    push   r24

    # IdExp
    # load value for variable r2
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 6
    ldd    r24, Y + 5
    # push two byte expression onto stack
    push   r25
    push   r24

    ### ArrayAssignStatement
    # load rhs
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # calculate the array element address by first
    # loading index
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # add size in elems to self to multiply by 2
    # complements of Jason Mealler
    add    r18,r18
    adc    r19,r19
    # put index*(elem size in bytes) into r31:r30
    mov    r31, r19
    mov    r30, r18
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # loading array reference
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # store rhs into memory location for array element
    std    Z+0, r24
    std    Z+1, r25

    # IdExp
    # load value for variable p

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a two byte variable from base+offset
    ldd    r25, Z + 1
    ldd    r24, Z + 0
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 2
    ldi    r24,lo8(2)
    ldi    r25,hi8(2)
    # push two byte expression onto stack
    push   r25
    push   r24

    # IdExp
    # load value for variable r3
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 8
    ldd    r24, Y + 7
    # push two byte expression onto stack
    push   r25
    push   r24

    ### ArrayAssignStatement
    # load rhs
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # calculate the array element address by first
    # loading index
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # add size in elems to self to multiply by 2
    # complements of Jason Mealler
    add    r18,r18
    adc    r19,r19
    # put index*(elem size in bytes) into r31:r30
    mov    r31, r19
    mov    r30, r18
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # loading array reference
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # store rhs into memory location for array element
    std    Z+0, r24
    std    Z+1, r25

    # IdExp
    # load value for variable p

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a two byte variable from base+offset
    ldd    r25, Z + 1
    ldd    r24, Z + 0
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 3
    ldi    r24,lo8(3)
    ldi    r25,hi8(3)
    # push two byte expression onto stack
    push   r25
    push   r24

    # IdExp
    # load value for variable r4
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 10
    ldd    r24, Y + 9
    # push two byte expression onto stack
    push   r25
    push   r24

    ### ArrayAssignStatement
    # load rhs
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # calculate the array element address by first
    # loading index
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # add size in elems to self to multiply by 2
    # complements of Jason Mealler
    add    r18,r18
    adc    r19,r19
    # put index*(elem size in bytes) into r31:r30
    mov    r31, r19
    mov    r30, r18
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # loading array reference
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # store rhs into memory location for array element
    std    Z+0, r24
    std    Z+1, r25

    # IdExp
    # load value for variable p

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a two byte variable from base+offset
    ldd    r25, Z + 1
    ldd    r24, Z + 0
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 4
    ldi    r24,lo8(4)
    ldi    r25,hi8(4)
    # push two byte expression onto stack
    push   r25
    push   r24

    # IdExp
    # load value for variable r5
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 12
    ldd    r24, Y + 11
    # push two byte expression onto stack
    push   r25
    push   r24

    ### ArrayAssignStatement
    # load rhs
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # calculate the array element address by first
    # loading index
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # add size in elems to self to multiply by 2
    # complements of Jason Mealler
    add    r18,r18
    adc    r19,r19
    # put index*(elem size in bytes) into r31:r30
    mov    r31, r19
    mov    r30, r18
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # loading array reference
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # store rhs into memory location for array element
    std    Z+0, r24
    std    Z+1, r25

    # IdExp
    # load value for variable p

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a two byte variable from base+offset
    ldd    r25, Z + 1
    ldd    r24, Z + 0
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 5
    ldi    r24,lo8(5)
    ldi    r25,hi8(5)
    # push two byte expression onto stack
    push   r25
    push   r24

    # IdExp
    # load value for variable r6
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 14
    ldd    r24, Y + 13
    # push two byte expression onto stack
    push   r25
    push   r24

    ### ArrayAssignStatement
    # load rhs
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # calculate the array element address by first
    # loading index
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # add size in elems to self to multiply by 2
    # complements of Jason Mealler
    add    r18,r18
    adc    r19,r19
    # put index*(elem size in bytes) into r31:r30
    mov    r31, r19
    mov    r30, r18
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # loading array reference
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # store rhs into memory location for array element
    std    Z+0, r24
    std    Z+1, r25

    # IdExp
    # load value for variable p

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a two byte variable from base+offset
    ldd    r25, Z + 1
    ldd    r24, Z + 0
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 6
    ldi    r24,lo8(6)
    ldi    r25,hi8(6)
    # push two byte expression onto stack
    push   r25
    push   r24

    # IdExp
    # load value for variable r7
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 16
    ldd    r24, Y + 15
    # push two byte expression onto stack
    push   r25
    push   r24

    ### ArrayAssignStatement
    # load rhs
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # calculate the array element address by first
    # loading index
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # add size in elems to self to multiply by 2
    # complements of Jason Mealler
    add    r18,r18
    adc    r19,r19
    # put index*(elem size in bytes) into r31:r30
    mov    r31, r19
    mov    r30, r18
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # loading array reference
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # store rhs into memory location for array element
    std    Z+0, r24
    std    Z+1, r25

    # IdExp
    # load value for variable p

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a two byte variable from base+offset
    ldd    r25, Z + 1
    ldd    r24, Z + 0
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 7
    ldi    r24,lo8(7)
    ldi    r25,hi8(7)
    # push two byte expression onto stack
    push   r25
    push   r24

    # IdExp
    # load value for variable r8
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 18
    ldd    r24, Y + 17
    # push two byte expression onto stack
    push   r25
    push   r24

    ### ArrayAssignStatement
    # load rhs
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # calculate the array element address by first
    # loading index
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # add size in elems to self to multiply by 2
    # complements of Jason Mealler
    add    r18,r18
    adc    r19,r19
    # put index*(elem size in bytes) into r31:r30
    mov    r31, r19
    mov    r30, r18
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # loading array reference
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # store rhs into memory location for array element
    std    Z+0, r24
    std    Z+1, r25


    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # push two byte expression onto stack
    push   r31
    push   r30

    # IdExp
    # load value for variable p

    # loading the implicit "this"

    # load a two byte variable from base+offset
    ldd    r31, Y + 2
    ldd    r30, Y + 1
    # variable is a member variable

    # load a two byte variable from base+offset
    ldd    r25, Z + 1
    ldd    r24, Z + 0
    # push two byte expression onto stack
    push   r25
    push   r24

    #### function call
    # put parameter values into appropriate registers
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # receiver will be passed as first param
    # load a two byte expression off stack
    pop    r24
    pop    r25

    call    Dots_displayboard

/* epilogue start for Dots_run */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Dots_run, .-Dots_run


    .text
.global Dots_displayboard
    .type  Dots_displayboard, @function
Dots_displayboard:
    push   r29
    push   r28
    # make space for locals and params
    ldi    r30, 0
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30
    push   r30

    # Copy stack pointer to frame pointer
    in     r28,__SP_L__
    in     r29,__SP_H__

    # save off parameters
    std    Y + 2, r25
    std    Y + 1, r24
    std    Y + 4, r23
    std    Y + 3, r22
/* done with function Dots_displayboard prologue */


    # Load constant int 0
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    # push two byte expression onto stack
    push   r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # store rhs into var i
    std    Y + 8, r25
    std    Y + 7, r24

    #### while statement
MJ_L0:

    # IdExp
    # load value for variable i
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 8
    ldd    r24, Y + 7
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 8
    ldi    r24,lo8(8)
    ldi    r25,hi8(8)
    # push two byte expression onto stack
    push   r25
    push   r24

    # less than expression
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # load a two byte expression off stack
    pop    r24
    pop    r25
    cp    r24, r18
    cpc   r25, r19
    brlt MJ_L4

    # load false
MJ_L3:
    ldi     r24, 0
    jmp      MJ_L5

    # load true
MJ_L4:
    ldi    r24, 1

    # push result of less than
MJ_L5:
    # push one byte expression onto stack
    push   r24

    # if not(condition)
    # load a one byte expression off stack
    pop    r24
    ldi    r25,0
    cp     r24, r25
    # WANT breq MJ_L2
    brne   MJ_L1
    jmp    MJ_L2

    # while loop body
MJ_L1:

    # Load constant int 0
    ldi    r24,lo8(0)
    ldi    r25,hi8(0)
    # push two byte expression onto stack
    push   r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # store rhs into var j
    std    Y + 6, r25
    std    Y + 5, r24

    #### while statement
MJ_L6:

    # IdExp
    # load value for variable j
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 6
    ldd    r24, Y + 5
    # push two byte expression onto stack
    push   r25
    push   r24

    # IdExp
    # load value for variable a
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 4
    ldd    r24, Y + 3
    # push two byte expression onto stack
    push   r25
    push   r24

    # IdExp
    # load value for variable i
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 8
    ldd    r24, Y + 7
    # push two byte expression onto stack
    push   r25
    push   r24

    ### ArrayExp
    # calculate the array element address by first
    # loading index
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # add size in elems to self to multiply by 2
    # complements of Jason Mealler
    add    r18,r18
    adc    r19,r19
    # put index*(elem size in bytes) into r31:r30
    mov    r31, r19
    mov    r30, r18
    # want result of addressing arithmetic 
    # to be in r31:r30 for access through Z
    # index over length
    ldi    r20, 2
    ldi    r21, 0
    add    r30, r20
    adc    r31, r21
    # loading array reference
    # load a two byte expression off stack
    pop    r22
    pop    r23
    # add array reference to result of indexing arithmetic
    add    r30, r22
    adc    r31, r23
    # load array element and push onto stack
    ldd    r24, Z+0
    ldd    r25, Z+1
    # push two byte expression onto stack
    push   r25
    push   r24

    # less than expression
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # load a two byte expression off stack
    pop    r24
    pop    r25
    cp    r24, r18
    cpc   r25, r19
    brlt MJ_L10

    # load false
MJ_L9:
    ldi     r24, 0
    jmp      MJ_L11

    # load true
MJ_L10:
    ldi    r24, 1

    # push result of less than
MJ_L11:
    # push one byte expression onto stack
    push   r24

    # if not(condition)
    # load a one byte expression off stack
    pop    r24
    ldi    r25,0
    cp     r24, r25
    # WANT breq MJ_L8
    brne   MJ_L7
    jmp    MJ_L8

    # while loop body
MJ_L7:

    # IdExp
    # load value for variable j
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 6
    ldd    r24, Y + 5
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # IdExp
    # load value for variable i
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 8
    ldd    r24, Y + 7
    # push two byte expression onto stack
    push   r25
    push   r24

    # Casting int to byte by popping
    # 2 bytes off stack and only pushing low order bits
    # back on.  Low order bits are on top of stack.
    pop    r24
    pop    r25
    push   r24

    # Color expression Meggy.Color.BLUE
    ldi    r22,5
    # push one byte expression onto stack
    push   r22

    ### Meggy.setPixel(x,y,color) call
    # load a one byte expression off stack
    pop    r20
    # load a one byte expression off stack
    pop    r22
    # load a one byte expression off stack
    pop    r24
    call   _Z6DrawPxhhh
    call   _Z12DisplaySlatev

    # IdExp
    # load value for variable j
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 6
    ldd    r24, Y + 5
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 1
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    # push two byte expression onto stack
    push   r25
    push   r24
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # load a two byte expression off stack
    pop    r24
    pop    r25

    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # store rhs into var j
    std    Y + 6, r25
    std    Y + 5, r24

    # jump to while test
    jmp    MJ_L6

    # end of while
MJ_L8:

    # IdExp
    # load value for variable i
    # variable is a local or param variable

    # load a two byte variable from base+offset
    ldd    r25, Y + 8
    ldd    r24, Y + 7
    # push two byte expression onto stack
    push   r25
    push   r24

    # Load constant int 1
    ldi    r24,lo8(1)
    ldi    r25,hi8(1)
    # push two byte expression onto stack
    push   r25
    push   r24
    # load a two byte expression off stack
    pop    r18
    pop    r19
    # load a two byte expression off stack
    pop    r24
    pop    r25

    # Do add operation
    add    r24, r18
    adc    r25, r19
    # push two byte expression onto stack
    push   r25
    push   r24

    ### AssignStatement
    # load rhs exp
    # load a two byte expression off stack
    pop    r24
    pop    r25
    # store rhs into var i
    std    Y + 8, r25
    std    Y + 7, r24

    # jump to while test
    jmp    MJ_L0

    # end of while
MJ_L2:

/* epilogue start for Dots_displayboard */
    # no return value
    # pop space off stack for parameters and locals
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    pop    r30
    # restoring the frame pointer
    pop    r28
    pop    r29
    ret
    .size Dots_displayboard, .-Dots_displayboard

