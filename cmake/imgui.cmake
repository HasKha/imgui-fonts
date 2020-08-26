include(FetchContent)
FetchContent_Declare(
    imgui
    GIT_REPOSITORY https://github.com/ocornut/imgui.git
    GIT_TAG 95c99aaa4be611716093edcb6b01146ab9483f30)
FetchContent_MakeAvailable(imgui)

# In this repository, we only care about imgui's binary_to_compressed_c, to generate cpp files from .ttf
add_executable(font_binary_to_compressed_c "${imgui_SOURCE_DIR}/misc/fonts/binary_to_compressed_c.cpp")
