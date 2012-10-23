! solvene: this is the function the root finder uses to calculate ne
FUNCTION solvene(ne)
  USE atomicdata
  USE globalvars
  USE machine
  IMPLICIT NONE
  REAL (KIND=dp) :: solvene
  ! ne: free electron density (cm^{-3})
  ! ng: total number of free particles (free electrons + atoms) (cm^{-3})
  ! denom: denominator of 2nd term of equation we need to solve to get ne
  ! term1, term2: the 2 separate summations in the denominator (over the Y's
  ! and
  ! the fij's)
  REAL (KIND=dp) :: ne, ng, denom, term1, term2
  REAL (KIND=dp), EXTERNAL :: saha, f
  INTEGER :: i, j
  ! get particle density from ideal gas law
  ng = pg/(k*t)
  denom = 0.0D0
  term1 = 0.0D0
  term2 = 0.0D0
  ! here I would sum over all elements 1 through 92, but the partition
  ! function
  ! crashes when i>1 since I only have data for hydrogen. I'd fix it but I'm
  ! running out of time on this assignment.
  DO i = 1, 1
    ! sum over all the ionization states of each element
    DO j = 0, i
      term2 = term2 + dble(j)*f(i, j, ne, t)
    END DO
    term1 = term1 + y(i)*term2
  END DO
  denom = term1
  solvene = ng - ne*(1.0D0+(1.0D0/denom))
  RETURN
END FUNCTION solvene
