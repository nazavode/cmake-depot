add_library(cxxfeatures INTERFACE)
set_property(TARGET cxxfeatures PROPERTY INTERFACE_CXX_EXTENSIONS OFF)
if(cxx_std_17 IN_LIST CMAKE_CXX_COMPILE_FEATURES)
    set_property(TARGET cxxfeatures PROPERTY INTERFACE_COMPILE_FEATURES cxx_std_17)
else()
    if(MSVC)
        set(_cxx_std_flag  /std:c++17)
    else()
        set(_cxx_std_flag -std=c++17)
    endif()
    include(CheckCXXCompilerFlag)
    check_cxx_compiler_flag(${_cxx_std_flag} COMPILER_SUPPORTS_CXX_STD17_FLAG)
    if(COMPILER_SUPPORTS_CXX_STD17_FLAG)
        message(STATUS "CMake compile features not available for the current \
toolchain or CMake version, setting C++ standard level directly via compiler \
flags. Please be aware that setting flags doesn't check the actual C++17 \
standard support provided by the underlying toolchain, e.g.: build may fail \
on unsupported features.")
        set_property(TARGET cxxfeatures PROPERTY INTERFACE_COMPILE_OPTIONS ${_cxx_std_flag})
    else()
        message(WARNING "Compiler seems to be unable to accept '${_cxx_std_flag}', 
build will probably fail. Please set CMAKE_CXX_FLAGS to some sensible value for \
your toolchain.")
    endif()
endif()
# Add target alias for the sake of consistency
add_library(geodock::cxxfeatures ALIAS cxxfeatures)
