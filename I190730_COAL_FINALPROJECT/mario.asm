;EXTERNAL FILES USED FOR DISPLAYING OF MENU AND PLAYSCREEN
include menu.lib
include play.lib


.model small
.stack 100h
.data


;---------------Data variables used in the project-------------------
;--------------------------------------------------------------------

pipe1y db 20
pipe1x db 37
pipe1ye db 20
pipe1xe db 41
pipe2y db 22
pipe2x db 18
pipe2ye db 22
pipe2xe db 22
pipe3y db 21
pipe3x db 60
pipe3ye db 21
pipe3xe db 64

bool db 0
bool2 db 0
bool3 db 0

var1 db 20
var2 db 24

enemy1bool db 0
enemy2bool db 0
boolbomb db 0
boolbomb2 db 0
monsterbool db 0
enemy1life db 1
enemy2life db 1
monslife db 1
lostbool db 0
winbool db 0
varend db 79
count db 2

;----------------------------------------------------
;--------------SCREEN DISPLAY MENU-------------------

msg byte "SUPER MARIO","$"
startgame byte '1.START','$'
play byte "2.HOW TO PLAY","$"
LOOSEMsg byte 'OOPS!! TRY AGAIN :(','$'
winMsg byte 'CONGRATULATIONS!! YOU WON','$'

;-----------------------------------------------------
;-----------------------HOW TO PLAY-------------------

msg1 byte 'How to Play?','$'
msg2 byte 'Welcome to Super Mario.To move forward press right arrow key','$'
msg3 byte 'To move backward press left arrow key. To jump press up arrow','$'
msg4 byte 'key. You have to jump over the hurdles and be careful from','$'
msg5 byte 'the enemies. If they hit you you loose some life. Try your','$'
msg6 byte 'best to reach to the castle and defeat the flying monster.','$'
msg7 byte 'Doddge the bullets fired by the monster. Best of Luck. :) ','$'
msg8 byte 'Please enter your name:$'
msg9 byte 30 dup(?)

;-----------------------------------------------------------------------
leveldisp byte 'Level = 1','$'
leveltwo byte 'Level = 2','$'
levelthree byte 'Level = 3','$'
score byte 'Score = ','$'
gamescore db 0
gamescore2 db 2
gamescore3 db 5
siz byte 0
bomby byte 10
bombx1 byte 7
bombx2 byte 9
levelcount db 1

;------------------------FLYING MONSTER VARIABLES----------------------------
;--------------MONSTER FACE--------
monsfacey1 byte 1
monsfacey2 byte 2
monsfacex1 byte 8
monsfacex2 byte 13
;------------MONSTER EYE--------
monseyeY BYTE 1
monseyeX BYTE 11
;-------------MONSTER NECK--------
monsnecky1 byte 3
monsnecky2 byte 4
monsneckx1 byte 8
monsneckx2 byte 10
;------------MONSTER BODY---------
monsbodyy1 BYTE 4
monsbodyy2 byte 5
monsbodyx1 byte 5
monsbodyx2 byte 11
;------------MMONSTERS LEGS-----
monsLegY BYTE 6
monsLegx1 byte 5
monsLegx2 byte 7
monsLeg2x1 byte 9
monsLeg2x2 byte 11
;-----------MONSTERS SCALES------
monsScale1Y byte 0
monsScale2Y byte 0
monsScale3Y byte 1
monsScale4Y byte 3
monsScale1x1 byte 12
monsScale1x2 byte 13
monsScale2x1 byte 8
monsScale2x2 byte 9
monsScale3x1 byte 6
monsScale3x2 byte 7
monsScale4x1 byte 6
monsScale4x2 byte 7
;-----------------Enemy 1---------------------------
enemyleg1x1 byte 22
enemyleg1x2 byte 23

enemyleg1y1 byte 24
enemyleg1y2 byte 25

enemyleg2x1 byte 27
enemyleg2x2 byte 28

enemyleg2y1 byte 24
enemyleg2y2 byte 25

enemybodyx1 byte 23 
enemybodyx2 byte 27

enemybodyY byte 23

enemyeye1x byte 24
enemyeye1y byte 23

enemyeye2x byte 26
enemyeye2y byte 23

;-----------------Enemy 2---------------------------
enemy2leg1x1 byte 41
enemy2leg1x2 byte 42

enemy2leg1y1 byte 24
enemy2leg1y2 byte 25

enemy2leg2x1 byte 46
enemy2leg2x2 byte 47

enemy2leg2y1 byte 24
enemy2leg2y2 byte 25

enemy2bodyx1 byte 42
enemy2bodyx2 byte 46

enemy2bodyY byte 23 

enemy2eye1x byte 43
enemy2eye1y byte 23

enemy2eye2x byte 45
enemy2eye2y byte 23

;;--------------Mario-Drawing-----------------------
;-----------------COORDINATES OF LEG----------------
leg1x1 byte 4
leg1x2 byte 5
leg1y1 byte 24
leg1y2 byte 25

leg2x1 byte 7
leg2x2 byte 8
leg2y1 byte 24
leg2y2 byte 25

;-----------------COORDINATES OF BODY----------------
bdy1x1 byte 4
bdy1x2 byte 8
bdy1y  byte 23

bdy2x1 byte 3
bdy2x2 byte 9
bdy2y byte 22

;-----------------MARIO NECK COORDINATES----------------
nckx1 byte 5
nckx2 byte 7
ncky byte 21

;-----------------MARIO HAIR COORDINATES----------------
hairx1 byte 4
hairx2 byte 8
hairy1 byte 18
hairy2 byte 20

;-----------------MARIO EYES COORDINATES----------------
eye1x byte 5
eye1y byte 19

eye2x byte 7
eye2y byte 19

;-----------------MARIO HANDS COORDINATES----------------
hand1x byte 3
hand1y byte 23

hand2x byte 9
hand2y byte 23

;-----------------MARIO FACE COORDINATES----------------
facex1 byte 5
facex2 byte 8

facey1 byte 19
facey2 byte 20
b1 byte 0

;---------------DATA VARIABLES USED END------------------
;--------------------------------------------------------
;-------------------START OF CODE------------------------
.code
main proc

mov ax,@data
mov ds,ax

;-----------DISPLAYING ENTER NAME MSG------
mov ah,09
mov dx,offset msg8
int 21h

;------------INPUT OF ENTER NAME----------
mov dh,0
mov di,offset msg9
mov bx,0

  input:
     mov ah,01
     int 21h
    cmp al,13
     je ent
     inc siz

mov [di+bx],al
inc bx
jmp input

ent:
inc bx
mov al,'$'
mov [di+bx],al
jmp menu1



;---------STARTING SCREEN MNEU----------

menu1:
mov ax,0
   
   menu msg,start,play   ;MACRO OF MENU CALLED HERE 
   int 21h

mov ah,01
int 21h
sub al,48

   cmp al,1
   je start
   cmp al,2
   je menu2

jmp menu1

menu2:
mov ax,03h
int 10h
player msg1,msg2,msg3,msg4,msg5,msg6,msg7  ;PLAYGAME MACRO BEING CALLED HERE

jmp menu1


;------------END MENU--------------------

;--------------GAME STARTS HERE----------

start:

call Leveler   ; LEVEL CONTROLLER PROC IS BEING CALLED HERE
int 21h

mov ah,01h     ;TAKING INPUT FOR MOVEMENT
int 16h

jz start

mov ah,0H
int 16h


.if ah==0EH     ;IF OEH KEY IS PRESSED THE GAME WILL RESET
call ResetGame  ;RESET PROC BEING CALLED HERE
jmp menu1       
.endif

