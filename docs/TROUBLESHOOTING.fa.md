# رفع مشکلات — Jailbreak Machine

## zsh: killed
SIP/AMFI هنوز فعال است. مراحل Recovery و nvram را دوباره انجام دهید و ریبوت کنید.

## Virtualization is not available
مک شما خودش داخل یک ماشین مجازی است. این حالت پشتیبانی نمی‌شود. از مک فیزیکی Apple Silicon استفاده کنید.

## گیر کردن روی Press home to continue
با VNC وصل شوید (`vnc://<ip>:5901`) و با کلیک راست / دو انگشتی دکمه Home را شبیه‌سازی کنید.

## کرش اپ‌های بزرگ (CODESIGNING / Invalid Page)
محدودیت شناخته‌شده برای باینری‌های خیلی بزرگ (مثل برخی نسخه‌های TikTok، WeChat و ...). اپ‌های کوچک‌تر معمولاً درست کار می‌کنند.

## نصب نشدن اپ‌های سیستمی
در مراحل اولیه راه‌اندازی iOS منطقه Japan یا EU را انتخاب نکنید.

## مشکل شبکه وقتی VPN روی مک فعال است
VPN میزبان را موقتاً خاموش کنید.

## گیر کردن CFW install روی ldid
```bash
brew install --HEAD ldid-procursus
brew link --overwrite ldid-procursus
```
