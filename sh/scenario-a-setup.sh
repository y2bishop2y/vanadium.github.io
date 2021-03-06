#
# Script @completer from content/tutorials/setup.md 
#
#----------------------------------------------------------------------#  Start 1
echo "Block 'envVars' (1/1 in completer) of content/tutorials/setup.md"
####
# If JIRI_ROOT or VANADIUM_RELEASE are not defined, set them to the default values
# from the installation instructions and hope for the best.

[ -z "${JIRI_ROOT}" ] && export JIRI_ROOT=${HOME}/vanadium
[ -z "${VANADIUM_RELEASE}" ] && export VANADIUM_RELEASE=${JIRI_ROOT}/release/go

# All files created by the tutorial will be placed in $V_TUT. It is a disposable
# workspace, easy to recreate.
export V_TUT=${V_TUT-$HOME/v23_tutorial}

# V_BIN is the location for Vanadium binaries.
export V_BIN=${VANADIUM_RELEASE}/bin

# Include the Vanadium binaries in the PATH.
export PATH=${V_BIN}:${PATH}

# For the shell doing the tutorials, GOPATH must include both Vanadium and the
# code created as a result of doing the tutorials. To avoid trouble with
# accumulation, $GOPATH is intentionally omitted from the right hand side (any
# existing value is ignored).
if [ -z "${V23_GOPATH}" ]; then
  export V23_GOPATH=`${JIRI_ROOT}/.jiri_root/scripts/jiri go env GOPATH`
fi
export GOPATH=${V_TUT}:${V23_GOPATH}

# HISTCONTROL set as follows excludes long file creation commands used in
# tutorials from your shell history.
HISTCONTROL=ignorespace

# A convenience for killing tutorial processes
function kill_tut_process() {
  eval local pid=\$$1
  if [ -n "$pid" ]; then
    kill $pid || true
    wait $pid || true
    eval unset $1
  fi
}
#----------------------------------------------------------------------#  End 1

 bash -euo pipefail <<'HANDLED_SCRIPT'
function handledTrouble() {
  echo " "
  echo "Unable to continue!"
  exit 1
}
trap handledTrouble INT TERM
#
# Script @completer from content/tutorials/setup.md 
#
#----------------------------------------------------------------------#  Start 1
echo "Block 'envVars' (1/1 in completer) of content/tutorials/setup.md"
####
# If JIRI_ROOT or VANADIUM_RELEASE are not defined, set them to the default values
# from the installation instructions and hope for the best.

[ -z "${JIRI_ROOT}" ] && export JIRI_ROOT=${HOME}/vanadium
[ -z "${VANADIUM_RELEASE}" ] && export VANADIUM_RELEASE=${JIRI_ROOT}/release/go

# All files created by the tutorial will be placed in $V_TUT. It is a disposable
# workspace, easy to recreate.
export V_TUT=${V_TUT-$HOME/v23_tutorial}

# V_BIN is the location for Vanadium binaries.
export V_BIN=${VANADIUM_RELEASE}/bin

# Include the Vanadium binaries in the PATH.
export PATH=${V_BIN}:${PATH}

# For the shell doing the tutorials, GOPATH must include both Vanadium and the
# code created as a result of doing the tutorials. To avoid trouble with
# accumulation, $GOPATH is intentionally omitted from the right hand side (any
# existing value is ignored).
if [ -z "${V23_GOPATH}" ]; then
  export V23_GOPATH=`${JIRI_ROOT}/.jiri_root/scripts/jiri go env GOPATH`
fi
export GOPATH=${V_TUT}:${V23_GOPATH}

# HISTCONTROL set as follows excludes long file creation commands used in
# tutorials from your shell history.
HISTCONTROL=ignorespace

# A convenience for killing tutorial processes
function kill_tut_process() {
  eval local pid=\$$1
  if [ -n "$pid" ]; then
    kill $pid || true
    wait $pid || true
    eval unset $1
  fi
}
#----------------------------------------------------------------------#  End 1

#
# Script @completer from content/tutorials/checkup.md 
#
#----------------------------------------------------------------------#  Start 1
echo "Block 'checkTutorialAssets' (1/1 in completer) of content/tutorials/checkup.md"
####
function bad_vanadium() {
  echo '
  Per https://vanadium.github.io/installation/, either

    export JIRI_ROOT={your installation directory}

  or do a fresh install.';
  exit 1;
}

[ -z "$VANADIUM_RELEASE" ] && { echo 'The environment variable VANADIUM_RELEASE is not defined.'; bad_vanadium; }

[ -x "$VANADIUM_RELEASE/bin/principal" ] || { echo 'The file $VANADIUM_RELEASE/bin/principal does not exist or is not executable.'; bad_vanadium; }
#----------------------------------------------------------------------#  End 1

echo " "
echo "All done.  No errors."
HANDLED_SCRIPT
