! Machine-dependent constants.
MODULE machine
  IMPLICIT NONE
  INTEGER, PARAMETER :: sp = selected_real_kind(precision(1.0))
  INTEGER, PARAMETER :: dp = selected_real_kind(precision(1.0d0))
END MODULE machine
