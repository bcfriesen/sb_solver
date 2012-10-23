! saha: calculates ratio of number density of ion j+1 to ion j of atom i.
FUNCTION saha(i, j, ne, t)
  USE atomicdata
  USE machine
  IMPLICIT NONE
  REAL (KIND=dp) :: saha
  ! ne: free electron density (cm^{-3})
  ! t: temperature (K)
  REAL (KIND=dp) :: ne, t
  REAL (KIND=dp), EXTERNAL :: part
  INTEGER :: i, j
  ! this is the Saha equation with ne lumped together with all the
  ! temperature-dependent stuff, so what it returns is n_{i,j+1}/n_{i,j}
  saha = (1.0D0/ne)*(dble(ge)/(2.0D0*pi*hbar)**3)*(part(i,j+1)/part(i,j))* &
    (2.0D0*pi*me*k*t)**(1.5D0)*dexp(-(chiion(i,j)*ev2erg)/(k*t))
  RETURN
END FUNCTION saha
