! Solves equation of state using the Saha-Boltzmann equation.
PROGRAM hw7
  USE atomicdata
  USE globalvars
  USE machine
  USE interfaces, ONLY: zeroin, solvene, f
  IMPLICIT NONE
!  REAL (KIND=dp), EXTERNAL :: saha, part, zeroin, solvene, f
  ! ne: free electron number density (cm^{-3})
  REAL (KIND=dp) :: ne
  INTEGER :: m
  NAMELIST /params/ pg, y
  ! read pressure and abundances from stdin
  READ (*, params)
  ! surely everything interesting that happens to hydrogen will happen within
  ! this
  ! temperature range
  DO m = 10, 100000, 10
    t = dble(m)
    ! zeroin is the root finder. arguments are (lower bound, upper bound,
    ! f(x),
    ! tolerance)
    ne = zeroin(1.0D-10, 1.0D20, solvene, 1.0D-5)
    ! these had better add up to 1
    WRITE (11, *) t, f(1, 0, ne, t), f(1, 1, ne, t)
  END DO
  STOP
END PROGRAM hw7