.if ah==1b      
   jmp exit
.endif

     cmp ah,4Dh     ; RIGHT ARROW KEY CODE  
     je right


     cmp ah,4Bh     ; LEFT ARROW KEY CODE
     je left

     cmp ah,48h     ;UP ARROW KEY CODE
     je up

     cmp ah,0Fh     ;EXIT KEY CODE
     je exit

jmp start
;---------------- END OF INPUT -----------------



;---------------- KEY CONDITIONS --------------

right:

  add var1,1
  mov cl,hand2x
  cmp cl,79
  ja r31

mov cl,pipe1x
cmp cl,hand2x
jne r3
mov cl,21
cmp pipe1y,cl
jbe r1


      r3:
       mov cl,pipe2x
       cmp cl,hand2x
       jne r4
       mov cl,22
       cmp pipe2y,cl
       jbe r1

       r4:
       mov cl,pipe3x
       cmp cl,hand2x
       jne r2
       mov cl,21
       cmp pipe3y,cl
       jbe r1

;-----------RIGHTMOVEMENT VARIABLE INCREMENT--------------

r2:
  add leg1x1,1
  add leg1x2,1
  add leg2x1,1
  add leg2x2,1
  add bdy1x1,1
  add bdy1x2,1
  add bdy2x1,1
  add bdy2x2,1
  add nckx1,1
  add nckx2,1
  add hairx1,1
  add hairx2,1
  add eye1x,1
  add eye2x,1
  add hand1x,1
  add hand2x,1
  add facex1,1
  add facex2,1
  mov al,bool
  cmp al,1
  jne r1
  mov cl,pipe1x
  add cl,2
  mov dl,pipe1xe
  add dl,6

  ;USING IF CONDITION
 .if hand2x<cl||hand2x>dl 

        add leg1y1,6
        add leg1y2,6
        add leg2y1,6
        add leg2y2,6
        add bdy1y,6
        add bdy2y,6
        add ncky,6
        add hairy1,6
        add hairy2,6
        add eye1y,6
        add eye2y,6
        add hand1y,6
        add hand2y,6
        add facey1,6
        add facey2,6
        mov bool,0

.endif

  r1:
    mov al,bool2
    cmp al,1
    jne r21
    mov cl,pipe2x
    add cl,2
    mov dl,pipe2xe
    add dl,6

 .if hand2x<cl||hand2x>dl

    add leg1y1,4
    add leg1y2,4
    add leg2y1,4
    add leg2y2,4
    add bdy1y,4
    add bdy2y,4
    add ncky,4
    add hairy1,4
    add hairy2,4
    add eye1y,4
    add eye2y,4
    add hand1y,4
    add hand2y,4
    add facey1,4
    add facey2,4
    mov bool2,0
.endif


r21:
  mov al,bool3
  cmp al,1
  jne r31
  mov cl,pipe3x
  add cl,2
  mov dl,pipe3xe
  add dl,6


.if hand2x<cl||hand2x>dl

     add leg1y1,5
     add leg1y2,5
     add leg2y1,5
     add leg2y2,5
     add bdy1y,5
     add bdy2y,5
     add ncky,5
     add hairy1,5
     add hairy2,5
     add eye1y,5
     add eye2y,5
     add hand1y,5
     add hand2y,5
     add facey1,5
     add facey2,5
     mov bool3,0
.endif

r31:
jmp start

;---------------------END OF RIGHT KEY INPUT----------------


;---------------------LEFT KEY INPUT------------------------
left:
sub var1,1

;--------------------UP MOVE(Variables)---------------------

  mov cl,hand1x
  cmp cl,3
  jb n2

  mov cl,hand1x
  cmp cl,pipe1xe
  je n

  mov cl,hand1x
  cmp cl,pipe2xe
  je n

  mov cl,hand1x
  cmp cl,pipe3xe
  je n

r22:

  sub leg1x1,1
  sub leg1x2,1
  sub leg2x1,1
  sub leg2x2,1
  sub bdy1x1,1
  sub bdy1x2,1
  sub bdy2x1,1
  sub bdy2x2,1
  sub nckx1,1
  sub nckx2,1
  sub hairx1,1
  sub hairx2,1
  sub eye1x,1
  sub eye2x,1
  sub hand1x,1
  sub hand2x,1
  sub facex1,1
  sub facex2,1

mov al,bool
cmp al,1
jne n

mov cl,pipe1x
mov dl,pipe1xe
add dl,6

.if hand2x<cl||hand2x>dl

    add leg1y1,6
    add leg1y2,6
    add leg2y1,6
    add leg2y2,6
    add bdy1y,6
    add bdy2y,6
    add ncky,6
    add hairy1,6
    add hairy2,6
    add eye1y,6
    add eye2y,6
    add hand1y,6
    add hand2y,6
    add facey1,6
    add facey2,6
    mov bool,0
.endif

n:
  mov al,bool2
  cmp al,1
  jne n1

mov cl,pipe2x
mov dl,pipe2xe
add dl,6

.if hand2x<cl||hand2x>dl

     add leg1y1,4
     add leg1y2,4
     add leg2y1,4
     add leg2y2,4
     add bdy1y,4
     add bdy2y,4
     add ncky,4
     add hairy1,4
     add hairy2,4
     add eye1y,4
     add eye2y,4
     add hand1y,4
     add hand2y,4
     add facey1,4
     add facey2,4
     mov bool2,0
.endif

n1:
 mov al,bool3
 cmp al,1
 jne n2

mov cl,pipe3x
mov dl,pipe3xe
add dl,6

.if hand2x<cl||hand2x>dl

     add leg1y1,5
     add leg1y2,5
     add leg2y1,5
     add leg2y2,5
     add bdy1y,5
     add bdy2y,5
     add ncky,5
     add hairy1,5
     add hairy2,5
     add eye1y,5
     add eye2y,5
     add hand1y,5
     add hand2y,5
     add facey1,5
     add facey2,5
     mov bool3,0
.endif

n2:
jmp start

;-------------------LEFT MOVEMENT END-----------------

;-------------------UP MOVEMENT START-----------------
up:
call beep
    sub var2,10    ;JUMP VARIABLES
    sub leg1y1,8
    sub leg1y2,8
    sub leg2y1,8
    sub leg2y2,8
    sub bdy1y,8
    sub bdy2y,8
    sub ncky,8
    sub hairy1,8
    sub hairy2,8
    sub eye1y,8
    sub eye2y,8
    sub hand1y,8
    sub hand2y,8
    sub facey1,8
    sub facey2,8

mov ah,0
int 16h
 
  cmp ah,4Bh
  je sub1
  cmp ah,4Dh
  jne j1

  ;---------INCREMENTING VARIABLE--------

      add leg1x1,2
      add leg1x2,2
      add leg2x1,2
      add leg2x2,2
      add bdy1x1,2
      add bdy1x2,2	
      add bdy2x1,2
      add bdy2x2,2
      add nckx1,2
      add nckx2,2
      add hairx1,2
      add hairx2,2
      add eye1x,2
      add eye2x,2
      add hand1x,2
      add hand2x,2
      add facex1,2
      add facex2,2
jmp j1

sub1:

   sub leg1x1,2
   sub leg1x2,2
   sub leg2x1,2
   sub leg2x2,2
   sub bdy1x1,2
   sub bdy1x2,2	
   sub bdy2x1,2
   sub bdy2x2,2
   sub nckx1,2
   sub nckx2,2
   sub hairx1,2
   sub hairx2,2
   sub eye1x,2
   sub eye2x,2
   sub hand1x,2
   sub hand2x,2
   sub facex1,2
   sub facex2,2


