# Quick Start — Jailbreak Machine

## One-page path to a running jailbroken VM

### 1. Host requirements
- Apple Silicon Mac
- macOS 15+
- Xcode installed

### 2. Relax SIP/AMFI (one-time)

Recovery Terminal:
```bash
csrutil disable
csrutil allow-research-guests enable
```

Then in macOS:
```bash
sudo nvram boot-args="amfi_get_out_of_my_way=1 -v"
```
Reboot.

### 3. Install dependencies
```bash
brew install python@3.13 aria2 wget gnu-tar openssl@3 ldid-procursus sshpass keystone cmake libusb ipsw zstd
```

### 4. Build
```bash
git clone --recurse-submodules https://github.com/Beig-Rules/Jailbreak-Machine.git
cd Jailbreak-Machine
./scripts/setup_tools.sh
./scripts/build.sh
```

### 5. Create + Launch
```bash
vphone-cli vm create myphone -V jb
vphone-cli vm launch myphone
```

### 6. Connect
```bash
ssh -p 22222 mobile@<vm-ip>     # password: alpine
```

VNC: `vnc://<vm-ip>:5901`
