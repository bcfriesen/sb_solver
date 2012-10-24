!> Calculates level and ion populations in thermal equilibrium using the
!! Saha-Boltzmann equation.
PROGRAM hw7
  USE atomicdata
  USE globalvars
  USE machine
  USE interfaces, ONLY: zeroin, solvene, f_ij
  IMPLICIT NONE

  REAL (KIND=dp) :: n_e !< free electron number density
  INTEGER :: m !< loops
  NAMELIST /params/ p_g, y
  ! read pressure and abundances from stdin
  READ (*, params)
  call fill_atomic_data
  ! surely everything interesting that happens to hydrogen will happen within
  ! this temperature range
  DO m = 10, 100000, 10
    t = dble(m)
    ! solve non-linear equation for n_e
    n_e = zeroin(1.0D-10, 1.0D20, solvene, 1.0D-5)
    ! write out number fractions of n_HI and n_HII
    WRITE (11, *) t, f_ij(1, 0, n_e, t), f_ij(1, 1, n_e, t)
  END DO
  STOP
END PROGRAM hw7

