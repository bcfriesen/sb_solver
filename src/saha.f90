!-------------------------------------------------------------------------------
!
! File Name : saha.f
!
! Purpose : solves equation of state using the Saha equation
!
! Creation Date : 08-10-2010
!
! Last Modified : Tue 12 Oct 2010 09:22:40 PM CDT
!
! Created By : Brian Friesen
!
!-------------------------------------------------------------------------------

program hw7
use atomicdata
use globalvars
use machine
implicit none
real(kind=dp), external :: saha, part, zeroin, solvene, f
! ne: free electron density (cm^{-3})
real(kind=dp) :: ne
integer :: m
namelist /params/ pg, y
! read pressure and abundances from stdin
read(*, params)
! surely everything interesting that happens to hydrogen will happen within this
! temperature range
do m=10,100000,10
   t = dble(m)
!  zeroin is the root finder. arguments are (lower bound, upper bound, f(x),
!  tolerance)
   ne = zeroin(1.0d-10, 1.0d20, solvene, 1.0d-5)
!  these had better add up to 1
   write(11,*) t, f(1,0,ne,t), f(1,1,ne,t)
end do
stop
end program hw7




! solvene: this is the function the root finder uses to calculate ne
function solvene(ne)
use atomicdata
use globalvars
use machine
implicit none
real(kind=dp) :: solvene
! ne: free electron density (cm^{-3})
! ng: total number of free particles (free electrons + atoms) (cm^{-3})
! denom: denominator of 2nd term of equation we need to solve to get ne
! term1, term2: the 2 separate summations in the denominator (over the Y's and
!               the fij's)
real(kind=dp) :: ne, ng, denom, term1, term2
real(kind=dp), external :: saha, f
integer :: i, j
! get particle density from ideal gas law
ng = pg/(k*t)
denom = 0.0d0
term1 = 0.0d0
term2 = 0.0d0
! here I would sum over all elements 1 through 92, but the partition function
! crashes when i>1 since I only have data for hydrogen. I'd fix it but I'm
! running out of time on this assignment.
do i = 1, 1
!  sum over all the ionization states of each element
   do j = 0, i
      term2 = term2 + dble(j)*f(i,j,ne,t)
   end do
   term1 = term1 + y(i)*term2
end do
denom = term1
solvene = ng-ne*(1.0d0+(1.0d0/denom))
return
end function solvene





! saha: calculates ratio of number density of ion j+1 to ion j of atom i.
!       juggling all these indices is a real PITA
function saha(i,j,ne,t)
use atomicdata
use machine
implicit none
real(kind=dp) :: saha
! ne: free electron density (cm^{-3})
! t: temperature (K)
real(kind=dp) :: ne, t
real(kind=dp), external :: part
integer :: i,j
! this is the Saha equation with ne lumped together with all the
! temperature-dependent stuff, so what it returns is n_{i,j+1}/n_{i,j}
saha = (1.0d0/ne)*(dble(ge)/(2.0d0*pi*hbar)**3)*&
       (part(i,j+1)/part(i,j))*&
       (2.0d0*pi*me*k*t)**(1.5d0)*dexp(-(chiion(i,j)*ev2erg)/(k*t))
return
end function saha





! part: calculates the partition function for atom i in ionization state j
function part(i,j)
use atomicdata
use globalvars
use machine
implicit none
real(kind=dp) :: part
integer :: i, j, m
part = 0.0d0
do m = 1, nlvl(i,j)
   part = part + dble(g(i,j,m))*dexp(-(chilvl(i,j,m)*ev2erg)/(k*t))
end do
return
end function part





! f: determines fraction of atom i which is in ionization state j
function f(i,j,ne,t)
use machine
implicit none
real(kind=dp) :: f
real(kind=dp), external :: saha
real(kind=dp) :: ne, t
integer :: i,j,m,n
! num: numerator of fij equation we derived in class
! denom: denominator of fij equation we derived in class
real(kind=dp) :: num, denom, term
! the numerator of fij is a product of j ratios
num = 1.0d0
do n = 0, j-1
   num = num*saha(i,n,ne,t)
end do
! the denominator of fij is a sum of i+1 terms. the 1st term is 1, and after 
! that the nth term in the sum is a product of n-1 ratios (i.e., 2nd term is
! 1 ratio, 3rd term is 2 ratios, etc.)
denom = 0.0d0
term = 1.0d0
do n = 1, i+1
   term = 1.0d0
   do m = 1, n-1
      if (n .eq. 1) exit
      term = term*saha(i,m-1,ne,t)
   end do
   denom = denom + term
end do
f = num/denom
return
end function f