j1:
;---------------DRAWING AGAIN----------

call Leveler
call delay
call Leveler

;;----------------JUMP DRAW------------

mov cl,pipe1x
mov dl,pipe1xe
add dl,6
mov al,bool
cmp al,1
je m

.if hand2x>cl&&hand2x<dl

      add leg1y1,2
      add leg1y2,2
      add leg2y1,2
      add leg2y2,2
      add bdy1y,2
      add bdy2y,2
      add ncky,2
      add hairy1,2
      add hairy2,2
      add eye1y,2
      add eye2y,2
      add hand1y,2
      add hand2y,2
      add facey1,2
      add facey2,2
      mov bool,1
      jmp j
.endif

m:
mov cl,pipe2x
mov dl,pipe2xe
add dl,6
mov al,bool2
cmp al,1
je m1

.if hand2x>cl&&hand2x<dl

      add leg1y1,4
      add leg1y2,4
      add leg2y1,4
      add leg2y2,4
      add bdy1y,4
      add bdy2y,4
      add ncky,4
      add hairy1,4
      add hairy2,4
      add eye1y,4
      add eye2y,4
      add hand1y,4
      add hand2y,4
      add facey1,4
      add facey2,4
      mov bool2,1
      jmp j
.endif

m1:
mov cl,pipe3x
mov dl,pipe3xe
add dl,6
mov al,bool3
cmp al,1
je m2

.if hand2x>cl&&hand2x<dl

     add leg1y1,3
     add leg1y2,3
     add leg2y1,3
     add leg2y2,3
     add bdy1y,3
     add bdy2y,3
     add ncky,3
     add hairy1,3
     add hairy2,3
     add eye1y,3
     add eye2y,3
     add hand1y,3
     add hand2y,3
     add facey1,3
     add facey2,3
     mov bool3,1
      jmp j
.endif

m2:
mov al,bool
cmp al,1
jne ce
mov cl,pipe1x
mov dl,pipe1xe
add dl,4

.if hand2x<cl||hand2x>dl

     add leg1y1,6
     add leg1y2,6
     add leg2y1,6
     add leg2y2,6
     add bdy1y,6
     add bdy2y,6
     add ncky,6
     add hairy1,6
     add hairy2,6
     add eye1y,6
     add eye2y,6
     add hand1y,6
     add hand2y,6
     add facey1,6
     add facey2,6
     mov bool,0
.endif


ce:
mov al,bool2
cmp al,1
jne ce1
mov cl,pipe2x
mov dl,pipe2xe
add dl,4


.if hand2x<cl||hand2x>dl

      add leg1y1,4
      add leg1y2,4
      add leg2y1,4
      add leg2y2,4
      add bdy1y,4
      add bdy2y,4
      add ncky,4
      add hairy1,4
      add hairy2,4
      add eye1y,4
      add eye2y,4
      add hand1y,4
      add hand2y,4
      add facey1,4
      add facey2,4
      mov bool2,0
.endif
ce1:
mov al,bool3
cmp al,1
jne ce3
mov cl,pipe3x
mov dl,pipe3xe
add dl,4


.if hand2x<cl||hand2x>dl

       add leg1y1,5
       add leg1y2,5
       add leg2y1,5
       add leg2y2,5
       add bdy1y,5
       add bdy2y,5
       add ncky,5
       add hairy1,5
       add hairy2,5
       add eye1y,5
       add eye2y,5
       add hand1y,5
       add hand2y,5
       add facey1,5
       add facey2,5
       mov bool3,0
.endif

ce3:

  add leg1y1,8
  add leg1y2,8
  add leg2y1,8
  add leg2y2,8
  add bdy1y,8
  add bdy2y,8
  add ncky,8
  add hairy1,8
  add hairy2,8
  add eye1y,8
  add eye2y,8
  add hand1y,8
  add hand2y,8
  add facey1,8
  add facey2,8

j:
jmp start
;-------------------------END OF DARW-----------------------
;--------------------END OF UP KEY INPUT--------------------



down:
add var2,1
jmp start

;;------------------------JUMPING RIGHT----------------------

;INCREMENTING VARIABLES
right_jmp:

   add leg1x1,5
   add leg1x2,5
   add leg2x1,5
   add leg2x2,5
   add bdy1x1,5
   add bdy1x2,5
   add bdy2x1,5
   add bdy2x2,5
   add nckx1,5
   add nckx2,5
   add hairx1,5
   add hairx2,5
   add eye1x,5
   add eye2x,5
   add hand1x,5
   add hand2x,5
   add facex1,5
   add facex2,5
jmp start

;;--------------END OF RIGHT JUMP------------

;----------------KEYENDS-----------------

exit:
mov ah, 4ch
int 21h
main endp
;--------------------END OF MAIN PROC----------------

;--------------------DELAY PROC START---------------
delay proc
push ax
push bx
push cx
push dx

mov cx,45
mydelay:
mov bx,2000      
mydelay1:
dec bx
jnz mydelay1
loop mydelay

pop dx
pop cx
pop bx
pop ax

ret
delay endp
;--------------------DELAY PROC END---------------

;--------------CHARACTER PROC START---------------
DrawCharacter proc

;DRAWING BACKGROUND

mov ah,06
mov al,0
mov ch,0
mov cl,0
mov dh,25
mov dl,80
mov bh,00110000b
int 10h

;DISPLAYING NAME STRING AT THE TOP
mov ah,02
mov bh,0
mov bl,05
mov dh,0
mov dl,34
int 10h

mov al,05
mov si,offset msg9
mov cx,0
mov cl,siz

loop4:
    
	mov dl,[si]
	mov ah,02
	int 21h
	inc si
    
loop loop4


;GRASS
mov ah,06
mov al,0
mov ch,23
mov cl,0
mov dh,25
mov dl,80
mov bh,00100010b
int 10h

mov ah,06
mov al,0
mov ch,19
mov cl,27
mov dh,22
mov dl,29
mov bh,01100000b
int 10h


mov ah,06
mov al,0
mov ch,14
mov cl,23
mov dh,18
mov dl,33
mov bh,00100010b
int 10h

;TREE TWO
mov ah,06
mov al,0
mov ch,19
mov cl,48
mov dh,22
mov dl,50
mov bh,01100010b
int 10h

mov ah,06
mov al,0
mov ch,14
mov cl,44
mov dh,18
mov dl,54
mov bh,00100010b
int 10h

;APPLE
mov ah,06
mov al,0
mov ch,15
mov cl,24
mov dh,15
mov dl,25
mov bh,01000010b
int 10h

mov ah,06
mov al,0
mov ch,17
mov cl,31
mov dh,17
mov dl,32
mov bh,01000010b
int 10h

mov ah,06
mov al,0
mov ch,17
mov cl,45
mov dh,17
mov dl,46
mov bh,01000010b
int 10h

mov ah,06
mov al,0
mov ch,15
mov cl,52
mov dh,15
mov dl,53
mov bh,01000010b
int 10h
;-----------------Pipe One--------
mov ah,06
mov al,0
mov ch,22
mov cl,18
mov dh,22
mov dl,22
mov bh,01000010b
int 10h

mov ah,06
mov al,0
mov ch,23
mov cl,19
mov dh,24
mov dl,21
mov bh,01000010b
int 10h

;-----------------Pipe Two--------

mov ah,06
mov al,0
mov ch,20
mov cl,37
mov dh,20
mov dl,41
mov bh,01000010b
int 10h

mov ah,06
mov al,0
mov ch,21
mov cl,38
mov dh,25
mov dl,40
mov bh,01000010b
int 10h

