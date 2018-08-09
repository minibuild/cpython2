#include "../../py_version.inc"

import os.path

module_type = 'executable'
module_name = 'pyrun{}'.format(BUNDLED_PYTHON_VERSION)

if BUILDSYS_TARGET_PLATFORM == 'macosx':
    public_name = '{}-macosx'.format(module_name)
elif BUILDSYS_TARGET_PLATFORM == 'windows':
    if BUILDSYS_TOOLSET_NAME == 'gcc':
        public_name = '{}-mingw-{}'.format(module_name, BUILDSYS_TARGET_ARCH)
    elif BUILDSYS_TOOLSET_NAME == 'msvs':
        public_name = '{}-msvs{}-{}'.format(module_name, BUILDSYS_TOOLSET_VERSION, BUILDSYS_TARGET_ARCH)
if not public_name:
    public_name = '{}-{}-{}'.format(module_name, BUILDSYS_TARGET_PLATFORM, BUILDSYS_TARGET_ARCH) 

build_list = ['interpreter.c']
win_stack_size = 2000000
winrc_file = "${@project_root}/cpython2/python.rc"

include_dir_list = [
  '../../vendor/Include',
]

if os.path.isdir(os.path.join(BUILDSYS_PROJECT_ROOT_DIRNAME, 'pyffi')):
    lib_list += ['${@project_root}/pyffi']
elif os.path.isdir(os.path.join(BUILDSYS_PROJECT_ROOT_DIRNAME, 'libffi')):
    lib_list += ['${@project_root}/libffi']

lib_list += [
  '../core/static',
  '../stdlib/static',
  '../modules/ctypes/static',
  '../modules/elementtree/static',
  '../modules/hashlib/static',
  '../modules/multiprocessing/static',
  '../modules/socket/static',
  '../modules/ssl/static',
  '../modules/sqlite/static',
  '../modules/pyexpat/static',
  '../modules/select/static',
  '../modules/unicodedata/static',
  '../modules/bz2/static',
  '../modules/crypt/static',
  '${@project_root}/zlib',
  '${@project_root}/openssl/build/crypto_static',
  '${@project_root}/openssl/build/ssl_static',
  '${@project_root}/openssl_posix_crypt/contrib/static',
  '${@project_root}/sqlcipher/src',
  '${@project_root}/bzip2',
]

explicit_depends = ['resource']
zip_section = '${@project_output}/obj/pymonolith_zrc/noarch/zsection.zip'

definitions_windows = ['Py_NO_ENABLE_SHARED']
prebuilt_lib_list_windows = ['advapi32', 'user32', 'shell32', 'ole32', 'oleaut32', 'crypt32', 'ws2_32']
prebuilt_lib_list_linux = ['dl', 'pthread', 'util', 'nsl']
macosx_framework_list = ['CoreFoundation', 'Security', 'SystemConfiguration']
