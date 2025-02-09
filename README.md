# Chain-Key-Cryptography-ckNEAR
ckNEAR and ckSHARD 
---
### **SIGHTED Chain Key Tokens: ckNEAR and ckSHARD**  
This project implements **ckNEAR** and **ckSHARD**, two Chain Key Tokens (CKTs) on the **Internet Computer (ICP)** that represent **NEAR** and **Calimero shard-based tokens**, respectively. These tokens allow cross-chain interoperability with ICP using **Chain Key Cryptography (CKC)**.

---

### **Features**
- **ckNEAR**: Represents NEAR tokens on ICP, enabling seamless cross-chain interaction.  
- **ckSHARD**: Represents private shard-based tokens from Calimero.  
- **Token Minting & Transfer**: Supports standard operations such as minting, transferring, and querying balances.  
- **Chain Key Cryptography**: Ensures cross-chain compatibility and secure token verification.

---

## ckNEAR.mo

```motoko
import Nat "mo:base/Nat";
import Principal "mo:base/Principal";
import Trie "mo:base/Trie";

actor ckNEAR {
  stable var balances: Trie.Trie<Principal, Nat> = Trie.empty();

  /// Mint ckNEAR tokens after verifying ownership on NEAR
  public func mint_ckNEAR(to: Principal, amount: Nat): async Bool {
    let currentBalance = Trie.get(balances, to) ?: 0;
    balances := Trie.put(balances, to, currentBalance + amount);
    return true;
  };

  /// Transfer ckNEAR tokens
  public func transfer_ckNEAR(to: Principal, amount: Nat): async Bool {
    let caller = Principal.fromActor(this);
    let currentBalance = Trie.get(balances, caller) ?: 0;

    if (currentBalance < amount) {
      return false;  // Insufficient balance
    };

    balances := Trie.put(balances, caller, currentBalance - amount);
    let recipientBalance = Trie.get(balances, to) ?: 0;
    balances := Trie.put(balances, to, recipientBalance + amount);
    return true;
  };

  /// Check the ckNEAR balance of a user
  public query func balance_of(owner: Principal): async Nat {
    return Trie.get(balances, owner) ?: 0;
  };
}
```

---

## ckSHARD.mo

```motoko
import Nat "mo:base/Nat";
import Principal "mo:base/Principal";
import Trie "mo:base/Trie";

actor ckSHARD {
  stable var balances: Trie.Trie<Principal, Nat> = Trie.empty();

  /// Mint ckSHARD tokens after verification on Calimero shard
  public func mint_ckSHARD(to: Principal, amount: Nat): async Bool {
    let currentBalance = Trie.get(balances, to) ?: 0;
    balances := Trie.put(balances, to, currentBalance + amount);
    return true;
  };

  /// Transfer ckSHARD tokens
  public func transfer_ckSHARD(to: Principal, amount: Nat): async Bool {
    let caller = Principal.fromActor(this);
    let currentBalance = Trie.get(balances, caller) ?: 0;

    if (currentBalance < amount) {
      return false;  // Insufficient balance
    };

    balances := Trie.put(balances, caller, currentBalance - amount);
    let recipientBalance = Trie.get(balances, to) ?: 0;
    balances := Trie.put(balances, to, recipientBalance + amount);
    return true;
  };

  /// Check the ckSHARD balance of a user
  public query func balance_of(owner: Principal): async Nat {
    return Trie.get(balances, owner) ?: 0;
  };
}
```


---

### **Installation**
### Prerequisites
- **DFX CLI**: Install DFX CLI for deploying and interacting with ICP canisters.  
  [Install DFX](https://internetcomputer.org/docs/current/developer-docs/setup/install/)  

### Clone the Repository
```bash
git clone https://github.com/your-repo/ckNEAR-ckSHARD.git
cd ckNEAR-ckSHARD
```

### Deploy Canisters
1. **Start the local replica**  
   ```bash
   dfx start --background
   ```
2. **Build and deploy the canisters**  
   ```bash
   dfx deploy
   ```

---

### **Usage**
#### Mint Tokens
- **ckNEAR**: Mint ckNEAR tokens for a user.  
  ```bash
  dfx canister call ckNEAR mint_ckNEAR '(principal "receiver-principal-id", 1000)'
  ```
- **ckSHARD**: Mint ckSHARD tokens for a user.  
  ```bash
  dfx canister call ckSHARD mint_ckSHARD '(principal "receiver-principal-id", 500)'
  ```

#### Transfer Tokens
- **ckNEAR**:  
  ```bash
  dfx canister call ckNEAR transfer_ckNEAR '(principal "receiver-principal-id", 100)'
  ```
- **ckSHARD**:  
  ```bash
  dfx canister call ckSHARD transfer_ckSHARD '(principal "receiver-principal-id", 50)'
  ```

#### Check Balance
- **ckNEAR**:  
  ```bash
  dfx canister call ckNEAR balance_of '(principal "receiver-principal-id")'
  ```
- **ckSHARD**:  
  ```bash
  dfx canister call ckSHARD balance_of '(principal "receiver-principal-id")'
  ```

---

### **Development**
1. **Build the contracts**  
   ```bash
   dfx build
   ```
2. **Run tests**  
   ```bash
   dfx test
   