;-----------------Pipe Three--------

mov ah,06
mov al,0
mov ch,21
mov cl,60
mov dh,21
mov dl,64
mov bh,01000010b
int 10h

mov ah,06
mov al,0
mov ch,22
mov cl,61
mov dh,25
mov dl,63
mov bh,01000010b
int 10h


;-------------------------Cloud-----------------------------
mov ah,06
mov al,0
mov ch,7
mov cl,7
mov dh,9
mov dl,11
mov bh,01110010b
int 10h

mov ah,06
mov al,0
mov ch,5
mov cl,12
mov dh,9
mov dl,16
mov bh,01110010b
int 10h

mov ah,06
mov al,0
mov ch,7
mov cl,17
mov dh,9
mov dl,21
mov bh,01110010b
int 10h

;CLOUD2
mov ah,06
mov al,0
mov ch,4
mov cl,30
mov dh,6
mov dl,35
mov bh,01110010b
int 10h

mov ah,06
mov al,0
mov ch,2
mov cl,36
mov dh,6
mov dl,42
mov bh,01110010b
int 10h

mov ah,06
mov al,0
mov ch,4
mov cl,43
mov dh,6
mov dl,48
mov bh,01110000b
int 10h

.if levelcount==1
mov ah,02
mov bh,0
mov bl,05
mov dh,0
mov dl,65
int 10h

mov ah,09
mov al,05
mov dx,offset leveldisp
int 21h

;score
mov ah,02
mov bh,0
mov bl,05
mov dh,0
mov dl,5
int 10h

mov ah,09
mov al,05
mov dx,offset score
int 21h

mov dl,gamescore
add dl,48
mov ah,02
int 21h

.endif

.if levelcount==2
mov ah,02
mov bh,0
mov bl,05
mov dh,0
mov dl,65
int 10h

mov ah,09
mov al,05
mov dx,offset leveltwo
int 21h

;score
mov ah,02
mov bh,0
mov bl,05
mov dh,0
mov dl,5
int 10h

mov ah,09
mov al,05
mov dx,offset score
int 21h

mov dl,gamescore2
add dl,48
mov ah,02
int 21h
.endif

.if levelcount==3
mov ah,02
mov bh,0
mov bl,05
mov dh,0
mov dl,65
int 10h

mov ah,09
mov al,05
mov dx,offset levelthree
int 21h

;score
mov ah,02
mov bh,0
mov bl,05
mov dh,0
mov dl,5
int 10h

mov ah,09
mov al,05
mov dx,offset score
int 21h

mov dl,gamescore3
add dl,48
mov ah,02
int 21h
.endif


;------------------------Mario character--------------------

;MARIO LEG1
mov ah,06
mov al,0
mov ch,leg1y1
mov cl,leg1x1
mov dh,leg1y2
mov dl,leg1x2
mov bh,00010010b
int 10h

;MARIO LEG2
mov ah,06
mov al,0
mov ch,leg2y1
mov cl,leg2x1
mov dh,leg2y2
mov dl,leg2x2
mov bh,00010010b
int 10h

;MARIO BODY
mov ah,06
mov al,0
mov ch,bdy1y
mov cl,bdy1x1
mov dh,bdy1y
mov dl,bdy1x2	
mov bh,00010010b
int 10h

mov ah,06
mov al,0
mov ch,bdy2y
mov cl,bdy2x1
mov dh,bdy2y
mov dl,bdy2x2
mov bh,01000010b
int 10h

;MARIO NECK
mov ah,06
mov al,0
mov ch,ncky
mov cl,nckx1
mov dh,ncky
mov dl,nckx2
mov bh,01100010b
int 10h

;MARIO HAIR
mov ah,06
mov al,0
mov ch,hairy1
mov cl,hairx1
mov dh,hairy2
mov dl,hairx2
mov bh,01000010b
int 10h

;MARIO FACE
mov ah,06
mov al,0
mov ch,facey1
mov cl,facex1
mov dh,facey2
mov dl,facex2
mov bh,01100010b
int 10h

;MARIO EYES
mov ah,06
mov al,0
mov ch,eye1y
mov cl,eye1x
mov dh,eye1y
mov dl,eye1x
mov bh,01000010b
int 10h

;MARIO EYE2
mov ah,06
mov al,0
mov ch,eye2y
mov cl,eye2x
mov dh,eye2y
mov dl,eye2x
mov bh,00000010b
int 10h

;MARIO HANDS
mov ah,06
mov al,0
mov ch,hand1y
mov cl,hand1x
mov dh,hand1y
mov dl,hand1x
mov bh,01110010b
int 10h

mov ah,06
mov al,0
mov ch,hand2y
mov cl,hand2x
mov dh,hand2y
mov dl,hand2x
mov bh,01110010b
int 10h
;;---Hayiqadraw Ends




ret 
DrawCharacter endp
;--------------------CHARACTER PROC START---------------


;-------------------ENEMY1 DRAW PROC START---------------

DrawEnemies1 Proc

;ENEMY LEGS
mov ah,06
mov al,0
mov ch,enemyleg1y1
mov cl,enemyleg1x1
mov dh,enemyleg1y2
mov dl,enemyleg1x2
mov bh,00000010b
int 10h

mov ah,06
mov al,0
mov ch,enemyleg2y1
mov cl,enemyleg2x1
mov dh,enemyleg2y2
mov dl,enemyleg2x2
mov bh,00000010b
int 10h

;ENEMY BODY
mov ah,06
mov al,0
mov ch,enemybodyY
mov cl,enemybodyx1
mov dh,enemybodyY
mov dl,enemybodyx2
mov bh,01010010b
int 10h

;ENEMY EYES
mov ah,06
mov al,0
mov ch,enemyeye1y
mov cl,enemyeye1x
mov dh,enemyeye1y
mov dl,enemyeye1x
mov bh,00000010b
int 10h

mov ah,06
mov al,0
mov ch,enemyeye2y
mov cl,enemyeye2x
mov dh,enemyeye2y
mov dl,enemyeye2x
mov bh,00000010b
int 10h

ret
DrawEnemies1 endp
;-------------------ENEMY1 DRAW PROC END------------------
;---------------------------------------------------------
;-------------------ENEMY2 DRAW PROC START----------------

DrawEnemies2 Proc

;ENEMY2 LEGS
mov ah,06
mov al,0
mov ch,enemy2leg1y1
mov cl,enemy2leg1x1
mov dh,enemy2leg1y2
mov dl,enemy2leg1x2
mov bh,00000010b
int 10h

mov ah,06
mov al,0
mov ch,enemy2leg2y1
mov cl,enemy2leg2x1
mov dh,enemy2leg2y2
mov dl,enemy2leg2x2
mov bh,00000010b
int 10h

;ENEMY2 BODY
mov ah,06
mov al,0
mov ch,enemy2bodyY
mov cl,enemy2bodyx1
mov dh,enemy2bodyY
mov dl,enemy2bodyx2
mov bh,01010010b
int 10h

;ENEMY2 EYES
mov ah,06
mov al,0
mov ch,enemy2eye1y
mov cl,enemy2eye1x
mov dh,enemy2eye1y
mov dl,enemy2eye1x
mov bh,00000010b
int 10h

mov ah,06
mov al,0
mov ch,enemy2eye2y
mov cl,enemy2eye2x
mov dh,enemy2eye2y
mov dl,enemy2eye2x
mov bh,00000010b
int 10h

ret
DrawEnemies2 endp
;-------------------ENEMY2 DRAW PROC END------------------
;---------------------------------------------------------
 ;-------------------FLYING MONSTER DRAW------------------

