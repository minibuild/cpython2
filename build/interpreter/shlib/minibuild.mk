#include "../../../py_version.inc"

module_type = 'executable'
module_name = 'python{}_python.bin'.format(BUNDLED_PYTHON_VERSION)

include_dir_list += [
  '../../../vendor/Include',
]

build_list = ['interpreter.c']

lib_list = [
  '../../core',
]
