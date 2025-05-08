PRO PlotRoche

  ; q: is the mass ratio of the binary.
  ; a: is the separation between the two stars.

a = 1.
G = 1.
M2 = 1.
q = 0.25
NUM = 1000.
Term1 = FINDGEN(NUM, NUM)
Term2 = FINDGEN(NUM, NUM)
Term3 = FINDGEN(NUM, NUM)
x = FINDGEN(NUM)*((3*a)/NUM)-1.5*a
y = FINDGEN(NUM)*((3*a)/NUM)-1.5*a

FOR i = 0, NUM-1 DO BEGIN
  PRINT, i/NUM*100
  FOR j = 0, NUM-1 DO BEGIN
  
    IF(((x[i]-(a*q)/(q+1))^2 + y[j]^2) EQ 0) THEN BEGIN 
      Term1[i, j] = -10
    ENDIF ELSE BEGIN
      Term1[i, j] = -1./SQRT(((x[i]-(a*q)/(q+1))^2 + y[j]^2)); Gravitational potential of M2
    ENDELSE
    
    IF(((x[i]+a/(q+1))^2 + y[j]^2) EQ 0) THEN BEGIN
      Term2[i, j] = 0;
    ENDIF ELSE BEGIN
      Term2[i, j] = -1.*q/SQRT(((x[i]+a/(q+1))^2 + y[j]^2))    ; Graviational potential of M1
    ENDELSE
    
    Term3[i, j] = -0.5*(q+1)/(a^3)*(x[i]^2 + y[j]^2)            ; Centripetal term
    IF (Term1[i,j] + Term2[i,j] + Term3[i,j] LT -5)THEN BEGIN
    Term1[i,j] = 0
    Term2[i,j] = 0
    Term3[i,j] = 0
    ENDIF
  ENDFOR
ENDFOR
p3 = CONTOUR(Term1 + Term2 + Term3, x, y, N_LEVELS = 150, ZRANGE = [-0.1,-5], YRANGE = [-1.5,1.5], XRANGE = [-1.5,1.5], TITLE = "Roche Potential with q = 1", C_LABEL_SHOW = 0)
save, p3
p3.Save, "roche.ps"
END
