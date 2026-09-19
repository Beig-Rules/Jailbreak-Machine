# Jailbreak Machine

**One-command virtual jailbroken iPhone on your Mac — no hardware required**  
**یک دستور برای بوت کردن آیفون جیلبریک‌شده مجازی روی مک — بدون نیاز به سخت‌افزار واقعی**

---

## English

### What is Jailbreak Machine?

**Jailbreak Machine** is the most complete and practical documentation + usability package for running a real virtual jailbroken iPhone on Apple Silicon Macs.

It is built on top of the powerful original technology from [Lakr233/vphone-cli](https://github.com/Lakr233/vphone-cli) and focuses on making that technology:

- Easy to understand
- Safe to set up
- Clear from zero to a working jailbroken VM
- Professionally documented in both English and Persian

You get a disposable virtual iPhone with selectable jailbreak depth (including full jailbreak + Sileo + TrollStore), SSH/VNC access, and zero risk to any physical device.

### What this repository gives you

- Complete bilingual guides (English + Persian)
- Clear recommended path from zero to first boot
- Variant recommendations
- Strong troubleshooting
- Safety notes and checklists
- Host preflight + helper scripts
- Architecture and advanced usage docs
- Honest attribution to the original authors

### Recommended Workflow (Best Path)

**1. Read the guides here first** (especially Quick Start + Safety + Troubleshooting)

**2. Build the actual tool from upstream** (this is where the real binary lives):

```bash
git clone --recurse-submodules https://github.com/Lakr233/vphone-cli.git
cd vphone-cli
./scripts/setup_tools.sh
./scripts/build.sh
```

**3. Create and launch a jailbroken VM**

```bash
vphone-cli vm create myphone -V jb
vphone-cli vm launch myphone
```

**4. Connect**

```bash
ssh -p 22222 mobile@<vm-ip>     # password: alpine
```

VNC: `vnc://<vm-ip>:5901`

### Requirements

- Apple Silicon Mac (physical, not nested)
- macOS 15+
- Xcode
- SIP/AMFI relaxation (see docs)
- Homebrew dependencies listed in the guides

### Patch Variants

| Variant | Recommendation | Result |
|---------|----------------|--------|
| stock / light | Only if you need near-stock | Lowest bypass |
| dev | Development | Medium |
| **jb** | **Start here** | Full jailbreak + Sileo + TrollStore |
| exp | Advanced research only | Maximum patches + anti-VM research |

### Documentation Map

| File | Purpose |
|------|---------|
| [docs/QUICKSTART.md](docs/QUICKSTART.md) | Fastest path to a running VM |
| [docs/QUICKSTART.fa.md](docs/QUICKSTART.fa.md) | همان راهنما به فارسی |
| [docs/VARIANTS.md](docs/VARIANTS.md) | Which variant to choose |
| [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) | Common failures and fixes |
| [docs/TROUBLESHOOTING.fa.md](docs/TROUBLESHOOTING.fa.md) | رفع مشکلات به فارسی |
| [docs/SAFETY.md](docs/SAFETY.md) | Host security & responsibility |
| [docs/CHECKLIST.md](docs/CHECKLIST.md) | Pre-flight checklist |
| [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) | How the system works |
| [docs/ADVANCED.md](docs/ADVANCED.md) | Manual pipeline, clone, export, tuning |
| [docs/FAQ.md](docs/FAQ.md) | Frequent questions |
| [NOTICE.md](NOTICE.md) | Upstream relationship |

### Helper Scripts

```bash
./scripts/host-preflight.sh          # basic host checks
./scripts/recommended-create.sh      # opinionated vm create wrapper
```

---

## فارسی

### Jailbreak Machine چیست؟

**Jailbreak Machine** کامل‌ترین و کاربردی‌ترین بسته مستندات و تجربه کاربری برای اجرای آیفون جیلبریک‌شده مجازی روی مک‌های Apple Silicon است.

این پروژه روی فناوری قدرتمند اصلی [Lakr233/vphone-cli](https://github.com/Lakr233/vphone-cli) ساخته شده و تمرکز آن روی این است که آن فناوری:

- قابل فهم باشد
- با خیال راحت راه‌اندازی شود
- از صفر تا VM جیلبریک‌شده شفاف باشد
- به صورت حرفه‌ای به دو زبان فارسی و انگلیسی مستند شود

شما یک آیفون مجازی یک‌بارمصرف با عمق جیلبریک قابل انتخاب (از جمله جیلبریک کامل + Sileo + TrollStore)، دسترسی SSH/VNC و بدون هیچ خطری برای دستگاه واقعی دریافت می‌کنید.

### مسیر پیشنهادی (بهترین روش)

**۱. اول راهنماهای همین مخزن را بخوانید**

**۲. ابزار اصلی را از upstream بیلد کنید:**

```bash
git clone --recurse-submodules https://github.com/Lakr233/vphone-cli.git
cd vphone-cli
./scripts/setup_tools.sh
./scripts/build.sh
```

**۳. VM جیلبریک‌شده بسازید و اجرا کنید:**

```bash
vphone-cli vm create myphone -V jb
vphone-cli vm launch myphone
```

**۴. وصل شوید:**

```bash
ssh -p 22222 mobile@<vm-ip>     # رمز: alpine
```

### واریانت پیشنهادی

برای اکثر کاربران: **`-V jb`**

---

## Project Structure

```
Jailbreak-Machine/
├── README.md
├── LICENSE
├── NOTICE.md
├── docs/
│   ├── QUICKSTART.md / QUICKSTART.fa.md
│   ├── VARIANTS.md
│   ├── TROUBLESHOOTING.md / TROUBLESHOOTING.fa.md
│   ├── SAFETY.md
│   ├── CHECKLIST.md
│   ├── ARCHITECTURE.md
│   ├── ADVANCED.md
│   ├── FAQ.md
│   └── UPSTREAM.md
└── scripts/
    ├── host-preflight.sh
    └── recommended-create.sh
```

---

## Attribution & Copyright

**Core technology:** [Lakr233/vphone-cli](https://github.com/Lakr233/vphone-cli)  
All credit for the Virtualization.framework integration, patching pipeline, jailbreak variants, and original research belongs to Lakr233 and contributors.

**This package (Jailbreak Machine)**  
Copyright © 2026 Beig (Beig-Rules)  
MIT License

This repository exists to make the original powerful tool dramatically more usable, clearer, and safer to adopt — while keeping full and visible credit to the upstream authors.

---

**کامل‌ترین لایه مستندات و تجربه کاربری برای آیفون جیلبریک‌شده مجازی**  
**The most complete documentation and usability layer for virtual jailbroken iPhones**
