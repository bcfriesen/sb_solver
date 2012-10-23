! Contains global variables that everybody can use so I don't have pass 83
! arguments to every function
MODULE globalvars
  USE machine
  IMPLICIT NONE
  ! t: temperature (K)
  ! pg: total gas pressure (erg cm^{-3})
  ! y: number fractions of elements
  REAL (KIND=dp), PUBLIC :: t, pg, y(92)
END MODULE globalvars
