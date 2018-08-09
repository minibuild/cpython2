#include "../../../pymod_shared.inc"

module_type = 'lib-shared'
module_name = 'python{}_crypt'.format(BUNDLED_PYTHON_VERSION)

build_list = [
  'cryptmodule.c',
]

export = ['init_crypt']

include_dir_list += [
  '../../../vendor/Include',
  '${@project_root}/openssl_posix_crypt',
  '${@project_root}/openssl/include',
]

lib_list = [
  '../../core',
  '${@project_root}/openssl/build/crypto_static',
  '${@project_root}/openssl_posix_crypt/contrib/static',
  '${@project_root}/zlib',
]

prebuilt_lib_list_windows = ['crypt32','ws2_32', 'advapi32', 'user32']
prebuilt_lib_list_linux = ['dl', 'pthread']