DrawMonster proc
 
.if monslife==1

;MONS FACE
mov ah,06
mov al,0
mov ch,monsfacey1
mov cl,monsfacex1
mov dh,monsfacey2
mov dl,monsfacex2
mov bh,01100010b
int 10h

;MONS EYE
mov ah,06
mov al,0
mov ch,monseyeY
mov cl,monseyeX
mov dh,monseyeY
mov dl,monseyeX
mov bh,00000010b
int 10h

;MONS NECK
mov ah,06
mov al,0
mov ch,monsnecky1
mov cl,monsneckx1
mov dh,monsnecky2
mov dl,monsneckx2
mov bh,01100010b
int 10h

;BODY
mov ah,06
mov al,0
mov ch,monsbodyy1
mov cl,monsbodyx1
mov dh,monsbodyy2
mov dl,monsbodyx2
mov bh,00100010b
int 10h

;LEG1
mov ah,06
mov al,0
mov ch,monsLegY
mov cl,monsLegx1
mov dh,monsLegY
mov dl,monsLegx2
mov bh,01100010b
int 10h

;LEG2
mov ah,06
mov al,0
mov ch,monsLegY
mov cl,monsLeg2x1
mov dh,monsLegY
mov dl,monsLeg2x2
mov bh,01100010b
int 10h

;MONS SCALES
mov ah,06
mov al,0
mov ch,monsScale1Y
mov cl,monsScale1x1
mov dh,monsScale1Y
mov dl,monsScale1x2
mov bh,00010010b
int 10h

;MONS SCALES
mov ah,06
mov al,0
mov ch,monsScale2Y
mov cl,monsScale2x1
mov dh,monsScale2Y
mov dl,monsScale2x2
mov bh,00010010b
int 10h

;MONS SCALES
mov ah,06
mov al,0
mov ch,monsScale3Y
mov cl,monsScale3x1
mov dh,monsScale3Y
mov dl,monsScale3x2
mov bh,00010010b
int 10h

mov ah,06
mov al,0
mov ch,monsScale4Y
mov cl,monsScale4x1
mov dh,monsScale4Y
mov dl,monsScale4x2
mov bh,00010010b
int 10h

.endif
ret 
Drawmonster endp
 ;---------------FLYING MONSTER DRAW END-------------------
 ;---------------------------------------------------------
;-------------------ENEMY1 MOVEMENT START------------------

Enemy1mov proc

    .if enemyleg1x2==32
        mov enemy1bool,1
    .endif

    .if enemyleg1x2==23
        mov enemy1bool,0
    .endif


.if enemy1bool==0 && enemy1life==1

       call Drawenemies1
       add enemyleg1x1,1
       add enemyleg1x2,1
       add enemyleg2x1,1
       add enemyleg2x2,1
       add enemybodyx1,1 
       add enemybodyx2,1
       add enemyeye1x,1
       add enemyeye2x,1
.endif

.if enemy1bool==1 && enemy1life==1

       call Drawenemies1
       sub enemyleg1x1,1
       sub enemyleg1x2,1
       sub enemyleg2x1,1
       sub enemyleg2x2,1
       sub enemybodyx1,1 
       sub enemybodyx2,1
       sub enemyeye1x,1
       sub enemyeye2x,1
.endif
ret 
Enemy1mov endp
;-------------------ENEMY1 MOVEMENT END--------------------
;----------------------------------------------------------
;-------------------ENEMY2 MOVEMENT START------------------

Enemy2mov proc

    .if enemy2leg1x2==55
        mov enemy2bool,1
    .endif

    .if enemy2leg1x2==42
        mov enemy2bool,0
    .endif


.if enemy2bool==0 && enemy2life==1

     call Drawenemies2
     add enemy2leg1x1,1
     add enemy2leg1x2,1
     add enemy2leg2x1,1
     add enemy2leg2x2,1
     add enemy2bodyx1,1 
     add enemy2bodyx2,1
     add enemy2eye1x,1
     add enemy2eye2x,1
.endif

.if enemy2bool==1 && enemy2life==1

     call Drawenemies2
     sub enemy2leg1x1,1
     sub enemy2leg1x2,1
     sub enemy2leg2x1,1
     sub enemy2leg2x2,1
     sub enemy2bodyx1,1 
     sub enemy2bodyx2,1
     sub enemy2eye1x,1
     sub enemy2eye2x,1
.endif
ret 
Enemy2mov endp
;-------------------ENEMY2 MOVEMENT END------------------
;--------------------------------------------------------
;;---------------MONSTER MOVEMENT PROC-------------------

monstermov proc

    .if monsfacex1==60
        mov monsterbool,1
    .endif

    .if monsfacex1==5
        mov monsterbool,0
    .endif

.if monsterbool==0

      add monsfacex1,1   
      add monsfacex2,1   
      add monseyeX,1   ;MONSTER EYE
      add monsneckx1,1  ;MONSTER NECK
      add monsneckx2,1   
      add monsbodyx1,1  ;MONSTER BODY
      add monsbodyx2,1
      add monsLegx1,1  ;MONSTERS LEGS
      add monsLegx2,1   
      add monsLeg2x1,1
      add monsLeg2x2,1

;-----------MONSTERS SCALES
     add monsScale1x1 ,1
     add monsScale1x2 ,1
     add monsScale2x1 ,1
     add monsScale2x2 ,1
     add monsScale3x1,1 
     add monsScale3x2,1 
     add monsScale4x1,1 
     add monsScale4x2,1 
.endif


.if monsterbool==1


    sub monsfacex1,1   
    sub monsfacex2,1   
    sub monseyeX,1   
    sub monsneckx1 ,1  
    sub monsneckx2,1   
    sub monsbodyx1   ,1
    sub monsbodyx2   ,1
    sub monsLegx1  ,1 
    sub monsLegx2,1   
    sub monsLeg2x1   ,1
    sub monsLeg2x2   ,1
    sub monsScale1x1 ,1
    sub monsScale1x2 ,1
    sub monsScale2x1 ,1
    sub monsScale2x2 ,1
    sub monsScale3x1,1 
    sub monsScale3x2,1 
    sub monsScale4x1,1 
    sub monsScale4x2,1 
.endif
ret
monstermov endp
;;---------------MONSTER MOVEMENT END-------------------
;;------------------------------------------------------
;;---------------BOMB DRAW START------------------------
BombDraw Proc

.if monslife==1
  .if(monsneckx1==50)
      mov boolbomb,1
  .endif

.if(boolbomb==1)
   inc bomby

mov ah,06
mov al,0
mov ch,bomby
mov cl,monsneckx1
mov dh,bomby
mov dl,monsneckx2
mov bh,00000010b
int 10h


.if(bomby==25)
    mov boolbomb,1
    mov bomby,10
.endif
.endif
.endif

ret 
BombDraw endp
;;-------------------BOMB DRAW END------------------------
;;--------------------------------------------------------
;;---------------ENEMY DEATH PROC START-------------------
EnemiesDeath Proc

mov dl,enemybodyx1
mov dh,enemybodyY
mov cl,enemybodyx2

;DEATH OF ENEMY 1 ON COLLISION
        .if (bdy1y==dh) && (bdy1x1==dl|| bdy1x2==cl||bdy2x1==dl||bdy2x2==dl||bdy1x1==cl||bdy1x2==dl||bdy2x1==cl||bdy2x2==cl)
              mov enemy1life,0
        .endif

