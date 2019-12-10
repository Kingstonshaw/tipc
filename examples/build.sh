#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

for f in *.tip; do
    ../build/tipc -d "$f"
    llvm-dis-7 "$f.bc"
    clang-7 ../intrinsics/tip_intrinsics.bc "$f.bc" -o "$f.bin"
done
