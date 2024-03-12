# CMake Hızlı Kullanım
Bu sayfa içerisinde CMake kullanımına yönelik temel bir takım bilgiler verilecektir.
Mevcut betikler preset'ler üzerinden çalışsa da (ki kullanım da ana sayfada verilmekte), buradaki bilgilerin kullanıma faydalı olacağını değerlendiriyorum.

## Proje 

```bash
cmake [<opsiyonlar>] -S <kaynak-dizini> -B <olusturma-dizini>
```

CMakeLists.txt dosyasının, tepe dizinde olduğunu farz edersek, proje dosyalarınızı aşağıdaki gibi oluşturabilirsiniz.

```bash
cmake -S . -B build
```
## CMake için desteklenen üreteçler için

```bash
cmake -g
```
## Ninja için gerekli dosyaların oluşturulması

```bash
cmake -S . -B build -G "Ninja"
```

## Makefile için gerekli dosyaların oluşturulması

```bash
cmake -S . -B build -G "Unix Makefiles"
```

## MSVC için gerekli dosyaların oluşturulması

```bash
cmake -S . -B build -G "Visual Studio 16 2019" # Option 1
```

## Oluşturma Tipini Verme

Genelde varsayılan yazılım oluşturma tipi Debug'dır ama Release build almak isterseniz.

```bash
# Release build konfigure edelim
cmake -S . -B build -D CMAKE_BUILD_TYPE=Release

# Release binary'lerini olusturalım
cmake --build build
```

## Opsiyon Geçirme

Eğer CMake betikleriniz içerisinde opsiyonlar varsa (şablonda /cmake/StandardOptions.cmake'e bakabilirsiniz), bunlara ilişkin değerleri komut satırından aşağıdaki gibi geçirebilirsiniz.

```bash
cmake -DMY_OPTION=[ON|OFF] -B build
```

## Build Target'ı Belirleme (Opsiyon 1)

Eğer özel olarak bir target belirtmezseniz, CMake bütün tanımlı target'ları oluşturur.
Spesifik olarak bir target belirlemek için aşağıdaki komutu izleyebilirsiniz.

```bash
cmake --build build --target TemplateLibrary_Executable     # Ornek 1
cmake --build build --target TemplateLibrary_SharedLibrary  # Ornek 2
```

*TemplateLibrary_Executable* örnek bir target, buna bağımlı target'lar da oluşturuluyor olacak.

## Build Target'ı Belirleme (Opsiyon 2)

CMake ile build komutu yanında zaten oluşturulmuş olan (ör. makefile) dosyalarından da ilgili target'ı build edebilirsiniz. Örneğin:

```bash
cd build
make TemplateLibrary_Executable
```

## Uygulamayı Çalıştırma

Proje ve ilgili target için gerekli dosyaları ayarlayıp, projeyi oluşturduktan sonra sıra elbette yazılımları çalıştırmaya gelir. 
Eğer bu şablon projesini kullanıyorsanız, ilgili dosyalara preset tipine göre */build/preset-ismi/app* altından ulaşabilirsiniz.

```bash
cd build/debug-gcc/app
./cmake-template-app
```

## Farklı CMake Bağlama Tipleri

```cmake
target_link_libraries(A PUBLIC fmt)
target_link_libraries(B PRIVATE spdlog)
```

```cmake
target_link_libraries(C PUBLIC/PRIVATE A)
target_link_libraries(C PUBLIC/PRIVATE B)
```


### PUBLIC

*PUBLIC* olarak işaretlenen satır için, eğer A fmt'yi implementasyonunda kullanıyorsa, fmt aynı zaman A'nın public API'sinde de kullanılıyor. Bu sebeple de, C'de fmt'yi kullanabilir.

### PRIVATE

*PRIVATE* olarak işaretlenen satır için ise, B spdlog'u PRIVATE olarak implementasyonunda kullanıyor ama bu B'nin public API'sinde yok ve C için de bunu eklemeye gerek yok. Eğer C kullanmak istiyor ise, bunu ayrıca eklemeli.

### INTERFACE

```cmake
add_library(D INTERFACE)
target_include_directories(D INTERFACE {CMAKE_CURRENT_SOURCE_DIR}/include)
```

Bu opsiyon genel olarak sadece başlık dosyasından oluşan kütüphaneler için kullanılmaktadır.

.-----------.------------------.----------------.
|           | Linked by target | Link interface |
:-----------+------------------+----------------:
| PUBLIC    |        X         |        X       |
:-----------+------------------+----------------:
| PRIVATE   |        X         |                |
:-----------+------------------+----------------:
| INTERFACE |                  |        X       |
'-----------'------------------'----------------'

Hedefe göre bağlı (Linked by target): Hedef kaynaklara dahil edilen kütüphaneler (kütüphaneyi bağlayan projelere bağımlılık değil).
Bağlantı arayüzü (Link interface)   : Hedef genel başlık dosyalarında bulunan kütüphaneler (kütüphaneyi bağlayan projelere bağımlılıklar).

## Farklı Kütüphane Tipleri

### Dinamik/Paylaşımlı Kütüphane

Paylaşımlı/Dinamik kütüphaneler, her bir program tarafından kullanılan ortak kodları bünyesinde barındırarak, çalıştırılabilir dosyaların boyutlarını küçük tutmak için kullanılan yaklaşımdır. 
Bunun yanında, asıl uygulamayı bir daha derlemeden, dinamik kütüphane ile sunulan kabiliyetlere yönelik güncellemeleri, uygulamları derlemeden kullanabilirsiniz.
Burada dinamik kütüphaneye yönelik yönetim genel olarak işletim sistemi tarafından kotarılır.

### Statik Kütüphaneler

Statik kütüphaneler direk çalıştırılabilir uygulamalara dahil edilmesinden ötürü, boyutun büyümesine sebep olsalar da, ilave kütüphane taşınmasına ihtiyaç olmaz. Ayrıca çalışma zamanında da ilave bir masraf ya da performans kaybı yaşatmaz. Ayrıca bir çok derleyici/bağlayıcı, kullanılmayan fonksiyon ve kabiliyetleri nihai çalıştırılabilir dosyaya dahil etmez.

## Paralel Derleme Oluşturma

-jN argümanı kullanılabilir.

## x86 

```shell
cmake -B build -DCMAKE_TOOLCHAIN_FILE=cmake/toolchains/x86-64-native-toolchain.cmake
cmake --build build -j8
```