;DEATH OF ENEMY 2 ON COLLISION
mov dl,enemy2bodyx1
mov dh,enemy2bodyY
mov cl,enemy2bodyx2

         .if (bdy1y==dh) && (bdy1x1==dl|| bdy1x2==cl||bdy2x1==dl||bdy2x2==dl||bdy1x1==cl||bdy1x2==dl||bdy2x1==cl||bdy2x2==cl)
             mov enemy2life,0
         .endif

;;DEATH OF MONSTER 1 ON COLLISION

mov dl,monsLeg2x2
mov dh,monsLegY
mov cl,monsLeg2x1
mov ch,monsLegx1

           .if (hairy1==dh|| hairy2==dh) && (hairx1==dl|| hairx2==cl||hairx1==dl||hairx2==dl||hairx1==cl||hairx2==dl||hairx1==cl||hairx2==cl)
               mov monslife,0
           .endif

ret
EnemiesDeath endp
;;---------------ENEMY DEATH PROC END-------------------
;;------------------------------------------------------
;;-----------------LOOSE SCREEN DARW PROC---------------

LooseScreen Proc

mov ah,06
mov al,0
mov ch,0
mov cl,0
mov dh,18
mov dl,80
mov bh,00110000b
int 10h

mov ah,02
mov bh,0
mov bl,05
mov dh,12
mov dl,30
int 10h

mov ah,09
mov dx,offset LOOSEMsg
int 21h


.if levelcount==1   ;DISPLAY OF LEVEL AND SCORE
mov ah,02
mov bh,0
mov bl,05
mov dh,7
mov dl,50
int 10h

mov ah,09
mov al,05
mov dx,offset leveldisp
int 21h

;score
mov ah,02
mov bh,0
mov bl,05
mov dh,7
mov dl,12
int 10h

mov ah,09
mov al,05
mov dx,offset score
int 21h

mov dl,gamescore
add dl,48
mov ah,02
int 21h

.endif

.if levelcount==2  ;DISPLAY OF LEVEL 2 AND SCORE
mov ah,02
mov bh,0
mov bl,05
mov dh,7
mov dl,50
int 10h

mov ah,09
mov al,05
mov dx,offset leveltwo
int 21h

;score
mov ah,02
mov bh,0
mov bl,05
mov dh,7
mov dl,12
int 10h

mov ah,09
mov al,05
mov dx,offset score
int 21h

mov dl,gamescore2
add dl,48
mov ah,02
int 21h
.endif

.if levelcount==3   ;DISPLAY OF LEVEL3 AND SCORE
mov ah,02
mov bh,0
mov bl,05
mov dh,7
mov dl,50
int 10h

mov ah,09
mov al,05
mov dx,offset levelthree
int 21h

;score
mov ah,02
mov bh,0
mov bl,05
mov dh,7
mov dl,12
int 10h

mov ah,09
mov al,05
mov dx,offset score
int 21h

mov dl,gamescore3
add dl,48
mov ah,02
int 21h
.endif

;GRASS
mov ah,06
mov al,0
mov ch,19
mov cl,0
mov dh,25
mov dl,80
mov bh,00100010b
int 10h

;RED BOX
mov ah,06
mov al,0
mov ch,0
mov cl,0
mov dh,4
mov dl,7
mov bh,01000010b
int 10h

;blue box
mov ah,06
mov al,0
mov ch,5
mov cl,0
mov dh,8
mov dl,7
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,9
mov cl,0
mov dh,12
mov dl,7
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,13
mov cl,0
mov dh,16
mov dl,7
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,17
mov cl,0
mov dh,20
mov dl,7
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,21
mov cl,0
mov dh,24
mov dl,7
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,21
mov cl,8
mov dh,24
mov dl,18
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,21
mov cl,18
mov dh,24
mov dl,28
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,21
mov cl,29
mov dh,24
mov dl,39
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,21
mov cl,40
mov dh,24
mov dl,50
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,21
mov cl,51
mov dh,24
mov dl,61
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,21
mov cl,62
mov dh,24
mov dl,72
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,21
mov cl,72
mov dh,24
mov dl,80
mov bh,01000010b
int 10h

;blue box
mov ah,06
mov al,0
mov ch,17
mov cl,72
mov dh,20
mov dl,80
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,13
mov cl,72
mov dh,16
mov dl,80
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,9
mov cl,72
mov dh,12
mov dl,80
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,5
mov cl,72
mov dh,8
mov dl,80
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,0
mov cl,72
mov dh,4
mov dl,80
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,0
mov cl,62
mov dh,4
mov dl,71
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,0
mov cl,51
mov dh,4
mov dl,61
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,0
mov cl,40
mov dh,4
mov dl,50
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,0
mov cl,29
mov dh,4
mov dl,39
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,0
mov cl,19
mov dh,4
mov dl,28
mov bh,01000010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,0
mov cl,28
mov dh,4
mov dl,19
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,0
mov cl,8
mov dh,4
mov dl,18
mov bh,00010010b
int 10h

ret
LooseScreen endp
;;-----------------LOOSE SCREEN DARW END---------------
;;-----------------------------------------------------
;;-----------------MARIO DEATH PROC--------------------

Death Proc

   .if lostbool==1
       call LooseScreen
   .endif

mov cl,monsneckx1
mov dh,bomby
mov dl,monsneckx2


.if (bdy1y==dh||facey2==dh||facey1==dh) && (bdy1x1==dl|| bdy1x2==cl||bdy2x1==dl||bdy2x2==dl||bdy1x1==cl||bdy1x2==dl||bdy2x1==cl||bdy2x2==cl||facex1==dl||facex2==dl||facex1==cl||facex2==cl)

mov lostbool,1
.endif

ret
Death endp
;;-----------------MARIO DEATH PROC END------------------
;;-------------------------------------------------------
;;-----------------RESET GAME PROC-----------------------

ResetGame Proc

;;----------------PIPE VARIABLES RESET----------
mov pipe1y,20
mov pipe1x , 37
mov pipe1ye , 20
mov pipe1xe , 41
mov pipe2y , 22
mov pipe2x , 18
mov pipe2ye , 22
mov pipe2xe , 22
mov pipe3y , 21
mov pipe3x , 60
mov pipe3ye , 21
mov pipe3xe , 64
mov bool , 0
mov bool2 , 0
mov bool3 , 0

mov var1 , 20
mov var2 , 24

;;--------------ENEMY, MONSTER AND BOMB RESET------------
mov enemy1bool , 0
mov enemy2bool , 0
mov boolbomb , 0
mov boolbomb2 , 0

mov monsterbool , 0

mov enemy1life , 1
mov enemy2life , 1
mov lostbool , 0
mov winbool ,0
mov varend , 79

;;-------BOMB VARIABLES RESET-------

mov bomby , 10
mov bombx1 , 7
mov bombx2 , 9
; -----------------------FLYING MONSTER VARIABLES RESET---------------------- 

; --------------MONSTER FACE------
mov monsfacey1 , 1
mov monsfacey2 , 2

mov monsfacex1 , 8
mov monsfacex2 , 13
; ------------MONSTER EYE-------

mov monseyeY, 1
mov monseyeX, 11

; ------------ - MONSTER NECK------

mov monsnecky1 , 3
mov monsnecky2 , 4

mov monsneckx1 , 8
mov monsneckx2 , 10

; ------------MONSTER BODY--------

mov monsbodyy1 , 4
mov monsbodyy2 , 5

mov monsbodyx1 , 5
mov monsbodyx2 , 11

; ------------MMONSTERS LEGS--------

mov monsLegY , 6
mov monsLegx1 , 5
mov monsLegx2 , 7

mov monsLeg2x1 , 9
mov monsLeg2x2 , 11

