( defun C:RELOJ ()

    (COMMAND "_ERASE" "_ALL" "") ;Borrar todo  
    (COMMAND "_SNAP" "_OFF" "") ;Desactivar el autoajuste 

    (COMMAND "_CIRCLE" "120,120" "105" "") ;Dibujar circulo 
    (COMMAND "_CIRCLE" "120,120" "100" "") ;Dibujar circulo 

    ;Lineas Hora 
    ; i<=360; i=i+30 Line 120,25 120,40 Rotate 120,120 i++, or 

    (COMMAND "_LINE" "120,25" "120,40" "")
    (COMMAND "_ARRAY" (entlast) "_POLAR" "120,120" "_I" "12" "")
    ;(COMMAND "_ROTATE" (entlast) "" "120,120" 0 ) 
    ;(COMMAND "_LINE" "120,25" "120,40" "") 
    ;(COMMAND "_ROTATE" (entlast) "" "120,120" 30 )  
    (COMMAND "_LINE" "120,25" "120,40" "") 
    (COMMAND "_ROTATE" (entlast) "" "120,120" 60 ) 
    (COMMAND "_LINE" "120,25" "120,40" "" "_ROTATE" (entlast) "120,120" 90 ) 
    (COMMAND "_LINE" "120,25" "120,40" "" "_ROTATE" (entlast) "120,120" 120 ) 
    (COMMAND "_LINE" "120,25" "120,40" "" "_ROTATE" (entlast) "120,120" 150 ) 
    (COMMAND "_LINE" "120,25" "120,40" "" "_ROTATE" (entlast) "120,120" 180 ) 
    (COMMAND "_LINE" "120,25" "120,40" "" "_ROTATE" (entlast) "120,120" 210 ) 
    (COMMAND "_LINE" "120,25" "120,40" "" "_ROTATE" (entlast) "120,120" 240 )  
    (COMMAND "_LINE" "120,25" "120,40" "" "_ROTATE" (entlast) "120,120" 270 ) 
    (COMMAND "_LINE" "120,25" "120,40" "" "_ROTATE" (entlast) "120,120" 300 ) 
    (COMMAND "_LINE" "120,25" "120,40" "" "_ROTATE" (entlast) "120,120" 330 ) 

    ;Lineas de minutos -48 
    ; i<=360; i=i+6 Line 120,25 120,35 Rotate 120,120 i++, or 

    (COMMAND "_CIRCLE" "120,120" "2" "" "_LINE" "122,120" "120,210" "118,120" "") ;Dibujar segundero 
    (COMMAND "_GROUP" ent (entlast)) ;Agrupar 
    (setq SEG ent (entlast)) ;Nombrar segundero 
    (COMMAND "_COLOR"  "red" ent (entlast)) ;Darle color al segundero 

    (COMMAND "_CIRCLE" "120,120" "5" "" "_LINE" "125,120" "120,200" "115,120" "") ;Dibujar minutero 
    (COMMAND "_GROUP" ent (entlast)) ;Agrupar 
    (setq MIN ent (entlast)) ;Nombrar minutero 

    (COMMAND "_CIRCLE" "120,120" "5" "" "_LINE" "125,120" "120,180" "115,120" "") ;Dibujar horario 
    (COMMAND "_GROUP" ent (entlast)) ;Agrupar 
    (setq H ent (entlast)) ;Nombrar horario 
    
    
    ;(;Obtener hora de sistema 

    ;Pasar hora sist a segundos 

    ;Modulo hora/1440, nombrar s  

    ;Rotar SEG (s*6) grados, con centro en 120,120 

    ;Modulo hora/24, nombrar m 

    ;Rotar MIN (m*1) grados, con centro en 120,120 

    ;Modulo hora/12, nombrar h 

    ;Rotar H (h*(1/12)) grados, con centro en 120,120 

) ;Repetir cada segundo 62
