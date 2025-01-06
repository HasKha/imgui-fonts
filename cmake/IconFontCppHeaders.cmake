if (TARGET IconFontCppHeaders)
    return()
endif()

include_guard()
include(CPM)
CPMAddPackage(
    NAME IconFontCppHeaders
    GITHUB_REPOSITORY juliettef/IconFontCppHeaders
    GIT_TAG 685673dea6fb4012bd2104bf9b8d8da802eade50
)

add_library(IconFontCppHeaders INTERFACE)
add_library(juliettef::IconFontCppHeaders ALIAS IconFontCppHeaders)

target_include_directories(IconFontCppHeaders INTERFACE ${iconfontcppheaders_SOURCE_DIR})
