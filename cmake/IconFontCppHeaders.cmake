if (TARGET IconFontCppHeaders)
    return()
endif()

include_guard()
include(CPM)
CPMAddPackage(
    NAME IconFontCppHeaders
    GITHUB_REPOSITORY juliettef/IconFontCppHeaders
    GIT_TAG 8a381189ecfe58e732466cc52e79ca887dd6a297
)

if (IconFontCppHeaders_ADDED) 
    FILE(GLOB sources ${IconFontCppHeaders_SOURCE_DIR}/*.h)
    add_library(IconFontCppHeaders INTERFACE)
    target_include_directories(IconFontCppHeaders INTERFACE ${IconFontCppHeaders_SOURCE_DIR})
    target_sources(IconFontCppHeaders PRIVATE ${sources})

    add_library(juliettef::IconFontCppHeaders ALIAS IconFontCppHeaders)
endif()
