# Yazılımperver - C++ Projeleri için Şablon (Temel)

![C++](https://img.shields.io/badge/C%2B%2B-14%2F17%2F20%2F23-blue)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

C++ projeleriniz için kullanabileceğiniz temel bir şablon reposudur. Bu repo ile birlikte:

- Ayrı ayır dizinlerde kütüphane (statik/dinamik), çalıştırılabilir uygulama ve test kodları,
- Yazılım konfigürasyon ve oluşturma için modern CMake şablonu (Preset'ler vs.)
- Birim testler için [GoogleTest](https://github.com/google/googletest)
- Kullanışlı ve genel amaçlı kütüphaneler: 
  - [JSON](https://github.com/nlohmann/json)
- Araçlar: Clang-Format, Clang-tidy

## Genel Dizin Yapısı

``` text
├── CMakeLists.txt
├── app
│   ├── CMakesLists.txt
│   └── src
│       └── main.cc
├── lib
│   ├── CMakesLists.txt
│   └── include
│       └── function_lib.h
│   └── src
│       └── function_lib.cpp
├── tests
│   ├── CMakeLists.txt
│   └── src
│       └── test_function_lib.cpp
├── cmake
│   └── cmake modülleri
├── gitconfigs
│   └── Kullanılabilecek örnek git konfigürasyon ayarlar/alias'lar
├── .github
│   └── workflows : Github action betikleri
```

Kütüphane kodları [lib/](lib/), ana uygulama kodları [app/](app) ve testler de [tests/](tests/) dizinlerinde. Bunların yanında uygulamaları oluşturmak için de [scripts/](scripts) dizini içerisinde betikler bulunmaktadır.

## Kullanım

Öncelikle bu repoyu klonlayın lütfen.

```shell
git clone --recursive https://github.com/
```

- Sunulan CMake presetleri listelemek için:

```shell
scripts/list_presets.sh
```

- Sunulan CMake presetleri:
```shell
  - Konfigürasyon presetleri:
    "debug-msvc"    - Debug (MSVC)
    "debug-gcc"     - Debug (GCC)
    "debug-clang"   - Debug (CLANG)
    "release-msvc"  - Release (MSVC)
    "release-gcc"   - Release (GCC)
    "release-clang" - Release (CLANG)
  - Oluşturma presetleri:
    "build-debug-gcc"
    "build-release-gcc"
    "build-debug-msvc"
    "build-release-msvc"
```

- Uygulamayı Oluşturup/Derlemek için:

```shell
scripts/build.sh  // Linux
scripts/build.bat  // Windows
```

- Birim Testler İçin (herhangi bir debug preseti ile yazılımı oluşturup testler koşturulabilir). g++-debug için:

```shell
scripts/build.sh Debug
scripts/runTests.sh
```
- Ya da ilgili presete özel konfigürasyon girilebilir
```shell
ctest --test-dir build/debug-gcc/test
```

CMake ile ilgili daha detaylı bilgi için [buraya](./README_cmake.md).
