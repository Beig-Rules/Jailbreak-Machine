# Troubleshooting — Jailbreak Machine

## zsh: killed
SIP/AMFI is still enforcing. Re-do the Recovery + nvram steps and reboot.

## Virtualization is not available on this hardware
Your Mac is itself running inside a VM. Nested virtualization for this PV=3 guest is not supported. Use a physical Apple Silicon Mac.

## Stuck on “Press home to continue”
Connect with VNC (`vnc://<ip>:5901`) and simulate the Home button with a right-click / two-finger click.

## Large apps crash with CODESIGNING / Invalid Page
Known limitation with very large Mach-O binaries (TikTok, WeChat, Roblox, etc.). Smaller apps usually work fine.

## System apps fail to install
During the initial iOS setup wizard, do **not** choose Japan or EU regions. Choose United States (or similar).

## Network problems when host VPN is active
Host VPN can break guest networking. Temporarily disable the host VPN.

## CFW install hangs on ldid
Update `ldid-procursus` from HEAD if you hit the known zero-value entitlement bug:
```bash
brew install --HEAD ldid-procursus
brew link --overwrite ldid-procursus
```
