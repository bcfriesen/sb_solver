!-------------------------------------------------------------------------------
!
! File Name : atomicdata.f
!
! Purpose : holds all the relevant atomic data and physical constants for
!           solving HW #7.
!
! Creation Date : 09-10-2010
!
! Last Modified : Tue 12 Oct 2010 10:07:25 PM CDT
!
! Created By : Brian Friesen
!
!-------------------------------------------------------------------------------
module atomicdata
use machine
implicit none
! nlvlmax: maximum number of levels for any given atom.
integer, parameter :: nlvlmax = 100
! nlvl(i,j): actual number of levels to consider for ion j of atom i.
!            n(i,j)=0 if j>i. n is equal to the index 'k' in the formalism
!            from class. just for future reference, i=1 -> hydrogen,
!            j=0 -> neutral, k=1 -> ground state. hence the non-standard indices
!            for j in a whole bunch of these arrays.
integer, public :: nlvl(92,0:92)
! chilvl: level energies (ground = 0) (units = eV)
real(kind=dp), public :: chilvl(92,0:92,nlvlmax)
! g: statistical weight for each level
integer, public :: g(92,0:92,nlvlmax)
! chiion(i,j): ionization potential of atom i in ionization state j (eV)
real(kind=dp), public :: chiion(92,0:92)
! ge: electron statistical weight
integer, parameter, public :: ge = 2
! physical constants
real(kind=dp), parameter, public :: pi = 3.14159d0, me = 9.109d-28, k = 1.38065d-16, &
                             h = 6.626d-27, hbar = h/(2.0d0*pi), c = 3.0d10
! ev2erg: converts eV to erg
real(kind=dp), parameter, public :: ev2erg = 1.602d-12

! for this homework, H I = 10 levels, H II = 1 level
data nlvl(1,0) /10/
data nlvl(1,1) /1/
! for H I level k has energy 13.6 eV - (13.6 eV / k^2)
data chilvl(1,0,1)  /00.0d0/, chilvl(1,0,2) /10.2d0/, chilvl(1,0,3) /12.1d0/, &
     chilvl(1,0,4)  /12.8d0/, chilvl(1,0,5) /13.1d0/, chilvl(1,0,6) /13.2d0/, &
     chilvl(1,0,7)  /13.3d0/, chilvl(1,0,8) /13.4d0/, chilvl(1,0,9) /13.4d0/, &
     chilvl(1,0,10) /13.5d0/
data chilvl(1,1,1)  /0.0d0/
! for H I the degeneracy of level k is 2k^2
data g(1,0,1) /2/,   g(1,0,2)  /8/,  g(1,0,3) /18/, g(1,0,4) /32/,  &
     g(1,0,5) /50/,  g(1,0,6)  /72/, g(1,0,7) /98/, g(1,0,8) /128/, &
     g(1,0,9) /162/, g(1,0,10) /200/
data g(1,1,1) /1/

data chiion(1,0) /13.6d0/
data chiion(1,1) /0.0d0/
end module atomicdata
