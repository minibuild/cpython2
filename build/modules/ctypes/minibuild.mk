#include "../../../pymod_shared.inc"

import os.path

module_type = 'lib-shared'
module_name = 'python{}_ctypes'.format(BUNDLED_PYTHON_VERSION)

build_list = [
  'callbacks.c',
  'callproc.c',
  'cfield.c',
  'malloc_closure.c',
  'stgdict.c',
  '_ctypes.c',
]

export = ['init_ctypes']

src_search_dir_list = [
  '../../../vendor/Modules/_ctypes'
]

if os.path.isdir(os.path.join(BUILDSYS_PROJECT_ROOT_DIRNAME, 'pyffi')):
    include_dir_list += ['${@project_root}/pyffi/include']
    lib_list += ['${@project_root}/pyffi']
elif os.path.isdir(os.path.join(BUILDSYS_PROJECT_ROOT_DIRNAME, 'libffi')):
    include_dir_list += ['${@project_root}/libffi/include']
    lib_list += ['${@project_root}/libffi']

include_dir_list += [
  '../../../vendor/Include',
]

lib_list += [
  '../../core',
]

prebuilt_lib_list_linux = ['dl']
prebuilt_lib_list_windows = ['ole32','oleaut32']
