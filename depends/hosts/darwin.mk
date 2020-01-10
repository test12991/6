OSX_MIN_VERSION=10.12
OSX_SDK_VERSION=10.15.1
XCODE_VERSION=11.3.1
XCODE_BUILD_ID=11C505
LD64_VERSION=530

OSX_SDK=$(SDK_PATH)/Xcode-$(XCODE_VERSION)-$(XCODE_BUILD_ID)-extracted-SDK-with-libcxx-headers

# When cross-compiling for Darwin using Clang, -mlinker-version must be passed to
# ensure that modern linker features are enabled.
darwin_CC=clang -target $(host) -mmacosx-version-min=$(OSX_MIN_VERSION) --sysroot $(OSX_SDK) -mlinker-version=$(LD64_VERSION) -B$(build_prefix)/bin
darwin_CXX=clang++ -target $(host) -mmacosx-version-min=$(OSX_MIN_VERSION) --sysroot $(OSX_SDK) -stdlib=libc++ -mlinker-version=$(LD64_VERSION) -B$(build_prefix)/bin

darwin_CFLAGS=-pipe
darwin_CXXFLAGS=$(darwin_CFLAGS)

darwin_release_CFLAGS=-O2
darwin_release_CXXFLAGS=$(darwin_release_CFLAGS)

darwin_debug_CFLAGS=-O1
darwin_debug_CXXFLAGS=$(darwin_debug_CFLAGS)

darwin_native_binutils=native_cctools
ifeq ($(strip $(FORCE_USE_SYSTEM_CLANG)),)
darwin_native_toolchain=native_cctools
<<<<<<< HEAD
=======
else
darwin_native_toolchain=
endif

darwin_cmake_system=Darwin
>>>>>>> c9c572a36... depends: Allow building with system clang
