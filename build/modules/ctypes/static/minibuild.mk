#include "../../../../py_version.inc"

import os.path

module_type = 'lib-static'
module_name = 'python{}_ctypes_static'.format(BUNDLED_PYTHON_VERSION)

build_list = [
  'callbacks.c',
  'callproc.c',
  'cfield.c',
  'malloc_closure.c',
  'stgdict.c',
  '_ctypes.c',
]

src_search_dir_list = [
  '../../../../vendor/Modules/_ctypes'
]

if os.path.isdir(os.path.join(BUILDSYS_PROJECT_ROOT_DIRNAME, 'pyffi')):
    include_dir_list += ['${@project_root}/pyffi/include']
elif os.path.isdir(os.path.join(BUILDSYS_PROJECT_ROOT_DIRNAME, 'libffi')):
    include_dir_list += ['${@project_root}/libffi/include']

include_dir_list += [
  '../../../../vendor/Include',
]
