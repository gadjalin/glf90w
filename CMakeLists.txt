CMAKE_MINIMUM_REQUIRED(VERSION 3.20 FATAL_ERROR)

# --- Project configuration
PROJECT(GLF90W
    VERSION 0.2.0
    DESCRIPTION "Fortran bindings for GLFW."
    HOMEPAGE_URL https://github.com/gadjalin/glf90w.git
    LANGUAGES C Fortran
)

SET_PROPERTY(GLOBAL PROPERTY USE_FOLDER ON)

SET(CMAKE_CONFIGURATION_TYPES Release Debug)
SET(CMAKE_DEBUG_POSTFIX -d)
SET(CMAKE_EXPORT_COMPILE_COMMANDS ON)

OPTION(BUILD_SHARED_LIBS "Build shared libraries." OFF)

# TODO Fortran 2023 support. And 2008 for compatibility?
# Currently clashes with definition of f_c_string in glf90w.F90
IF(CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
    ADD_COMPILE_OPTIONS("$<$<COMPILE_LANGUAGE:Fortran>:-std=f2018>")
ELSEIF(CMAKE_Fortran_COMPILER_ID STREQUAL "Intel")
    ADD_COMPILE_OPTIONS("$<$<COMPILE_LANGUAGE:Fortran>:-stand;f2018>")
ELSE()
    MESSAGE(WARNING
        "Unsupported Fortran compiler.\n"
        "Please use \"-DCMAKE_Fortran_FLAGS=...\" in the meantime and report the issue to the project maintainer."
    )
ENDIF()

# --- Build base GLFW
ADD_SUBDIRECTORY(glfw)

# --- Build Fortran bindings
ADD_LIBRARY(glf90w)

SET_TARGET_PROPERTIES(glf90w PROPERTIES
    OUTPUT_NAME glf90w
    VERSION ${GLF90W_VERSION_MAJOR}.${GLF90W_VERSION_MINOR}
    SOVERSION ${GLF90W_VERSION_MAJOR}
    POSITION_INDEPENDENT_CODE ON
    Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/mod
    Fortran_PREPROCESS ON
    FOLDER "GLF90W"
)

TARGET_INCLUDE_DIRECTORIES(glf90w PUBLIC "${CMAKE_CURRENT_BINARY_DIR}/mod")
TARGET_INCLUDE_DIRECTORIES(glf90w PRIVATE "${PROJECT_SOURCE_DIR}/include")

TARGET_SOURCES(glf90w PRIVATE src/glf90w.F90 src/glf90w.c)

TARGET_LINK_LIBRARIES(glf90w PRIVATE glfw)

