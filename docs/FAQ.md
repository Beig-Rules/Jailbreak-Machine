# FAQ — Jailbreak Machine

### Do I need a real iPhone?
No. The whole point is that you do not need one.

### Does this modify my real iPhone?
No. Everything runs inside a virtual machine on your Mac.

### Which variant should I choose?
Start with `-V jb`. It gives a full jailbreak with Sileo and TrollStore.

### Can I run TikTok / Instagram / WeChat?
Smaller apps usually work. Very large apps often hit known CODESIGNING / Invalid Page issues. This is a current limitation of the underlying technology.

### Why do I have to disable SIP / change AMFI?
The tool needs private Virtualization entitlements that normal signed binaries are not allowed to use.

### Is nested virtualization supported?
No. The host itself must be a physical Apple Silicon Mac running macOS 15+.

### Where is my data stored?
Under `~/.vphone/` (or `$VPHONE_ROOT` if you override it).

### Can I have multiple VMs?
Yes. Create, clone, export and delete them independently.

### Is this legal?
Using virtualization and security research tools is generally legal on devices/software you own. Bypassing protections of third-party services or distributing copyrighted material may not be. You are responsible for your own use.
