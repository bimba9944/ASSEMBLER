; ---- Data segment
dseg segment 'DATA'
    WINDOW_WIDTH DW 140h   ; sirina prozora (321 px)
    WINDOW_HEIGHT DW 0C8h  ;visina prozora (200 px)
    WINDOW_BOUNDS DW 0     ; promenljiva pomocu koje mozemo izvrsiti ranu detekciju sudara
    
    TIME_AUX DB 0 ; vremenska promenljiva 
    BALL_X DW 04h ; X pozicija (kolona) lopte
    BALL_Y DW 0B4h ; Y pozicija (linija) lopte 
    BALL_SIZE DW 04h ; velicina lopte (koliko piksela u sirinu i u visinu)
    BALL_VELOCITY_X DW 06h ; x (horizontalna) komponenta brzine
    BALL_VELOCITY_Y DW -04h ; Y (vertikalna) komponenta brzine
    
    BLOK_SIRINA DW 4Bh ; sirina bloka je 75px
    BLOK_VISINA DW 0Fh ; visina bloka je 15px
    
    BLOK1_X DW 03h ; x koordinata prvog bloka-3px
    BLOK2_X DW 53h ; x koordinata drugog bloka-83px
    BLOK3_X DW 0A3h ; x koordinata treceg bloka-163px
    BLOK4_X DW 0F3h ; x koordinata cetvrtog bloka-243px
    
    BLOK1_Y DW 05h ; y koordinata prvog reda-5px
    BLOK2_Y DW 19h ; y koordinata drugog reda-25px
    BLOK3_Y DW 2Dh ; y koordinata treceg reda-45px
    
    BLOK1_LEVA DW 03h ; koordinate bloka 1
    BLOK1_DESNA DW 4Eh
    BLOK1_GORNJA DW 05h
    BLOK1_DONJA DW 14h
    
    BLOK2_LEVA DW 53h ; koordinate bloka 2
    BLOK2_DESNA DW 9Eh
    BLOK2_GORNJA DW 05h
    BLOK2_DONJA DW 14h
    
    BLOK3_LEVA DW 0A3h ; koordinate bloka 3
    BLOK3_DESNA DW 0EEh
    BLOK3_GORNJA DW 05h
    BLOK3_DONJA DW 14h
    
    BLOK4_LEVA DW 0F3h ;koordinate bloka 4
    BLOK4_DESNA DW 13Eh
    BLOK4_GORNJA DW 05h
    BLOK4_DONJA DW 14h
    
    BLOK5_LEVA DW 03h ; koordinate bloka 5
    BLOK5_DESNA DW 4Eh
    BLOK5_GORNJA DW 19h
    BLOK5_DONJA DW 28h
    
    BLOK6_LEVA DW 53h ; koordinate bloka 6
    BLOK6_DESNA DW 9Eh
    BLOK6_GORNJA DW 19h
    BLOK6_DONJA DW 28h
    
    BLOK7_LEVA DW 0A3h ; koordinate bloka 7
    BLOK7_DESNA DW 0EEh
    BLOK7_GORNJA DW 19h
    BLOK7_DONJA DW 28h
    
    BLOK8_LEVA DW 0F3h ; koordinate bloka 8
    BLOK8_DESNA DW 13Eh
    BLOK8_GORNJA DW 19h
    BLOK8_DONJA DW 28h
    
    BLOK9_LEVA DW 03h ; koordinate bloka 9
    BLOK9_DESNA DW 4Eh
    BLOK9_GORNJA DW 2Dh
    BLOK9_DONJA DW 3Ch
    
    BLOK10_LEVA DW 53h ; koordinate bloka 10
    BLOK10_DESNA DW 9Eh
    BLOK10_GORNJA DW 2Dh
    BLOK10_DONJA DW 3Ch
    
    BLOK11_LEVA DW 0A3h ; koordinate bloka 11
    BLOK11_DESNA DW 0EEh
    BLOK11_GORNJA DW 2Dh
    BLOK11_DONJA DW 3Ch
    
    BLOK12_LEVA DW 0F3h ; koordinate bloka 12
    BLOK12_DESNA DW 13Eh
    BLOK12_GORNJA DW 2Dh
    BLOK12_DONJA DW 3Ch
    
    KONSTANTA1 DW 1h
	KONSTANTA2 DW 1h
	KONSTANTA3 DW 1h
	KONSTANTA4 DW 1h
	KONSTANTA5 DW 1h
	KONSTANTA6 DW 1h
	KONSTANTA7 DW 1h
	KONSTANTA8 DW 1h
	KONSTANTA9 DW 1h
	KONSTANTA10 DW 1h
	KONSTANTA11 DW 1h
	KONSTANTA12 DW 1h
    KONSTANTA DW 0h  ; sluzi za poredjenje
    
    PLATFORMA_SIRINA DW 50h ; sirina platmorme-80px
    PLATFORMA_VISINA DW 0Ah ; visina platforme-10px 
    PLATFORMA_X DW 78h ; x koordinata platforme (levo i desno po 120 px) 
    PLATFORMA_Y DW 0B9h ; y koordinata platforme (odvojena 5px od donje ivice)
	PLATFORMA_BRZINA DW 0Ch
    
    
