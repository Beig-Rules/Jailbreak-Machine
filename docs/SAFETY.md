# Safety & Responsibility — Jailbreak Machine

## Important points

- This tool creates a **virtual** iPhone. It does not touch your physical device.
- You still need to relax SIP/AMFI on the **host Mac**. This reduces host security.
- Only do this on a machine you control and understand.
- Prefer a dedicated research Mac or a secondary volume when possible.
- Jailbroken environments can run untrusted code. Treat the VM as untrusted.
- Do not use this for illegal activity or to violate app terms of service.

## Recommended safety practices

1. Use a dedicated user account or machine for research when possible.
2. Keep host backups before changing SIP/AMFI.
3. Prefer the `jb` variant unless you specifically need `exp`.
4. Delete VMs you no longer need (`vphone-cli vm delete ...`).
5. Remember that large commercial apps may still detect virtualization or crash due to known limitations.

## Disclaimer

This project is provided for research, education, and legitimate development/testing.  
You are responsible for how you use it and for complying with all applicable laws and terms.
