#!/bin/bash

SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE[0]}); pwd)
METHOD=${1:-dry-run}

cd $SCRIPT_DIR/../src/fib-wasm
wasm-pack build --release

cd $SCRIPT_DIR/../third_party/zkWasm
export RUST_LOG=info

# 100
cargo run --release -- -k 22 --function zkmain --wasm $SCRIPT_DIR/../src/fib-wasm/pkg/fib_wasm_bg.wasm $METHOD --public 3314859971:i64
# 10000, you will need to update src/fib-wasm/src/lib.rs:Ln13,Col21
# cargo run --release -- -k 22 --function zkmain --wasm $SCRIPT_DIR/../src/fib-wasm/pkg/fib_wasm_bg.wasm $METHOD --public 1242044891:i64
# 100000, you will need to update src/fib-wasm/src/lib.rs:Ln13,Col21
# cargo run --release -- -k 22 --function zkmain --wasm $SCRIPT_DIR/../src/fib-wasm/pkg/fib_wasm_bg.wasm $METHOD --public 873876091:i64

# cuda
# 100
# cargo run --release --features cuda -- -k 22 --function zkmain --wasm $SCRIPT_DIR/../src/fib-wasm/pkg/fib_wasm_bg.wasm $METHOD --public 3314859971:i64
# 10000, you will need to update src/fib-wasm/src/lib.rs:Ln13,Col21
# cargo run --release --features cuda -- -k 22 --function zkmain --wasm $SCRIPT_DIR/../src/fib-wasm/pkg/fib_wasm_bg.wasm $METHOD --public 1242044891:i64
# 100000, you will need to update src/fib-wasm/src/lib.rs:Ln13,Col21
# cargo run --release --features cuda -- -k 22 --function zkmain --wasm $SCRIPT_DIR/../src/fib-wasm/pkg/fib_wasm_bg.wasm $METHOD --public 873876091:i64