# 🔐 ZeroLend Token — Testing Suite

This repository contains the test suite for the [ZeroLend](https://zerolend.xyz) token contract, built with [Foundry](https://book.getfoundry.sh/) for blazing-fast testing and fuzzing.

---

## 📄 Contract Overview

The `ZeroLend` token is an ERC20-compatible smart contract with additional access control and security layers, including:

- **Role-based access control** (Governance, Minter, Risk Manager)
- **Blacklisting** and **whitelisting**
- **Pause/resume functionality**
- **Bootstrap mode** for launch phase safety
- ERC20 extensions: `Burnable`, `Permit`, `AccessControlEnumerable`

---

## 🧪 Tests

Tests are written in Solidity using Foundry.

### ✨ Features Covered

- ✅ Minting (with time delay logic)
- ✅ Blacklisting & whitelisting enforcement
- ✅ Transfer restrictions during `bootstrap` mode
- ✅ Role-based access control
- ✅ Revert scenarios (`"you blacklisted"`, `"you paused"`, `"you pleb"`, etc.)

---

## 🚀 Getting Started

### 1. Install Foundry

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```
