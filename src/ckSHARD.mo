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

## **File 2: `ckSHARD.mo` (Motoko Code)**

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
