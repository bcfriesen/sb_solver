MODULE INTERFACES
  IMPLICIT NONE

  INTERFACE

    FUNCTION f(i, j, ne, t)
      USE machine
      IMPLICIT NONE
      REAL (KIND=dp) :: f
      REAL (KIND=dp) :: ne, t
      INTEGER :: i, j
    END FUNCTION f

    FUNCTION part(i, j)
      USE machine
      IMPLICIT NONE
      REAL (KIND=dp) :: part
      INTEGER :: i, j
    END FUNCTION part

    FUNCTION saha(i, j, ne, t)
      USE machine
      IMPLICIT NONE
      REAL (KIND=dp) :: saha
      REAL (KIND=dp) :: ne, t
      INTEGER :: i, j
    END FUNCTION saha

    FUNCTION solvene(ne)
      USE machine
      IMPLICIT NONE
      REAL (KIND=dp) :: solvene
      REAL (KIND=dp) :: ne
    END FUNCTION solvene

    double precision function zeroin(ax,bx,f,tol)
      double precision ax,bx,f,tol
      external f
    end function zeroin

  END INTERFACE

END MODULE INTERFACES
