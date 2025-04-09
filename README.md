# ✨ MinimalAccount — ERC-4337 Smart Contract Wallet

A lightweight and secure **smart contract wallet** implementation, fully compatible with [ERC-4337 (Account Abstraction)](https://eips.ethereum.org/EIPS/eip-4337). This project provides a minimal, gas-efficient contract wallet that integrates seamlessly with the `EntryPoint` contract and validates signatures based on `Ownable`.

## 🚀 Features

- 🔐 **Signature validation** using EIP-191 (`ECDSA`)
- 🔄 **Modular function execution** via `execute()` for meta-transactions
- 💰 Auto-top-up support with `missingAccountFunds`
- 🧱 Built to support the official [account-abstraction SDK](https://github.com/eth-infinitism/account-abstraction)
- ✅ Fully compatible with `EntryPoint.handleOps`

---

## 🧠 How It Works

`MinimalAccount` implements the `IAccount` interface and acts as a smart contract wallet that:

- Uses `msg.sender == owner` or `EntryPoint` for access control
- Validates `UserOperation` signatures based on the wallet owner's address
- Can receive native tokens and execute arbitrary calls

---

## 📂 Project Structure

```bash
.
├── lib
│   └── account-abstraction     # ERC-4337 core contracts (as a git submodule or clone)
├── script
│   ├── SendPackedUserOp.s.sol  # Script (to be implemented) for testing UserOperations
│   └── ...
├── src
│   └── MinimalAccount.sol      # The smart contract wallet
├── foundry.toml                # Foundry config
└── README.md                   # You are here 😎
```

## 🛠️ Usage
**🧪 Testing Locally (with Foundry)**

1. **Install dependencies**
```bash
git clone https://github.com/Febri-An/foundry-account-abstraction.git
cd foundry-account-abstraction
make install
```
2. **Compile**
```bash
forge build
```
3. **Deploy or Run Script**
    (Assuming you write logic in `SendPackedUserOp.s.sol`)
    _please take a look first!_
```bash
forge script script/SendPackedUserOp.s.sol --rpc-url <YOUR_RPC_URL> --private-key <PRIVATE_KEY> --broadcast
```

## 📌 TODO
- Implement `SendPackedUserOp.s.sol` to simulate sending a `UserOperation`
- Integrate with a bundler (like StackUp or Pimlico)

## 💡 Inspirations
This contract was inspired by:
    **eth-infinitism/account-abstraction**

## 🧑‍💻 Author

Built with ☕, 💻, and 💡 by **Febri Nirwana**
Open to feedback and contributions!

## 📜 License
```yaml
Licensed under the MIT License.
```