dseg ends
; ---- kraj segmenta


; ---- Code segment

cseg    segment 'CODE'
        assume cs:cseg, ds:dseg, ss:sseg
draw:       
    mov ax, dseg
    mov ds, ax
        
    CHECK_TIME:
    
        mov ah,2Ch ; prekid kojim se dobija sistemsko vreme
        int 21h    ; CH = sati, CL = minuti, DH = sekunde, DL = stotinke
        
        cmp dl,TIME_AUX  ; da li je trenutno vreme jednako prethodnom (TIME_AUX)?
        je CHECK_TIME    ; ako je isto, proveri ponovo; inace ucrtaj loptu, pomeri je....
        
        mov TIME_AUX,dl ; azuriraj vreme
        
        call CLEAR_SCREEN ; obrisi sadrzaj ekrana
        
        call PROVERA_SUDARA1 ;
        call ISCRTAVANJE1 ;
        call PROVERA_SUDARA2
        call ISCRTAVANJE2
        call PROVERA_SUDARA3
        call ISCRTAVANJE3
        call PROVERA_SUDARA4
        call ISCRTAVANJE4
        call PROVERA_SUDARA5
        call ISCRTAVANJE5
        call PROVERA_SUDARA6
        call ISCRTAVANJE6
        call PROVERA_SUDARA7
		call ISCRTAVANJE7
		call PROVERA_SUDARA8
		call ISCRTAVANJE8
        call PROVERA_SUDARA9
		call ISCRTAVANJE9
		call PROVERA_SUDARA10
		call ISCRTAVANJE10
		call PROVERA_SUDARA11
		call ISCRTAVANJE11
		call PROVERA_SUDARA12
		call ISCRTAVANJE12
		
        call PLATFORMA_CRTANJE
		call PLATFORMA_KRETANJE
		call PLATFORMA_ODBIJANJE
        
        call MOVE_BALL ; pomeri loptu
        call DRAW_BALL  ; ucrtaj  je
        

        
        
        jmp CHECK_TIME ; proveri vreme ponovo
    jmp kraj
    
    
    MOVE_BALL PROC NEAR
        
        mov ax,BALL_VELOCITY_X    
        add BALL_X,ax             ; pomeri lopticu horizontalno
        
        mov ax,WINDOW_BOUNDS
        cmp BALL_X,ax                         
        jl NEG_VELOCITY_X         ; BALL_X < 0 + WINDOW_BOUNDS (sudar - leva ivica)
        
        mov ax,WINDOW_WIDTH
        sub ax,BALL_SIZE
        sub ax,WINDOW_BOUNDS
        cmp BALL_X,ax             ;BALL_X > WINDOW_WIDTH - BALL_SIZE  - WINDOW_BOUNDS (sudar - desna ivica)
        jg NEG_VELOCITY_X
        
        
        mov ax,BALL_VELOCITY_Y
        add BALL_Y,ax             ; pomeri lopticu vertikalno
        
        mov ax,WINDOW_BOUNDS
        cmp BALL_Y,ax           ;BALL_Y < 0 + WINDOW_BOUNDS (sudar - gornja ivica)
        jl NEG_VELOCITY_Y                          
        
        mov ax,WINDOW_HEIGHT    
        sub ax,BALL_SIZE
        sub ax,WINDOW_BOUNDS
        cmp BALL_Y,ax
        jng NISTA1        ;BALL_Y > WINDOW_HEIGHT - BALL_SIZE - WINDOW_BOUNDS (sudar - donja ivica)
        jmp PORAZ
		NISTA1:
        ret
        
        NEG_VELOCITY_X:
            neg BALL_VELOCITY_X   ;BALL_VELOCITY_X = - BALL_VELOCITY_X
            ret
            
        NEG_VELOCITY_Y:
            neg BALL_VELOCITY_Y   ;BALL_VELOCITY_Y = - BALL_VELOCITY_Y
            ret
        
    MOVE_BALL ENDP
    
    DRAW_BALL PROC NEAR
        
        mov cx,BALL_X ; postavi inicijalnu kolonu (X)
        mov dx,BALL_Y ; postavi inicijalni red (Y)
        
        DRAW_BALL_HORIZONTAL:
            mov ah,0Ch ; podesi konfiguraciju za ispis piksela
            mov al,0fh ; izaberi belu boju
            mov bh,00h ; 
            int 10h    ; izvrsi konfiguraciju
            
            inc cx     ;cx = cx + 1
            mov ax,cx  
            sub ax,BALL_X ;cx - BALL_X > BALL_SIZE (ako jeste, iscrtali smo za taj red sve kolone; inace nastavljamo dalje)
            cmp ax,BALL_SIZE
            jng DRAW_BALL_HORIZONTAL
            
            mov cx,BALL_X ; vrati cx na inicijalnu kolonu
            inc dx        ; idemo u sledeci red
            
            mov ax,dx    ; dx - BALL_Y > BALL_SIZE (ako jeste, iscrtali smo sve redove piksela; inace nastavljamo dalje)
            sub ax,BALL_Y
            cmp ax,BALL_SIZE
            jng DRAW_BALL_HORIZONTAL
        
        ret
    DRAW_BALL ENDP
    
    BLOK1_CRTANJE PROC NEAR ; crtanje prvog bloka u prvom redu blokova
        
        mov cx,BLOK1_X
        mov dx,BLOK1_Y
        
        DRAW_BLOK1_HORIZONTAL:
            mov ah,0Ch 
            mov al,04h
            mov bh,00h
            int 10h
            
            inc cx
            mov ax,cx
            sub ax,BLOK1_X
            cmp ax,BLOK_SIRINA
            jng DRAW_BLOK1_HORIZONTAL
            
            mov cx,BLOK1_X
            inc dx
            
            mov ax,dx
            sub ax,BLOK1_Y
            cmp ax,BLOK_VISINA
            jng DRAW_BLOK1_HORIZONTAL
            
        ret 
    BLOK1_CRTANJE ENDP


    BLOK2_CRTANJE PROC NEAR ; crtanje drugog bloka u prvom redu blokova
        
        mov cx,BLOK2_X
        mov dx,BLOK1_Y
        
        DRAW_BLOK2_HORIZONTAL:
            mov ah,0Ch 
            mov al,04h
            mov bh,00h
            int 10h
            
            inc cx
            mov ax,cx
            sub ax,BLOK2_X
            cmp ax,BLOK_SIRINA
            jng DRAW_BLOK2_HORIZONTAL
            
            mov cx,BLOK2_X
            inc dx
            
            mov ax,dx
            sub ax,BLOK1_Y
            cmp ax,BLOK_VISINA
            jng DRAW_BLOK2_HORIZONTAL
            
        ret 
    BLOK2_CRTANJE ENDP
    
    BLOK3_CRTANJE PROC NEAR ; crtanje treceg bloka u prvom redu blokova
        
        mov cx,BLOK3_X
        mov dx,BLOK1_Y
        
        DRAW_BLOK3_HORIZONTAL:
            mov ah,0Ch 
            mov al,04h
            mov bh,00h
            int 10h
            
            inc cx
            mov ax,cx
            sub ax,BLOK3_X
            cmp ax,BLOK_SIRINA
            jng DRAW_BLOK3_HORIZONTAL
            
            mov cx,BLOK3_X
            inc dx
            
            mov ax,dx
            sub ax,BLOK1_Y
            cmp ax,BLOK_VISINA
            jng DRAW_BLOK3_HORIZONTAL
            
        ret 
    BLOK3_CRTANJE ENDP
    
    BLOK4_CRTANJE PROC NEAR ; crtanje cetvrtog bloka u prvom redu blokova
        
        mov cx,BLOK4_X
        mov dx,BLOK1_Y
        
        DRAW_BLOK4_HORIZONTAL:
            mov ah,0Ch 
            mov al,04h
            mov bh,00h
            int 10h
            
            inc cx
            mov ax,cx
            sub ax,BLOK4_X
            cmp ax,BLOK_SIRINA
            jng DRAW_BLOK4_HORIZONTAL
            
            mov cx,BLOK4_X
            inc dx
            
            mov ax,dx
            sub ax,BLOK1_Y
            cmp ax,BLOK_VISINA
            jng DRAW_BLOK4_HORIZONTAL
            
        ret 
    BLOK4_CRTANJE ENDP
    
    BLOK5_CRTANJE PROC NEAR ; crtanje prvog bloka u drugom redu blokova
        
        mov cx,BLOK1_X
        mov dx,BLOK2_Y
        
        DRAW_BLOK5_HORIZONTAL:
            mov ah,0Ch 
            mov al,0Eh
            mov bh,00h
            int 10h
            
            inc cx
            mov ax,cx
            sub ax,BLOK1_X
            cmp ax,BLOK_SIRINA
            jng DRAW_BLOK5_HORIZONTAL
            
            mov cx,BLOK1_X
            inc dx
            
            mov ax,dx
            sub ax,BLOK2_Y
            cmp ax,BLOK_VISINA
            jng DRAW_BLOK5_HORIZONTAL
            
        ret 
    BLOK5_CRTANJE ENDP
    
    BLOK6_CRTANJE PROC NEAR ; crtanje drugog bloka u drugom redu blokova
        
        mov cx,BLOK2_X
        mov dx,BLOK2_Y
        
        DRAW_BLOK6_HORIZONTAL:
            mov ah,0Ch 
            mov al,0Eh
            mov bh,00h
            int 10h
            
            inc cx
            mov ax,cx
            sub ax,BLOK2_X
            cmp ax,BLOK_SIRINA
            jng DRAW_BLOK6_HORIZONTAL
            
            mov cx,BLOK2_X
            inc dx
            
            mov ax,dx
            sub ax,BLOK2_Y
            cmp ax,BLOK_VISINA
            jng DRAW_BLOK6_HORIZONTAL
            
        ret 
    BLOK6_CRTANJE ENDP
    
    BLOK7_CRTANJE PROC NEAR ; crtanje treceg bloka u drugom redu blokova
        
        mov cx,BLOK3_X
        mov dx,BLOK2_Y
        
        DRAW_BLOK7_HORIZONTAL:
            mov ah,0Ch 
            mov al,0Eh
            mov bh,00h
            int 10h
            
            inc cx
            mov ax,cx
            sub ax,BLOK3_X
            cmp ax,BLOK_SIRINA
            jng DRAW_BLOK7_HORIZONTAL
            
            mov cx,BLOK3_X
            inc dx
            
            mov ax,dx
            sub ax,BLOK2_Y
            cmp ax,BLOK_VISINA
            jng DRAW_BLOK7_HORIZONTAL
            
        ret 
    BLOK7_CRTANJE ENDP
    
    BLOK8_CRTANJE PROC NEAR ; crtanje cetvrtog bloka u drugom redu blokova
        
        mov cx,BLOK4_X
        mov dx,BLOK2_Y
        
        DRAW_BLOK8_HORIZONTAL:
            mov ah,0Ch 
            mov al,0Eh
            mov bh,00h
            int 10h
            
            inc cx
            mov ax,cx
            sub ax,BLOK4_X
            cmp ax,BLOK_SIRINA
            jng DRAW_BLOK8_HORIZONTAL
            
            mov cx,BLOK4_X
            inc dx
            
            mov ax,dx
            sub ax,BLOK2_Y
            cmp ax,BLOK_VISINA
            jng DRAW_BLOK8_HORIZONTAL
            
        ret 
    BLOK8_CRTANJE ENDP
    
    BLOK9_CRTANJE PROC NEAR ; crtanje prvog bloka u trecem redu blokova
        
        mov cx,BLOK1_X
        mov dx,BLOK3_Y
        
        DRAW_BLOK9_HORIZONTAL:
            mov ah,0Ch 
            mov al,02h
            mov bh,00h
            int 10h
            
            inc cx
            mov ax,cx
            sub ax,BLOK1_X
            cmp ax,BLOK_SIRINA
            jng DRAW_BLOK9_HORIZONTAL
            
            mov cx,BLOK1_X
            inc dx
            
            mov ax,dx
            sub ax,BLOK3_Y
            cmp ax,BLOK_VISINA
            jng DRAW_BLOK9_HORIZONTAL
            
        ret 
    BLOK9_CRTANJE ENDP
    
    BLOK10_CRTANJE PROC NEAR ; crtanje drugog bloka u trecem redu blokova
        
        mov cx,BLOK2_X
        mov dx,BLOK3_Y
        
        DRAW_BLOK10_HORIZONTAL:
            mov ah,0Ch 
            mov al,02h
            mov bh,00h
            int 10h
            
            inc cx
            mov ax,cx
            sub ax,BLOK2_X
            cmp ax,BLOK_SIRINA
            jng DRAW_BLOK10_HORIZONTAL
            
            mov cx,BLOK2_X
            inc dx
            
            mov ax,dx
            sub ax,BLOK3_Y
            cmp ax,BLOK_VISINA
            jng DRAW_BLOK10_HORIZONTAL
            
        ret 
    BLOK10_CRTANJE ENDP
    
    BLOK11_CRTANJE PROC NEAR ; crtanje treceg bloka u trecem redu blokova
        
        mov cx,BLOK3_X
        mov dx,BLOK3_Y
        
        DRAW_BLOK11_HORIZONTAL:
            mov ah,0Ch 
            mov al,02h
            mov bh,00h
            int 10h
            
            inc cx
            mov ax,cx
            sub ax,BLOK3_X
            cmp ax,BLOK_SIRINA
            jng DRAW_BLOK11_HORIZONTAL
            
            mov cx,BLOK3_X
            inc dx
            
            mov ax,dx
            sub ax,BLOK3_Y
            cmp ax,BLOK_VISINA
            jng DRAW_BLOK11_HORIZONTAL
            
        ret 
    BLOK11_CRTANJE ENDP
    
    BLOK12_CRTANJE PROC NEAR ; crtanje cetvrtog bloka u trecem redu blokova
        
        mov cx,BLOK4_X
        mov dx,BLOK3_Y
        
        DRAW_BLOK12_HORIZONTAL:
            mov ah,0Ch 
            mov al,02h
            mov bh,00h
            int 10h
            
            inc cx
            mov ax,cx
            sub ax,BLOK4_X
            cmp ax,BLOK_SIRINA
            jng DRAW_BLOK12_HORIZONTAL
            
            mov cx,BLOK4_X
            inc dx
            
            mov ax,dx
            sub ax,BLOK3_Y
            cmp ax,BLOK_VISINA
            jng DRAW_BLOK12_HORIZONTAL
            
        ret 
    BLOK12_CRTANJE ENDP
    
    
    PROVERA_SUDARA1 PROC NEAR
        DONJA1:
             mov ax,BLOK1_DONJA
             add ax,BALL_SIZE
             cmp BALL_Y,ax
             jl GORNJA1 
             ret
        GORNJA1:
             mov ax,BLOK1_GORNJA
             sub ax,BALL_SIZE
             cmp BALL_Y,ax
             jg DESNA1 
             ret            
        DESNA1:
             mov ax,BLOK1_DESNA
             add ax,BALL_SIZE
             cmp BALL_X,ax
             jl LEVA1
             ret
        LEVA1:
             mov ax,BLOK1_LEVA
             sub ax,BALL_SIZE
             cmp BALL_X,ax
             jg BROJAC1
             ret
        BROJAC1:
            mov cx,KONSTANTA1
            xor cx,cx
            mov KONSTANTA1,cx
            ret
    PROVERA_SUDARA1 ENDP
    
    ISCRTAVANJE1 PROC NEAR
        PROVERA1:
        mov cx,KONSTANTA1
        cmp cx,KONSTANTA
        je SKOK1
        call BLOK1_CRTANJE
        ret
        SKOK1:
        ret
    ISCRTAVANJE1 ENDP
	
	PROVERA_SUDARA2 PROC NEAR
        DONJA2:
             mov ax,BLOK2_DONJA
             add ax,BALL_SIZE
             cmp BALL_Y,ax
             jl GORNJA2 
             ret
        GORNJA2:
             mov ax,BLOK2_GORNJA
             sub ax,BALL_SIZE
             cmp BALL_Y,ax
             jg DESNA2 
             ret            
        DESNA2:
             mov ax,BLOK2_DESNA
             add ax,BALL_SIZE
             cmp BALL_X,ax
             jl LEVA2
             ret
        LEVA2:
             mov ax,BLOK2_LEVA
             sub ax,BALL_SIZE
             cmp BALL_X,ax
             jg BROJAC2
             ret
        BROJAC2:
            mov cx,KONSTANTA2
            xor cx,cx
            mov KONSTANTA2,cx
            ret
    PROVERA_SUDARA2 ENDP
    
    ISCRTAVANJE2 PROC NEAR
        PROVERA2:
        mov cx,KONSTANTA2
        cmp cx,KONSTANTA
        je SKOK2
        call BLOK2_CRTANJE
        ret
        SKOK2:
        ret
    ISCRTAVANJE2 ENDP
	
	PROVERA_SUDARA3 PROC NEAR
        DONJA3:
             mov ax,BLOK3_DONJA
             add ax,BALL_SIZE
             cmp BALL_Y,ax
             jl GORNJA3 
             ret
        GORNJA3:
             mov ax,BLOK3_GORNJA
             sub ax,BALL_SIZE
             cmp BALL_Y,ax
             jg DESNA3 
             ret            
        DESNA3:
             mov ax,BLOK3_DESNA
             add ax,BALL_SIZE
             cmp BALL_X,ax
             jl LEVA3
             ret
        LEVA3:
             mov ax,BLOK3_LEVA
             sub ax,BALL_SIZE
             cmp BALL_X,ax
             jg BROJAC3
             ret
        BROJAC3:
            mov cx,KONSTANTA3
            xor cx,cx
            mov KONSTANTA3,cx
            ret
    PROVERA_SUDARA3 ENDP
    
    ISCRTAVANJE3 PROC NEAR
        PROVERA3:
        mov cx,KONSTANTA3
        cmp cx,KONSTANTA
        je SKOK3
        call BLOK3_CRTANJE
        ret
        SKOK3:
        ret
    ISCRTAVANJE3 ENDP
	
	PROVERA_SUDARA4 PROC NEAR
        DONJA4:
             mov ax,BLOK4_DONJA
             add ax,BALL_SIZE
             cmp BALL_Y,ax
             jl GORNJA4 
             ret
        GORNJA4:
             mov ax,BLOK4_GORNJA
             sub ax,BALL_SIZE
             cmp BALL_Y,ax
             jg DESNA4 
             ret            
        DESNA4:
             mov ax,BLOK4_DESNA
             add ax,BALL_SIZE
             cmp BALL_X,ax
             jl LEVA4
             ret
        LEVA4:
             mov ax,BLOK4_LEVA
             sub ax,BALL_SIZE
             cmp BALL_X,ax
             jg BROJAC4
             ret
        BROJAC4:
            mov cx,KONSTANTA4
            xor cx,cx
            mov KONSTANTA4,cx
            ret
    PROVERA_SUDARA4 ENDP
    
    ISCRTAVANJE4 PROC NEAR
        PROVERA4:
        mov cx,KONSTANTA4
        cmp cx,KONSTANTA
        je SKOK4
        call BLOK4_CRTANJE
        ret
        SKOK4:
        ret
    ISCRTAVANJE4 ENDP
	
	PROVERA_SUDARA5 PROC NEAR
        DONJA5:
             mov ax,BLOK5_DONJA
             add ax,BALL_SIZE
             cmp BALL_Y,ax
             jl GORNJA5 
             ret
        GORNJA5:
             mov ax,BLOK5_GORNJA
             sub ax,BALL_SIZE
             cmp BALL_Y,ax
             jg DESNA5 
             ret            
        DESNA5:
             mov ax,BLOK5_DESNA
             add ax,BALL_SIZE
             cmp BALL_X,ax
             jl LEVA5
             ret
        LEVA5:
             mov ax,BLOK5_LEVA
             sub ax,BALL_SIZE
             cmp BALL_X,ax
             jg BROJAC5
             ret
        BROJAC5:
            mov cx,KONSTANTA5
            xor cx,cx
            mov KONSTANTA5,cx
            ret
    PROVERA_SUDARA5 ENDP
    
    ISCRTAVANJE5 PROC NEAR
        PROVERA5:
        mov cx,KONSTANTA5
        cmp cx,KONSTANTA
        je SKOK5
        call BLOK5_CRTANJE
        ret
        SKOK5:
        ret
    ISCRTAVANJE5 ENDP
	
	PROVERA_SUDARA6 PROC NEAR
        DONJA6:
             mov ax,BLOK6_DONJA
             add ax,BALL_SIZE
             cmp BALL_Y,ax
             jl GORNJA6 
             ret
        GORNJA6:
             mov ax,BLOK6_GORNJA
             sub ax,BALL_SIZE
             cmp BALL_Y,ax
             jg DESNA6 
             ret            
        DESNA6:
             mov ax,BLOK6_DESNA
             add ax,BALL_SIZE
             cmp BALL_X,ax
             jl LEVA6
             ret
        LEVA6:
             mov ax,BLOK6_LEVA
             sub ax,BALL_SIZE
             cmp BALL_X,ax
             jg BROJAC6
             ret
        BROJAC6:
            mov cx,KONSTANTA6
            xor cx,cx
            mov KONSTANTA6,cx
            ret
    PROVERA_SUDARA6 ENDP
    
    ISCRTAVANJE6 PROC NEAR
        PROVERA6:
        mov cx,KONSTANTA6
        cmp cx,KONSTANTA
        je SKOK6
        call BLOK6_CRTANJE
        ret
        SKOK6:
        ret
    ISCRTAVANJE6 ENDP
	
	PROVERA_SUDARA7 PROC NEAR
        DONJA7:
             mov ax,BLOK7_DONJA
             add ax,BALL_SIZE
             cmp BALL_Y,ax
             jl GORNJA7 
             ret
        GORNJA7:
             mov ax,BLOK7_GORNJA
             sub ax,BALL_SIZE
             cmp BALL_Y,ax
             jg DESNA7 
             ret            
        DESNA7:
             mov ax,BLOK7_DESNA
             add ax,BALL_SIZE
             cmp BALL_X,ax
             jl LEVA7
             ret
        LEVA7:
             mov ax,BLOK7_LEVA
             sub ax,BALL_SIZE
             cmp BALL_X,ax
             jg BROJAC7
             ret
        BROJAC7:
            mov cx,KONSTANTA7
            xor cx,cx
            mov KONSTANTA7,cx
            ret
    PROVERA_SUDARA7 ENDP
    
    ISCRTAVANJE7 PROC NEAR
        PROVERA7:
        mov cx,KONSTANTA7
        cmp cx,KONSTANTA
        je SKOK7
        call BLOK7_CRTANJE
        ret
        SKOK7:
        ret
    ISCRTAVANJE7 ENDP
	
	PROVERA_SUDARA8 PROC NEAR
        DONJA8:
             mov ax,BLOK8_DONJA
             add ax,BALL_SIZE
             cmp BALL_Y,ax
             jl GORNJA8 
             ret
        GORNJA8:
             mov ax,BLOK8_GORNJA
             sub ax,BALL_SIZE
             cmp BALL_Y,ax
             jg DESNA8 
             ret            
        DESNA8:
             mov ax,BLOK8_DESNA
             add ax,BALL_SIZE
             cmp BALL_X,ax
             jl LEVA8
             ret
        LEVA8:
             mov ax,BLOK8_LEVA
             sub ax,BALL_SIZE
             cmp BALL_X,ax
             jg BROJAC8
             ret
        BROJAC8:
            mov cx,KONSTANTA8
            xor cx,cx
            mov KONSTANTA8,cx
            ret
    PROVERA_SUDARA8 ENDP
    
    ISCRTAVANJE8 PROC NEAR
        PROVERA8:
        mov cx,KONSTANTA8
        cmp cx,KONSTANTA
        je SKOK8
        call BLOK8_CRTANJE
        ret
        SKOK8:
        ret
    ISCRTAVANJE8 ENDP
    
	PROVERA_SUDARA9 PROC NEAR
        DONJA9:
             mov ax,BLOK9_DONJA
             add ax,BALL_SIZE
             cmp BALL_Y,ax
             jl GORNJA9 
             ret
        GORNJA9:
             mov ax,BLOK9_GORNJA
             sub ax,BALL_SIZE
             cmp BALL_Y,ax
             jg DESNA9 
             ret            
        DESNA9:
             mov ax,BLOK9_DESNA
             add ax,BALL_SIZE
             cmp BALL_X,ax
             jl LEVA9
             ret
        LEVA9:
             mov ax,BLOK9_LEVA
             sub ax,BALL_SIZE
             cmp BALL_X,ax
             jg BROJAC9
             ret
        BROJAC9:
            mov cx,KONSTANTA9
            xor cx,cx
            mov KONSTANTA9,cx
            ret
    PROVERA_SUDARA9 ENDP
    
    ISCRTAVANJE9 PROC NEAR
        PROVERA9:
        mov cx,KONSTANTA9
        cmp cx,KONSTANTA
        je SKOK9
        call BLOK9_CRTANJE
        ret
        SKOK9:
        ret
    ISCRTAVANJE9 ENDP
	
	PROVERA_SUDARA10 PROC NEAR
        DONJA10:
             mov ax,BLOK10_DONJA
             add ax,BALL_SIZE
             cmp BALL_Y,ax
             jl GORNJA10 
             ret
        GORNJA10:
             mov ax,BLOK10_GORNJA
             sub ax,BALL_SIZE
             cmp BALL_Y,ax
             jg DESNA10 
             ret            
        DESNA10:
             mov ax,BLOK10_DESNA
             add ax,BALL_SIZE
             cmp BALL_X,ax
             jl LEVA10
             ret
        LEVA10:
             mov ax,BLOK10_LEVA
             sub ax,BALL_SIZE
             cmp BALL_X,ax
             jg BROJAC10
             ret
        BROJAC10:
            mov cx,KONSTANTA10
            xor cx,cx
            mov KONSTANTA10,cx
            ret
    PROVERA_SUDARA10 ENDP
    
    ISCRTAVANJE10 PROC NEAR
        PROVERA10:
        mov cx,KONSTANTA10
        cmp cx,KONSTANTA
        je SKOK10
        call BLOK10_CRTANJE
        ret
        SKOK10:
        ret
    ISCRTAVANJE10 ENDP
	
	PROVERA_SUDARA11 PROC NEAR
        DONJA11:
             mov ax,BLOK11_DONJA
             add ax,BALL_SIZE
             cmp BALL_Y,ax
             jl GORNJA11 
             ret
        GORNJA11:
             mov ax,BLOK11_GORNJA
             sub ax,BALL_SIZE
             cmp BALL_Y,ax
             jg DESNA11 
             ret            
        DESNA11:
             mov ax,BLOK11_DESNA
             add ax,BALL_SIZE
             cmp BALL_X,ax
             jl LEVA11
             ret
        LEVA11:
             mov ax,BLOK11_LEVA
             sub ax,BALL_SIZE
             cmp BALL_X,ax
             jg BROJAC11
             ret
        BROJAC11:
            mov cx,KONSTANTA11
            xor cx,cx
            mov KONSTANTA11,cx
            ret
    PROVERA_SUDARA11 ENDP
    
    ISCRTAVANJE11 PROC NEAR
        PROVERA11:
        mov cx,KONSTANTA11
        cmp cx,KONSTANTA
        je SKOK11
        call BLOK11_CRTANJE
        ret
        SKOK11:
        ret
    ISCRTAVANJE11 ENDP
	
	PROVERA_SUDARA12 PROC NEAR
        DONJA12:
             mov ax,BLOK12_DONJA
             add ax,BALL_SIZE
             cmp BALL_Y,ax
             jl GORNJA12 
             ret
        GORNJA12:
             mov ax,BLOK12_GORNJA
             sub ax,BALL_SIZE
             cmp BALL_Y,ax
             jg DESNA12 
             ret            
        DESNA12:
             mov ax,BLOK12_DESNA
             add ax,BALL_SIZE
             cmp BALL_X,ax
             jl LEVA12
             ret
        LEVA12:
             mov ax,BLOK12_LEVA
             sub ax,BALL_SIZE
             cmp BALL_X,ax
             jg BROJAC12
             ret
        BROJAC12:
            mov cx,KONSTANTA12
            xor cx,cx
            mov KONSTANTA12,cx
            ret
    PROVERA_SUDARA12 ENDP
    
    ISCRTAVANJE12 PROC NEAR
        PROVERA12:
        mov cx,KONSTANTA12
        cmp cx,KONSTANTA
        je SKOK12
        call BLOK12_CRTANJE
        ret
        SKOK12:
        ret
    ISCRTAVANJE12 ENDP
    
    
    
    PLATFORMA_CRTANJE PROC NEAR
        mov cx,PLATFORMA_X
        mov dx,PLATFORMA_Y
        
        DRAW_PLATFORMA_HORIZONTAL:
            mov ah,0ch
            mov al,01h
            mov bh,00h
            int 10h
            
            inc cx
            mov ax,cx
            sub ax,PLATFORMA_X
            cmp ax,PLATFORMA_SIRINA
            jng DRAW_PLATFORMA_HORIZONTAL
            
            mov cx,PLATFORMA_X
            inc dx
            
            mov ax,dx
            sub ax,PLATFORMA_Y
            cmp ax,PLATFORMA_VISINA
            jng DRAW_PLATFORMA_HORIZONTAL
            
        ret 
    PLATFORMA_CRTANJE ENDP  
	
	PLATFORMA_KRETANJE PROC NEAR
	    mov ah,1
		int 16h
		jz NISTA
		mov ah,0
		int 16h
		cmp ah,4Dh
		je DESNA_STRELICA
		cmp ah,4Bh
		je LEVA_STRELICA
		ret
		DESNA_STRELICA:
		mov ax,PLATFORMA_X
		add ax,PLATFORMA_SIRINA
		cmp ax,140h
		jl KRETANJE_DESNO
		ret
		KRETANJE_DESNO:
		mov ax,PLATFORMA_BRZINA
		add PLATFORMA_X,ax
		ret
		LEVA_STRELICA:
		mov ax,PLATFORMA_X
		cmp ax,0h
		jg KRETANJE_LEVO
		ret
		KRETANJE_LEVO:
		mov ax,PLATFORMA_BRZINA
		sub PLATFORMA_X,ax
		ret
		NISTA:
        ret
    PLATFORMA_KRETANJE ENDP 

    PLATFORMA_ODBIJANJE PROC NEAR
        PLATFORMA_LEVA:
            mov ax, PLATFORMA_X
            sub ax, BALL_SIZE
            cmp BALL_X, ax
            jg PLATFORMA_DESNA
            ret            
        PLATFORMA_DESNA:
		    mov ax, PLATFORMA_X
            add ax, PLATFORMA_SIRINA
            add ax,BALL_SIZE
            cmp BALL_X, ax
            jl PLATFORMA_GORNJA
            ret
		PLATFORMA_GORNJA:
            mov ax, PLATFORMA_Y
            sub ax,BALL_SIZE
            cmp BALL_Y, ax
            jg PLATFORMA_ODBIJANJE1
            ret	
        PLATFORMA_ODBIJANJE1:			
            neg BALL_VELOCITY_Y
            ret
    PLATFORMA_ODBIJANJE ENDP 

PORAZ:
        mov ah,00h ; postaviti konfiguraciju za video mod
        mov al,13h ;
        int 10h    ; izvrsi konfiguraciju
		
        mov ah,0bh ; postavi konfiguraciju  za boju pozadine
        mov bh,00h ;
        mov bl,00h ; boja pozadine = crna
        int 10h    ; izvrsi konfiguraciju
       
        int 21h
        jmp kraj	




			
    
    CLEAR_SCREEN PROC NEAR
            mov ah,00h ; postaviti konfiguraciju za video mod
            mov al,13h ;
            int 10h    ; izvrsi konfiguraciju
        
            mov ah,0bh ; postavi konfiguraciju  za boju pozadine
            mov bh,00h ;
            mov bl,00h ; boja pozadine = crna
            int 10h    ; izvrsi konfiguraciju
            
            ret
    CLEAR_SCREEN ENDP
kraj:       mov ax, 4c00h        ; exit
        int 21h
cseg    ends
; ---- Zavrsen segment podataka


; ---- Stek segment
sseg segment stack 'STACK' 
     dw 64 dup(?)
sseg ends
; ---- Zavrsen stek segment

; ---- Definisanje ulazne tacke programa (video)
end draw









