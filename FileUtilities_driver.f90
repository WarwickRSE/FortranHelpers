PROGRAM main

  USE FileUtilities
  USE iso_fortran_env
  CHARACTER(LEN=30) :: file = "stringFile.txt"
  INTEGER :: err, unit, i
  INTEGER, PARAMETER :: maxlines = 100
  REAL(KIND=REAL64), DIMENSION(:), ALLOCATABLE :: row
  err = 0
  OPEN(newunit=unit, FILE=file, ACTION="READ", IOSTAT=err)

  DO i = 1, maxlines
    ! Read a whole line
    CALL readLineOfReals(unit, row, err)
    IF(err == -1) EXIT
    PRINT*, row
  END DO

  ! Deallocate the internal buffer
  CALL readLineOfReals(-1, row, err, dealloc=.TRUE.)

END PROGRAM
