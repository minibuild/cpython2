#include "../../../pymod_shared.inc"

module_type = 'lib-shared'
module_name = 'python{}unicodedata'.format(BUNDLED_PYTHON_VERSION)

build_list = [
  'unicodedata.c',
]

export = ['initunicodedata']

src_search_dir_list = [
  '../../../vendor/Modules',
]

include_dir_list += [
  '../../../vendor/Include',
]

lib_list = [
  '../../core',
]
