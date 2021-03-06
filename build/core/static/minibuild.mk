#include "../../../py_version.inc"
#include "../build_list.inc"

module_type = 'lib-static'
module_name = 'python{}_core_static'.format(BUNDLED_PYTHON_VERSION)

include_dir_list += [
  '../../../vendor/Include',
  '../../../vendor/Python',
  '${@project_root}/zlib/include',
]

src_search_dir_list += [
  '..',
  '../../../vendor/Python',
  '../../../vendor/Parser',
  '../../../vendor/Objects',
  '../../../vendor/Modules',
  '../../../vendor/Modules/cjkcodecs',
  '../../../vendor/Modules/_io',
  '../../../vendor/PC',
  '../../../vendor/Mac/Modules',
]

definitions = ['Py_BUILD_CORE', 'NDEBUG']
definitions_windows = ['PLATFORM="win32"', 'Py_NO_ENABLE_SHARED']
definitions_linux = ['PLATFORM="linux2"']
definitions_macosx = ['PLATFORM="darwin"']
