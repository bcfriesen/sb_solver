! f: determines fraction of atom i which is in ionization state j
FUNCTION f(i, j, ne, t)
  USE machine
  IMPLICIT NONE
  REAL (KIND=dp) :: f
  REAL (KIND=dp), EXTERNAL :: saha
  REAL (KIND=dp) :: ne, t
  INTEGER :: i, j, m, n
  ! num: numerator of fij equation we derived in class
  ! denom: denominator of fij equation we derived in class
  REAL (KIND=dp) :: num, denom, term
  ! the numerator of fij is a product of j ratios
  num = 1.0D0
  DO n = 0, j - 1
    num = num*saha(i, n, ne, t)
  END DO
  ! the denominator of fij is a sum of i+1 terms. the 1st term is 1, and after
  ! that the nth term in the sum is a product of n-1 ratios (i.e., 2nd term is
  ! 1 ratio, 3rd term is 2 ratios, etc.)
  denom = 0.0D0
  term = 1.0D0
  DO n = 1, i + 1
    term = 1.0D0
    DO m = 1, n - 1
      IF (n==1) EXIT
      term = term*saha(i, m-1, ne, t)
    END DO
    denom = denom + term
  END DO
  f = num/denom
  RETURN
END FUNCTION f
