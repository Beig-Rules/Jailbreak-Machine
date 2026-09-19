# Architecture Overview — Jailbreak Machine

## High-level flow

```
Host (macOS 15+ Apple Silicon)
        │
        ▼
vphone-cli (Swift CLI)
        │
        ├── Download IPSW (iPhone + cloudOS)
        ├── Apply selected patch variant
        ├── DFU-style restore into VM bundle
        ├── Install Custom Firmware (CFW)
        └── First boot via Virtualization.framework
                │
                ▼
        Virtual iPhone (guest)
                │
                ├── SSH (port 22222)
                ├── VNC (port 5901)
                └── Optional control socket
```

## Main components

| Component | Role |
|-----------|------|
| Virtualization.framework | Official Apple hypervisor used to run the guest |
| IPSW + cloudOS | Base firmware images |
| Patch variants | Different depths of security bypass / jailbreak |
| CFW install | Lays jailbreak packages (Sileo, TrollStore, etc.) |
| vphoned / host tools | Guest-side and host-side helpers |
| ~/.vphone/ | Persistent data (VMs, caches, debs) |

## Design goals of this upgraded package

- Make the powerful upstream technology actually usable by more people
- Provide clear, bilingual, step-by-step guidance
- Reduce setup failures through better troubleshooting and checklists
- Keep full and honest attribution to the original authors
