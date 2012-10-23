!-------------------------------------------------------------------------------
!
! File Name : globalvars.f
!
! Purpose : contains global variables that everybody can use so I don't have to !           pass 83 arguments to every function
!
! Creation Date : 09-10-2010
!
! Last Modified : Tue 12 Oct 2010 10:08:41 PM CDT
!
! Created By : Brian Friesen
!
!-------------------------------------------------------------------------------

module globalvars
use machine
implicit none
! t: temperature (K)
! pg: total gas pressure (erg cm^{-3})
! y: number fractions of elements
real(kind=dp), public :: t, pg, y(92)
end module globalvars
