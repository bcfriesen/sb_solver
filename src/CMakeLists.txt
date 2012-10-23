SET (sb_solver_SOURCES
    atomicdata.f90
    globalvars.f90
    machine.f90
    saha.f90
    zeroin.f
    )

ADD_EXECUTABLE (${PROJECT_NAME} ${sb_solver_SOURCES})
