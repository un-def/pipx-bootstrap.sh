#!/bin/sh
tmp=$(mktemp -d)
cleanup() {
  rm -r "${tmp}"
  trap - EXIT
}
trap cleanup EXIT INT QUIT TERM HUP

die() {
  test "${#}" -ne 0 && echo "${@}"
  exit 1
}

python=${PYTHON_BIN:-python3}

python_version_ok=$("${python}" -c 'import sys; print(sys.version_info >= (3, 6))') || die
test "${python_version_ok}" = 'True' || die 'python 3.6+ is required'

"${python}" -m pip download --only-binary :all: --dest "${tmp}" pipx || die
pipx=$(find "${tmp}" -name 'pipx-*' -printf %f)
test -n "${pipx}" || die 'pipx wheel not found'

PYTHONPATH=$(find "${tmp}" -type f -printf :%p | cut -c 2-)
export PYTHONPATH
"${python}" "${tmp}/${pipx}/pipx" install pipx "${@}"
