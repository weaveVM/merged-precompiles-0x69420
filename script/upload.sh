#!/bin/bash
cast_output=$(cast call 0x9fb0F63B569f9FD8718Bbb2856a4b6F2458C2d70 "upload_to_arweave(string)" "hello world!" --rpc-url https://testnet-rpc.wvm.dev)

data_hex=$(echo "$cast_output" | cut -c 129-214)

# Decode the hex data to get the Arweave transaction hash
tx_hash=$(echo "$data_hex" | xxd -r -p)

# Generate the viewblock.io URL using the extracted transaction hash
viewblock_url="https://viewblock.io/arweave/tx/$tx_hash"

# Output the URL
echo "$viewblock_url"
