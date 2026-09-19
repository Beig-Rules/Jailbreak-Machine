# Jailbreak Machine

**One-command virtual jailbroken iPhone on your Mac — no hardware required**  
**یک دستور برای بوت کردن آیفون جیلبریک‌شده مجازی روی مک — بدون نیاز به سخت‌افزار واقعی**

---

## English

### What is Jailbreak Machine?

**Jailbreak Machine** lets you spin up a real iOS device as a virtual machine on Apple Silicon Macs using Apple’s own Virtualization.framework.  
No physical iPhone is needed and there is zero risk to your real device.

A single command can handle the full pipeline:

**Download → Patch → DFU Restore → Custom Firmware Install → First Boot**

You choose how deep the bypass goes (from near-stock security all the way to a full jailbreak with Sileo + TrollStore pre-installed). After boot you can SSH straight into the device.

This project is a professional documentation, packaging and usability upgrade inspired by the excellent work of [Lakr233/vphone-cli](https://github.com/Lakr233/vphone-cli).

### Key Features

- One-command VM creation and launch
- Multiple patch variants (stock → full jailbreak)
- Automatic Sileo + TrollStore on the strongest variant
- SSH & VNC access
- Disposable — delete and recreate anytime
- Built on official Apple Virtualization.framework
- Apple Silicon + macOS 15+ only

### Requirements

**Host**
- Apple Silicon Mac
- macOS 15 (Sequoia) or later
- Xcode + iOS SDK
- SIP / AMFI relaxation (see detailed guide below)

**Dependencies (Homebrew)**
```bash
brew install python@3.13 aria2 wget gnu-tar openssl@3 ldid-procursus sshpass keystone cmake libusb ipsw zstd
```

### Quick Start (Recommended Path)

1. **Prepare the host** (one-time)
   - Follow the SIP/AMFI section carefully.
   - Install the Homebrew dependencies above.

2. **Get the tool**
   ```bash
   git clone --recurse-submodules https://github.com/Beig-Rules/Jailbreak-Machine.git
   cd Jailbreak-Machine
   ./scripts/setup_tools.sh
   ./scripts/build.sh
   ```

3. **Create a jailbroken VM**
   ```bash
   vphone-cli vm create myphone -V jb
   ```

4. **Launch it**
   ```bash
   vphone-cli vm launch myphone
   ```

5. **Connect**
   - SSH (jailbreak): `ssh -p 22222 mobile@<vm-ip>` (password: `alpine`)
   - VNC: `vnc://<vm-ip>:5901`

### Patch Variants

| Variant | Depth | What you get |
|---------|-------|--------------|
| stock / light | Lowest | Closest to normal iOS security |
| dev | Medium | Development-oriented patches |
| jb | High | Full jailbreak + Sileo + TrollStore on first boot |
| exp | Highest | Jailbreak + extra anti-VM-detection research patches |

**Recommendation:** Start with `-V jb` for most users who want a usable jailbroken environment.

### Detailed Step-by-Step Guide

#### 1. Host Preparation (SIP / AMFI)

You must relax SIP/AMFI so the tool can use the required private entitlements.

**Option A – Most permissive (recommended for first-time users)**

In Recovery mode (long-press power button → Terminal):

```bash
csrutil disable
csrutil allow-research-guests enable
```

Then reboot into macOS and run:

```bash
sudo nvram boot-args="amfi_get_out_of_my_way=1 -v"
```

Reboot again.

**Option B – Keep more of SIP enabled**

See the original project documentation for the `amfidont` allowlist method.

#### 2. Build

```bash
git clone --recurse-submodules https://github.com/Beig-Rules/Jailbreak-Machine.git
cd Jailbreak-Machine
./scripts/setup_tools.sh      # deps + toolchain + Python venv
./scripts/build.sh            # build & sign
```

#### 3. Create & Launch

```bash
# Full automated pipeline with jailbreak variant
vphone-cli vm create myphone -V jb

# Boot the VM
vphone-cli vm launch myphone
```

#### 4. Useful Management Commands

```bash
vphone-cli vm list
vphone-cli vm info myphone
vphone-cli vm clone myphone myphone-2
vphone-cli vm export myphone --out myphone.tzst
vphone-cli vm delete myphone
```

### Troubleshooting (Most Common Issues)

| Problem | Solution |
|---------|----------|
| `zsh: killed ./vphone-cli` | SIP/AMFI not properly relaxed |
| Virtualization not available | You are inside a nested VM — use a real Mac host |
| Stuck on “Press home to continue” | Connect via VNC and right-click / two-finger click |
| Large apps crash (CODESIGNING / Invalid Page) | Known limitation with very large binaries; see original issues |
| System apps won’t install | Avoid Japan / EU region during initial setup |
| Network issues when host uses VPN | Known limitation — try disabling host VPN |

### Data Locations

Everything is stored under `~/.vphone/` (override with `$VPHONE_ROOT`):

- `~/.vphone/VMs/` — your virtual devices
- `~/.vphone/ipsws/` — downloaded firmwares
- `~/.vphone/debs/` — jailbreak packages cache

---

## فارسی

### Jailbreak Machine چیست؟

**Jailbreak Machine** به شما امکان می‌دهد یک دستگاه iOS واقعی را به صورت ماشین مجازی روی مک‌های Apple Silicon اجرا کنید.  
از Virtualization.framework رسمی اپل استفاده می‌کند. نیازی به آیفون فیزیکی نیست و هیچ خطری برای دستگاه واقعی شما ندارد.

یک دستور می‌تواند کل فرآیند را انجام دهد:

**دانلود → پچ → DFU Restore → نصب فریمور سفارشی → بوت اول**

شما سطح دور زدن امنیت را انتخاب می‌کنید (از نزدیک به حالت عادی تا جیلبریک کامل با نصب خودکار Sileo و TrollStore). بعد از بوت می‌توانید مستقیماً با SSH وارد دستگاه شوید.

این پروژه یک ارتقاء حرفه‌ای از نظر مستندات، تجربه کاربری و بسته‌بندی است که از کار عالی [Lakr233/vphone-cli](https://github.com/Lakr233/vphone-cli) الهام گرفته.

### ویژگی‌های کلیدی

- ساخت و اجرای VM با یک دستور
- چندین سطح پچ (از stock تا جیلبریک کامل)
- نصب خودکار Sileo + TrollStore در قوی‌ترین حالت
- دسترسی SSH و VNC
- کاملاً یک‌بارمصرف و قابل حذف
- مبتنی بر Virtualization.framework رسمی اپل
- فقط Apple Silicon + macOS 15 به بالا

### پیش‌نیازها

**سیستم میزبان**
- مک با پردازنده Apple Silicon
- macOS 15 (Sequoia) یا جدیدتر
- Xcode + iOS SDK
- تنظیمات SIP / AMFI (در راهنمای کامل توضیح داده شده)

**وابستگی‌ها (Homebrew)**
```bash
brew install python@3.13 aria2 wget gnu-tar openssl@3 ldid-procursus sshpass keystone cmake libusb ipsw zstd
```

### شروع سریع (مسیر پیشنهادی)

1. **آماده‌سازی میزبان** (یک‌بار)
   - بخش SIP/AMFI را با دقت انجام دهید.
   - وابستگی‌های Homebrew را نصب کنید.

2. **دریافت ابزار**
   ```bash
   git clone --recurse-submodules https://github.com/Beig-Rules/Jailbreak-Machine.git
   cd Jailbreak-Machine
   ./scripts/setup_tools.sh
   ./scripts/build.sh
   ```

3. **ساخت VM جیلبریک‌شده**
   ```bash
   vphone-cli vm create myphone -V jb
   ```

4. **اجرا**
   ```bash
   vphone-cli vm launch myphone
   ```

5. **اتصال**
   - SSH (جیلبریک): `ssh -p 22222 mobile@<vm-ip>` (رمز: `alpine`)
   - VNC: `vnc://<vm-ip>:5901`

### واریانت‌های پچ

| واریانت | عمق | نتیجه |
|---------|-----|-------|
| stock / light | کم | نزدیک به امنیت عادی iOS |
| dev | متوسط | مناسب توسعه |
| jb | بالا | جیلبریک کامل + Sileo + TrollStore |
| exp | خیلی بالا | جیلبریک + پچ‌های ضد تشخیص VM |

**پیشنهاد:** برای اکثر کاربران با `-V jb` شروع کنید.

### راهنمای قدم‌به‌قدم کامل

#### ۱. آماده‌سازی میزبان (SIP / AMFI)

باید SIP/AMFI را شل کنید تا ابزار بتواند از entitlementهای خصوصی استفاده کند.

**روش A – ساده‌ترین و بازترین (پیشنهادی برای شروع)**

در حالت Recovery (نگه داشتن دکمه پاور → Terminal):

```bash
csrutil disable
csrutil allow-research-guests enable
```

سپس به macOS برگردید و اجرا کنید:

```bash
sudo nvram boot-args="amfi_get_out_of_my_way=1 -v"
```

دوباره ریبوت کنید.

#### ۲. بیلد

```bash
git clone --recurse-submodules https://github.com/Beig-Rules/Jailbreak-Machine.git
cd Jailbreak-Machine
./scripts/setup_tools.sh
./scripts/build.sh
```

#### ۳. ساخت و اجرا

```bash
vphone-cli vm create myphone -V jb
vphone-cli vm launch myphone
```

### رفع مشکلات رایج

| مشکل | راه‌حل |
|------|--------|
| `zsh: killed` | SIP/AMFI درست تنظیم نشده |
| Virtualization در دسترس نیست | داخل VM تودرتو هستید — از مک واقعی استفاده کنید |
| گیر کردن روی «Press home to continue» | با VNC وصل شوید و کلیک راست / دو انگشتی بزنید |
| کرش اپ‌های بزرگ | محدودیت شناخته‌شده با باینری‌های خیلی بزرگ |
| مشکل شبکه وقتی VPN روی هاست فعال است | VPN هاست را موقتاً خاموش کنید |

---

## Attribution & Copyright / اعتبار و کپی‌رایت

This project is a professional documentation, packaging and usability upgrade inspired by the outstanding work of:

**Original project:** [Lakr233/vphone-cli](https://github.com/Lakr233/vphone-cli)  
All credit for the core technology, Virtualization.framework integration, patching pipeline, and jailbreak variants belongs to Lakr233 and contributors.

**This upgraded edition (Jailbreak Machine)**  
Copyright © 2026 Beig (Beig-Rules)  
Published under the MIT License.

The goal of this repository is to make the powerful original tool easier to understand, safer to set up, and more approachable for both researchers and power users, while fully preserving attribution to the original authors.

---

**ساخته‌شده برای استفاده کاربردی، شفاف و بدون دردسر از آیفون جیلبریک‌شده مجازی**  
**Built to make virtual jailbroken iPhones practical, clear, and ready to use**
