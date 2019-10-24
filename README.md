# cmake-depot

A collection of useful `CMake` files meant to be cherry-picked as needed.

## What's inside

### [./cache](cache)

Cache initialization files, meant to be used at generation phase via `cmake -C <initial-cache>`, that set `CMAKE_<lang>_FLAGS_<build-type>`variables according to a particular build (e.g.: [optimzation for the build host](cache/native.cmake)).

### [./cmake](cmake)

| File name  | Content |
| ------------- | ------------- |
| `Find*.cmake`  | Find a dependency. Regular `CMake` finder, should work like any other builtin finder script.  |
| `Vendor*.cmake`  | Vendor an external source tree if needed. Looks for the dependency on the system (via `find_package`) and, if not found, updates a `git submodule` and add its content via `add_subdirectory`.  |
| `Fn*.cmake` | Provides a `CMake` function. |
