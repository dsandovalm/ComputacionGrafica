; Programa que dibuja un reloj
; Elaborado por Diana Sandoval

(defun c:RELOJ()

  (COMMAND "_ERASE" "_ALL" "") ;BORRAR TODO
  (COMMAND "_OSNAP" "_OFF" "") ;DESACTIVAR AUTOSNAP
  (COMMAND "_COLOR" 255 "") ;PONER COLOR BLANCO

  ;CUERPO DEL RELOJ
  (COMMAND "_CIRCLE" "60,160" 60 "")
  (COMMAND "_CIRCLE" "60,160" 54 "")
  (COMMAND "_LINE" "0,0" "15,21" "105,21" "120,0" "0,0" "")
  (COMMAND "_LINE" "15,21" "15,120.3137" "")  
  (COMMAND "_LINE" "105,21" "105,120.3137" "")
  (COMMAND "_LINE" "105,199.6863" "105,240" "15,240" "15,199.6863" "")  
  (COMMAND "_ARC" "30,91.3614" "60,85" "90,91.3614" "")
  (COMMAND "_LINE" "30,91.3614" "30,36" "90,36" "90,91.3614" "")
  (COMMAND "_CIRCLE" "60,48" 10 "")
  (COMMAND "_LINE" "60,58" "60,85" "")

  ;MANECILLAS
    (COMMAND "_COLOR" 240 "")
    (COMMAND "_LINE" "60,160" "60,201" "")
    (SETQ segundero (ENTLAST));NOMBAR SEGUNDERO
    (COMMAND "_COLOR" 255 "")
    (COMMAND "_LINE" "60,160" "60,198" "")
    (SETQ minutero (ENTLAST));NOMBRAR MINUTERO
    (COMMAND "_LINE" "60,160" "60,192" "")
    (SETQ horario (ENTLAST));NOMBRAR HORARIO

    ;LINEAS DE MINUTOS
    (COMMAND "_LINE" "60,210" "60,204" "")
    (COMMAND "_ARRAYPOLAR" (ENTLAST) "" "60,160" 12 360 "")
    (COMMAND "_LINE" "60,210" "60,207" "")
    (COMMAND "_ARRAYPOLAR" (ENTLAST) "" "60,160" 60 360 "")

    ;ZOOM EXTEND DEL DIBUJO
    (COMMAND "_ZOOM" "_E" "")

  (SETQ fecha_inicial (RTOS (GETVAR "CDATE") 2 6))
   (princ fecha)

  (SETQ a_i (SUBSTR fecha_inicial 1 4)
    mes_i (SUBSTR fecha_inicial 5 2)
    dia_i (SUBSTR fecha_inicial 7 2)
    h_i (SUBSTR fecha_inicial 10 2)
    m_i (SUBSTR fecha_inicial 12 2)
    s_i (SUBSTR fecha_inicial 14 2)
  )

  (SETQ hseg (+ (atof s_i) (*  (atof m_i) 60) (* (REM  (atof h_i) 12) 3600) ))

    (SETQ anglem (+ 360 (* (REM hseg 3600) (/ 360.0 3600)) )
	  angleh (+ 360 (* hseg (/ 360.0 43200)))
	  angles (+ 360 (* (atof s) (/ 60 6)))
	)

  (REPEAT 10

    ;HORA

  (SETQ fecha (RTOS (GETVAR "CDATE") 2 6))
   (princ fecha)

  (SETQ a (SUBSTR fecha 1 4)
    mes (SUBSTR fecha 5 2)
    dia (SUBSTR fecha 7 2)
    h (SUBSTR fecha 10 2)
    m (SUBSTR fecha 12 2)
    s (SUBSTR fecha 14 2)
  )
  
  ;ANALOGO

     
  (SETQ hseg (+ (+ (atof s) (* (atof s_i) -1)) (*  (+ (atof m) (* (atof m_i) -1)) 60) (* (REM  (+ (atof h) (* (atof h_i) -1)) 12) 3600) ))

    (SETQ anglem (+ 360 (* (REM hseg 3600) (/ 360.0 3600)) )
	  angleh (+ 360 (* hseg (/ 360.0 43200)))
	  angles (+ 360 (* (+ (atof s) (* (atof s_i) -1)) (/ 60 6)))
	)
  
  (COMMAND "_ROTATE" segundero "" "60,160" angles "" )
  (COMMAND "_ROTATE" minutero "" "60,160" anglem "" )
  (COMMAND "_ROTATE" horario "" "60,160" angleh "")
  
  ;DIGITAL
    (COMMAND "_ERASE" textDate textHour "") ;BORRAR TEXTOS
    (COMMAND "_TEXT" "_J" "_C" "60,20" 6 0 (strcat dia "/" mes "/" a ""))
    (SETQ textDate (ENTLAST));PARA BORRARLA DESPUES 
    (COMMAND "_TEXT" "_J" "_C" "60,225" 6 0 (strcat h":"m":"s ""))
     (SETQ textHour (ENTLAST));PARA BORRARLA DESPUES 

    (COMMAND "_DELAY" 1000 "")
  )
)
