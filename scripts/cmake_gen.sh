set -e

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ "$SOURCE" != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
ROOT="$( cd "$DIR/.." && pwd)"
BUILD_DIR="$ROOT/build"

if [ ! -e $BUILD_DIR ]; then
    mkdir -p $BUILD_DIR
fi

pushd $BUILD_DIR >/dev/null

if [ "$(uname)" == "Darwin" ]; then
    cmake "$*" -G "Xcode" ..
else
    cmake "$*" -G "Ninja" ..
fi

popd >/dev/null
