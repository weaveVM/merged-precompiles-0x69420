#!/bin/bash
cast_output=$(cast call 0x9fb0F63B569f9FD8718Bbb2856a4b6F2458C2d70 "upload_to_arweave(string)" "Hello, world!" --rpc-url https://testnet-rpc.wvm.dev)

# Add debug output to see the exact string we're working with
echo "Raw output: $cast_output"

# Use grep to extract the hex string more reliably
data_hex=$(echo "$cast_output" | grep -o '0x[0-9a-fA-F]\+' | tail -n 1 | sed 's/^0x//')

# Add debug output for the extracted hex
echo "Extracted hex: $data_hex"

# Decode the hex data to get the Arweave transaction hash
tx_hash=$(echo "$data_hex" | xxd -r -p)

# Generate the viewblock.io URL using the extracted transaction hash
viewblock_url="https://viewblock.io/arweave/tx/$(echo "$tx_hash" | tr -d ' +')"

echo "The transaction will take ~5-10 minutes to confirm. View it here: $viewblock_url"
