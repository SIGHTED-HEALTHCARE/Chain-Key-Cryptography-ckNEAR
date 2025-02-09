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
   
