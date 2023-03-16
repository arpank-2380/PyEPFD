ENV_BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export PATH=$ENV_BASE_DIR/utils/qbox_utils:$PATH
export PYTHONPATH=$ENV_BASE_DIR:$PYTHONPATH
export PYEPFD_ROOT=$ENV_BASE_DIR
unset ENV_BASE_DIR
