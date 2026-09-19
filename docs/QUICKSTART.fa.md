# شروع سریع — Jailbreak Machine

## مسیر یک‌صفحه‌ای تا VM جیلبریک‌شده

### ۱. پیش‌نیاز میزبان
- مک Apple Silicon
- macOS 15 یا جدیدتر
- Xcode نصب باشد

### ۲. تنظیم SIP/AMFI (یک‌بار)

در حالت Recovery:
```bash
csrutil disable
csrutil allow-research-guests enable
```

بعد در macOS:
```bash
sudo nvram boot-args="amfi_get_out_of_my_way=1 -v"
```
ریبوت کنید.

### ۳. نصب وابستگی‌ها
```bash
brew install python@3.13 aria2 wget gnu-tar openssl@3 ldid-procursus sshpass keystone cmake libusb ipsw zstd
```

### ۴. بیلد
```bash
git clone --recurse-submodules https://github.com/Lakr233/vphone-cli.git
cd vphone-cli
./scripts/setup_tools.sh
./scripts/build.sh
```

> توصیه: ابتدا راهنماهای Jailbreak Machine را بخوانید، سپس از مخزن اصلی برای بیلد استفاده کنید.

### ۵. ساخت و اجرا
```bash
vphone-cli vm create myphone -V jb
vphone-cli vm launch myphone
```

### ۶. اتصال
```bash
ssh -p 22222 mobile@<vm-ip>     # رمز: alpine
```

VNC: `vnc://<vm-ip>:5901`
