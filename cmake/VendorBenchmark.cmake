# Add vendored google benchmark
# Provides the following targets:
#  - benchmark

find_package(benchmark QUIET)

if(NOT benchmark_FOUND)

    message(STATUS "Installing benchmark via submodule")
    execute_process(COMMAND git submodule update --init -- vendor/benchmark
                    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})

    set(vendor_source_dir ${CMAKE_SOURCE_DIR}/vendor/benchmark)
    set(vendor_binary_dir ${CMAKE_BINARY_DIR}/vendor/benchmark)

    set(BENCHMARK_ENABLE_TESTING OFF CACHE BOOL "" FORCE)
    set(BENCHMARK_ENABLE_INSTALL OFF CACHE BOOL "" FORCE)
    set(BENCHMARK_DOWNLOAD_DEPENDENCIES OFF CACHE BOOL "" FORCE)
    set(BENCHMARK_ENABLE_GTEST_TESTS OFF CACHE BOOL "" FORCE)
    set(BENCHMARK_ENABLE_LTO ${CMAKE_INTERPROCEDURAL_OPTIMIZATION} CACHE BOOL "" FORCE)

    # Add benchmark directly to our build. This defines
    # the 'benchmark' target.
    add_subdirectory(${vendor_source_dir} ${vendor_binary_dir} EXCLUDE_FROM_ALL)

endif()
