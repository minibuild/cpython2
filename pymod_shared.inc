#include "py_version.inc"

definitions += ['Py_ENABLE_SHARED']

macosx_install_name_options = '-change libpython{0}.so @loader_path/../libpython{0}.so'.format(BUNDLED_PYTHON_VERSION)

winrc_file = "${@project_root}/cpython2/python_nt.rc"