; ------------MONSTERS SCALES--------

mov monsScale1Y , 0
mov monsScale2Y , 0
mov monsScale3Y , 1
mov monsScale4Y , 3

mov monsScale1x1 , 12
mov monsScale1x2 , 13

mov monsScale2x1 , 8
mov monsScale2x2 , 9

mov monsScale3x1 , 6
mov monsScale3x2 , 7

mov monsScale4x1 , 6
mov monsScale4x2 , 7

; ----------------Enemy 1 RESET-------------------------- -

mov enemyleg1x1 , 22
mov enemyleg1x2 , 23

mov enemyleg1y1 , 24
mov enemyleg1y2 , 25

mov enemyleg2x1 , 27
mov enemyleg2x2 , 28

mov enemyleg2y1 , 24
mov enemyleg2y2 , 25

mov enemybodyx1 , 23
mov enemybodyx2 , 27

mov enemybodyY , 23

mov enemyeye1x , 24
mov enemyeye1y , 23

mov enemyeye2x , 26
mov enemyeye2y , 23

; ---------------- - Enemy 2 RESET-------------------------- -

mov enemy2leg1x1 , 41
mov enemy2leg1x2 , 42

mov enemy2leg1y1 , 24
mov enemy2leg1y2 , 25

mov enemy2leg2x1 , 46
mov enemy2leg2x2 , 47

mov enemy2leg2y1 , 24
mov enemy2leg2y2 , 25

mov enemy2bodyx1 , 42
mov enemy2bodyx2 , 46

mov enemy2bodyY , 23

mov enemy2eye1x , 43
mov enemy2eye1y , 23

mov enemy2eye2x , 45
mov enemy2eye2y , 23

;;-------------------MARIO CHARACETER RESET------------------
; ---------------- - COORDINATES OF LEG----------------
mov leg1x1 , 4
mov leg1x2 , 5
mov leg1y1 , 24
mov leg1y2 , 25

mov leg2x1 , 7
mov leg2x2 , 8
mov leg2y1 , 24
mov leg2y2 , 25

; ---------------- - COORDINATES OF BODY----------------
mov bdy1x1 , 4
mov bdy1x2 , 8
mov bdy1y  , 23

mov bdy2x1 , 3
mov bdy2x2 , 9
mov bdy2y , 22

; ---------------- - MARIO NECK COORDINATES----------------
mov nckx1 , 5
mov nckx2 , 7
mov ncky , 21

; ---------------- - MARIO HAIR COORDINATES----------------
mov hairx1, 4
mov hairx2, 8
mov hairy1, 18
mov hairy2, 20

; ---------------- - MARIO EYES COORDINATES----------------
mov eye1x, 5
mov eye1y , 19

mov eye2x , 7
mov eye2y , 19

; ---------------- - MARIO HANDS COORDINATES----------------
mov hand1x , 3
mov hand1y , 23

mov hand2x , 9
mov hand2y , 23

; ---------------- - MARIO FACE COORDINATES----------------
mov facex1 , 5
mov facex2 , 8

mov facey1 , 19
mov facey2 , 20

ret
ResetGame endp
;;-----------------RESET GAME PROC END-----------------------
;;-----------------------------------------------------------
;;--------------------WIN GAME SCREEN------------------------
WinGame Proc
mov ah,06
mov al,0
mov ch,0
mov cl,0
mov dh,18
mov dl,80
mov bh,00110000b
int 10h

mov ah,02
mov bh,0
mov bl,05
mov dh,6
mov dl,28
int 10h

mov ah,09
mov dx,offset winMsg
int 21h

.if levelcount==1   ;LEVEL AND SCORE DISPLAY 
mov ah,02
mov bh,0
mov bl,05
mov dh,7
mov dl,60
int 10h

mov ah,09
mov al,05
mov dx,offset leveldisp
int 21h

;score
mov ah,02
mov bh,0
mov bl,05
mov dh,7
mov dl,12
int 10h

mov ah,09
mov al,05
mov dx,offset score
int 21h

mov dl,gamescore
add dl,48
mov ah,02
int 21h

.endif

.if levelcount==2 ;LEVEL AND SCORE DISPLAY 
mov ah,02
mov bh,0
mov bl,05
mov dh,7
mov dl,60
int 10h

mov ah,09
mov al,05
mov dx,offset leveltwo
int 21h

;score
mov ah,02
mov bh,0
mov bl,05
mov dh,7
mov dl,12
int 10h

mov ah,09
mov al,05
mov dx,offset score
int 21h

mov dl,gamescore2
add dl,48
mov ah,02
int 21h
.endif

.if levelcount==3  ;LEVEL AND SCORE DISPLAY 
mov ah,02
mov bh,0
mov bl,05
mov dh,7
mov dl,60
int 10h

mov ah,09
mov al,05
mov dx,offset levelthree
int 21h

;score
mov ah,02
mov bh,0
mov bl,05
mov dh,7
mov dl,12
int 10h

mov ah,09
mov al,05
mov dx,offset score
int 21h

mov dl,gamescore3
add dl,48
mov ah,02
int 21h
.endif

;GRASS
mov ah,06
mov al,0
mov ch,19
mov cl,0
mov dh,25
mov dl,80
mov bh,00100010b
int 10h


;RED BOX
mov ah,06
mov al,0
mov ch,0
mov cl,0
mov dh,4
mov dl,7
mov bh,01000010b
int 10h

;blue box
mov ah,06
mov al,0
mov ch,5
mov cl,0
mov dh,8
mov dl,7
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,9
mov cl,0
mov dh,12
mov dl,7
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,13
mov cl,0
mov dh,16
mov dl,7
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,17
mov cl,0
mov dh,20
mov dl,7
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,21
mov cl,0
mov dh,24
mov dl,7
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,21
mov cl,8
mov dh,24
mov dl,18
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,21
mov cl,18
mov dh,24
mov dl,28
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,21
mov cl,29
mov dh,24
mov dl,39
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,21
mov cl,40
mov dh,24
mov dl,50
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,21
mov cl,51
mov dh,24
mov dl,61
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,21
mov cl,62
mov dh,24
mov dl,72
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,21
mov cl,72
mov dh,24
mov dl,80
mov bh,01000010b
int 10h

;blue box
mov ah,06
mov al,0
mov ch,17
mov cl,72
mov dh,20
mov dl,80
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,13
mov cl,72
mov dh,16
mov dl,80
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,9
mov cl,72
mov dh,12
mov dl,80
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,5
mov cl,72
mov dh,8
mov dl,80
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,0
mov cl,72
mov dh,4
mov dl,80
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,0
mov cl,62
mov dh,4
mov dl,71
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,0
mov cl,51
mov dh,4
mov dl,61
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,0
mov cl,40
mov dh,4
mov dl,50
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,0
mov cl,29
mov dh,4
mov dl,39
mov bh,00010010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,0
mov cl,19
mov dh,4
mov dl,28
mov bh,01000010b
int 10h

;redbox
mov ah,06
mov al,0
mov ch,0
mov cl,28
mov dh,4
mov dl,19
mov bh,01000010b
int 10h

;bluebox
mov ah,06
mov al,0
mov ch,0
mov cl,8
mov dh,4
mov dl,18
mov bh,00010010b
int 10h

;------------------------CASTLE DRAW---------------------
mov ah,06
mov al,0
mov ch,15
mov cl,25
mov dh,18
mov dl,30
mov bh,01100010b
int 10h

mov ah,06
mov al,0
mov ch,14
mov cl,25
mov dh,15
mov dl,26
mov bh,01100010b
int 10h

