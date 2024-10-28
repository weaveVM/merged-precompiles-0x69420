`// THIS CODE IS LIT 🌿🔥`

## About

This repository provides instructions on how to deploy your smart contract to the WVM testnet using Forge. It focuses on the Arweave precompiles (0x17, 0x18) to provide a tutorial on how to read and write data to Arweave from the EVM smart contract interface.

## Example deploy address for Merged Precompiles 0x69420

[0x9fb0F63B569f9FD8718Bbb2856a4b6F2458C2d70](https://explorer.wvm.dev/address/0x9fb0F63B569f9FD8718Bbb2856a4b6F2458C2d70)

## Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation) installed
- Your smart contract ready for deployment

## Deployment Steps

```sh
forge create src/MergedPrecompiles0x69420.sol:MergedPrecompiles0x69420 --rpc-url https://testnet-rpc.wvm.dev/ --private-key <private key starting with 0x...> --gas-price 10gwei
```

## Calling methods

```sh
cast call 0x9fb0F63B569f9FD8718Bbb2856a4b6F2458C2d70 "read_from_arweave(string)" <ArweaveTXID> --rpc-url https://testnet-rpc.wvm.dev

cast call 0x9fb0F63B569f9FD8718Bbb2856a4b6F2458C2d70 "upload_to_arweave(string)" <dataString> --rpc-url https://testnet-rpc.wvm.dev
```

Helper method example:

```sh
sh ./script/upload.sh
```
Feel free to substitute / change the contract address

## Notes

- The RPC URL `https://testnet-rpc.wvm.dev` is for the WVM testnet.
- Make sure you have sufficient test tokens from the [faucet](https://wvm.dev/faucet) for gas fees.

## Additional Resources

- [WVM Documentation](https://docs.wvm.dev)
- [Foundry Book](https://book.getfoundry.sh)
- [Arweave Precompiles docs](https://docs.wvm.dev/using-weavevm/weavevm-precompiles)

## License
This repository is licensed under the [MIT License](./LICENSE)
