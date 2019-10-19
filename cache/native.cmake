# Auto-detect arch of the build machine and flagsimize/generate for it

set(flags "-O3 -DNDEBUG -march=native -mtune=native")

# Release
set(CMAKE_C_FLAGS_RELEASE   "${flags}" CACHE STRING "")
set(CMAKE_CXX_FLAGS_RELEASE "${flags}" CACHE STRING "")

# RelWithDebInfo
set(CMAKE_C_FLAGS_RELWITHDEBINFO   "${flags} -g" CACHE STRING "")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${flags} -g" CACHE STRING "")

unset(flags)