mov ah,06
mov al,0
mov ch,14
mov cl,29
mov dh,15
mov dl,30
mov bh,01100010b
int 10h

mov ah,06
mov al,0
mov ch,16
mov cl,30
mov dh,18
mov dl,31
mov bh,01100010b
int 10h

;castle mid
mov ah,06
mov al,0
mov ch,11
mov cl,32
mov dh,18
mov dl,48
mov bh,01100010b
int 10h

mov ah,06
mov al,0
mov ch,16
mov cl,49
mov dh,18
mov dl,49
mov bh,01100010b
int 10h

mov ah,06
mov al,0
mov ch,14
mov cl,50
mov dh,15
mov dl,51
mov bh,01100010b
int 10h

mov ah,06
mov al,0
mov ch,15
mov cl,50
mov dh,18
mov dl,55
mov bh,01100010b
int 10h

mov ah,06
mov al,0
mov ch,14
mov cl,54
mov dh,15
mov dl,55
mov bh,01100010b
int 10h

;upper part of castle

mov ah,06
mov al,0
mov ch,10
mov cl,32
mov dh,11
mov dl,33
mov bh,01100010b
int 10h

mov ah,06
mov al,0
mov ch,10
mov cl,35
mov dh,11
mov dl,36
mov bh,01100010b
int 10h

mov ah,06
mov al,0
mov ch,10
mov cl,38
mov dh,11
mov dl,39
mov bh,01100010b
int 10h

mov ah,06
mov al,0
mov ch,10
mov cl,41
mov dh,11
mov dl,42
mov bh,01100010b
int 10h

mov ah,06
mov al,0
mov ch,10
mov cl,44
mov dh,11
mov dl,45
mov bh,01100010b
int 10h

mov ah,06
mov al,0
mov ch,10
mov cl,47
mov dh,11
mov dl,48
mov bh,01100010b
int 10h

;WINDOW
mov ah,06
mov al,0
mov ch,13
mov cl,35
mov dh,14
mov dl,37
mov bh,01000100b
int 10h

mov ah,06
mov al,0
mov ch,13
mov cl,43
mov dh,14
mov dl,45
mov bh,01000100b
int 10h

;DOOR
mov ah,06
mov al,0
mov ch,16
mov cl,38
mov dh,18
mov dl,42
mov bh,00000100b
int 10h

;window1
mov ah,06
mov al,0
mov ch,16
mov cl,27
mov dh,17
mov dl,28
mov bh,01000100b
int 10h

;window2
mov ah,06
mov al,0
mov ch,16
mov cl,52
mov dh,17
mov dl,53
mov bh,01000100b
int 10h

;flag
mov ah,06
mov al,0
mov ch,8
mov cl,40
mov dh,10
mov dl,40
mov bh,01110010b
int 10h

mov ah,06
mov al,0
mov ch,8
mov cl,38
mov dh,8
mov dl,39
mov bh,01000010b
int 10h

ret
WinGame endp
;;--------------------WIN GAME SCREEN END -----------------------
;;---------------------------------------------------------------
;;---------------------CASTLE DRAW PROC--------------------------

CastleDraw proc

;CASTLE
mov ah,06
mov al,0
mov ch,20
mov cl,69
mov dh,25
mov dl,78
mov bh,01100010b
int 10h

;CASTLE UPPER PART
mov ah,06
mov al,0
mov ch,19
mov cl,69
mov dh,19
mov dl,70
mov bh,01100010b
int 10h

mov ah,06
mov al,0
mov ch,19
mov cl,77
mov dh,19
mov dl,78
mov bh,01100010b
int 10h

mov ah,06
mov al,0
mov ch,19
mov cl,72
mov dh,19
mov dl,75
mov bh,01100010b
int 10h

mov ah,06
mov al,0
mov ch,23
mov cl,72
mov dh,25
mov dl,75
mov bh,00000010b
int 10h

mov ah,06
mov al,0
mov ch,21
mov cl,71
mov dh,21
mov dl,72
mov bh,00000010b
int 10h

mov ah,06
mov al,0
mov ch,21
mov cl,75
mov dh,21
mov dl,76
mov bh,00000010b
int 10h

mov ah,06
mov al,0
mov ch,17
mov cl,74
mov dh,18
mov dl,74
mov bh,01110010b
int 10h

mov ah,06
mov al,0
mov ch,17
mov cl,72
mov dh,17
mov dl,73
mov bh,00010010b
int 10h

ret

CastleDraw endp
;;---------------------CASTLE DRAW PROC END------------------------
;;-----------------------------------------------------------------
;;-----------------------FLAG DRAW PROC----------------------------

FlagDraw proc

;Flag dandi
mov ah,06
mov al,0
mov ch,3
mov cl,78
mov dh,25
mov dl,78
mov bh,01100010b
int 10h

;Flag box
mov ah,06
mov al,0
mov ch,3
mov cl,60
mov dh,7
mov dl,76
mov bh,00010010b
int 10h

;Flag Moon
mov ah,06
mov al,0
mov ch,4
mov cl,68
mov dh,4
mov dl,71
mov bh,01110010b
int 10h

;Flag Moon
mov ah,06
mov al,0
mov ch,6
mov cl,68
mov dh,6
mov dl,71
mov bh,01110010b
int 10h

;Flag Moon
mov ah,06
mov al,0
mov ch,5
mov cl,70
mov dh,5
mov dl,71
mov bh,01110000b
int 10h

;Flag star
mov ah,06
mov al,0
mov ch,5
mov cl,63
mov dh,5
mov dl,66
mov bh,01110000b
int 10h

;Flag star
mov ah,06
mov al,0
mov ch,4
mov cl,64
mov dh,6
mov dl,65
mov bh,01110000b
int 10h

ret 
FlagDraw endp
;;-------------------FLAG DRAW PROC END-------------------
;;--------------------------------------------------------
;;-------------------LEVEL PROC START---------------------

Leveler proc

     .if levelcount==1     ;START OF LEVEL 1
      call DrawCharacter
      call FlagDraw
       .if bdy1x1==75
           mov winbool,1
       .endif

       .if winbool==1
           call ResetGame
           inc levelcount
       .endif
    .endif

.if levelcount==2  ;START OF LEVEL 2

    call DrawCharacter
    call Enemy1mov
    call Enemy2mov
    call FlagDraw
    call Death
    call EnemiesDeath

    .if bdy1x1==75
        mov winbool,1
    .endif
   
     .if winbool==1
         call ResetGame
         inc levelcount
     .endif
.endif


.if levelcount==3  ;START OF LEVEL 3

    call DrawCharacter
    call Enemy1mov
    call Enemy2mov
    call DrawMonster
    call monstermov
    call BombDraw
    call CastleDraw
    call Death
    call EnemiesDeath

     .if bdy1x1>74 && bdy1x1<80
         mov winbool,1
         call WinGame
     .endif
.endif

call delay
ret 
Leveler endp

;;-------------------LEVEL PROC END---------------------
;;------------------------------------------------------
BEEP  PROC

        MOV al,182        
        OUT 43h,al         
        MOV ax,4600        
        OUT 42h,al        
        MOV al,ah          
        IN  al,61h        
        OR  al,00000011b   ; Set bits 1 and 0.
        OUT 61h,al         
        MOV bx,25         

        DELAY1:
        mov cx,300

        DELAY2:
        DEC cx
        JNE DELAY2
        DEC bx
        JNE DELAY1
        IN  al, 61h         
                                
        AND al, 11111100b  
        OUT 61h, al         
RET
BEEP ENDP
;;-----------------END OF CODE--------------------------
end main