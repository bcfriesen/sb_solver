! Holds all the relevant atomic data and physical constants.
MODULE atomicdata
  USE machine
  IMPLICIT NONE
  ! nlvlmax: maximum number of levels for any given atom.
  INTEGER, PARAMETER :: nlvlmax = 100
  ! nlvl(i,j): actual number of levels to consider for ion j of atom i.
  ! n(i,j)=0 if j>i. n is equal to the index 'k' in the formalism
  ! from class. just for future reference, i=1 -> hydrogen,
  ! j=0 -> neutral, k=1 -> ground state. hence the non-standard indices
  ! for j in a whole bunch of these arrays.
  INTEGER, PUBLIC :: nlvl(92, 0:92)
  ! chilvl: level energies (ground = 0) (units = eV)
  REAL (KIND=dp), PUBLIC :: chilvl(92, 0:92, nlvlmax)
  ! g: statistical weight for each level
  INTEGER, PUBLIC :: g(92, 0:92, nlvlmax)
  ! chiion(i,j): ionization potential of atom i in ionization state j (eV)
  REAL (KIND=dp), PUBLIC :: chiion(92, 0:92)
  ! ge: electron statistical weight
  INTEGER, PARAMETER, PUBLIC :: ge = 2
  ! physical constants
  REAL (KIND=dp), PARAMETER, PUBLIC :: pi = 3.14159D0, me = 9.109D-28, &
    k = 1.38065D-16, h = 6.626D-27, hbar = h/(2.0D0*pi), c = 3.0D10
  ! ev2erg: converts eV to erg
  REAL (KIND=dp), PARAMETER, PUBLIC :: ev2erg = 1.602D-12

  ! for this homework, H I = 10 levels, H II = 1 level
  DATA nlvl(1, 0)/10/
  DATA nlvl(1, 1)/1/
  ! for H I level k has energy 13.6 eV - (13.6 eV / k^2)
  DATA chilvl(1, 0, 1)/00.0D0/, chilvl(1, 0, 2)/10.2D0/, &
    chilvl(1, 0, 3)/12.1D0/, chilvl(1, 0, 4)/12.8D0/, chilvl(1, 0, 5)/13.1D0/, &
    chilvl(1, 0, 6)/13.2D0/, chilvl(1, 0, 7)/13.3D0/, chilvl(1, 0, 8)/13.4D0/, &
    chilvl(1, 0, 9)/13.4D0/, chilvl(1, 0, 10)/13.5D0/
  DATA chilvl(1, 1, 1)/0.0D0/
  ! for H I the degeneracy of level k is 2k^2
  DATA g(1, 0, 1)/2/, g(1, 0, 2)/8/, g(1, 0, 3)/18/, g(1, 0, 4)/32/, &
    g(1, 0, 5)/50/, g(1, 0, 6)/72/, g(1, 0, 7)/98/, g(1, 0, 8)/128/, &
    g(1, 0, 9)/162/, g(1, 0, 10)/200/
  DATA g(1, 1, 1)/1/

  DATA chiion(1, 0)/13.6D0/
  DATA chiion(1, 1)/0.0D0/
END MODULE atomicdata
