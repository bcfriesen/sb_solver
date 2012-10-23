! part: calculates the partition function for atom i in ionization state j
FUNCTION part(i, j)
  USE atomicdata
  USE globalvars
  USE machine
  IMPLICIT NONE
  REAL (KIND=dp) :: part
  INTEGER :: i, j, m

  part = 0.0D0
  DO m = 1, nlvl(i, j)
    part = part + dble(g(i,j,m))*dexp(-(chilvl(i,j,m)*ev2erg)/(k*t))
  END DO
  RETURN
END FUNCTION part

