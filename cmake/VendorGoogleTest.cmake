# Add vendored googletest
# Provides the following targets:
#  - gtest
#  - gtest_main
#
# This file is part of:
# https://github.com/nazavode/cmake-depot.git

find_package(GTest QUIET)

if(NOT GTEST_FOUND)

    message(STATUS "Installing googletest via submodule")
    execute_process(COMMAND git submodule update --init -- vendor/googletest
                    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})

    set(vendor_source_dir ${CMAKE_SOURCE_DIR}/vendor/googletest)
    set(vendor_binary_dir ${CMAKE_BINARY_DIR}/vendor/googletest)

    # Prevent overriding the parent project's compiler/linker
    # settings on Windows
    set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

    set(BUILD_GTEST ON CACHE BOOL "" FORCE)
    set(BUILD_GMOCK ON CACHE BOOL "" FORCE)
    set(INSTALL_GTEST OFF CACHE BOOL "" FORCE)
    set(INSTALL_GMOCK OFF CACHE BOOL "" FORCE)

    # Add googletest directly to our build. This defines
    # the gtest and gtest_main targets.
    add_subdirectory(${vendor_source_dir} ${vendor_binary_dir} EXCLUDE_FROM_ALL)

    # The gtest/gtest_main targets carry header search path
    # dependencies automatically when using CMake 2.8.11 or
    # later. Otherwise we have to add them here ourselves.
    if (CMAKE_VERSION VERSION_LESS 2.8.11)
        include_directories("${gtest_SOURCE_DIR}/include")
    endif ()

endif()
