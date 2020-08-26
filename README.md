# imgui fonts

OTF/TTF fonts baked into cpp files to be used in c++ [ImGui](https://github.com/ocornut/imgui) projects

## License
All files under the `src` folder were generated from fonts released under SIL Open Font License (OFL) 1.1 [https://scripts.sil.org/OFL](https://scripts.sil.org/OFL)

All brand icons embedded in the fonts are trademarks of their respective owners. Please do not use brand logos for any purpose except to represent the company, product, or service to which they refer. 

The MIT license applies to all other files

## Font sources
- Source sans pro: https://github.com/adobe-fonts/source-sans-pro
- FontAwesome5: https://github.com/FortAwesome/Font-Awesome

## Usage
```Cpp
#include <fonts/source_sans_pro_regular.h>
#include <fonts/fontawesome5.h>
#include <IconsFontAwesome5.h>

constexpr float size = 16.0f;
static constexpr ImWchar fontawesome5_glyph_ranges[] = {ICON_MIN_FA, ICON_MAX_FA, 0};

ImGuiIO& io = ImGui::GetIO();
ImFontConfig config;
config.PixelSnapH = true;
io.Fonts->AddFontFromMemoryCompressedTTF(source_sans_pro_regular_compressed_data, source_sans_pro_regular_compressed_size, size, &config, io.Fonts->GetGlyphRangesDefault());
config.MergeMode = true;
io.Fonts->AddFontFromMemoryCompressedTTF(fontawesome5_compressed_data, fontawesome5_compressed_size, size, &config, fontawesome5_glyph_ranges);

io.Fonts->Build();
```

## Usage - generating fonts
1. generate the project: 
```
mkdir build
cd build 
cmake .. 
cmake --build .
```

2. use `font_binary_to_compressed_c` to generate the font

3. edit the .c as needed and create the respective header file.
