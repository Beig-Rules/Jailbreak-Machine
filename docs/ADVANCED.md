# Advanced Usage — Jailbreak Machine

## Manual pipeline (instead of `vm create`)

You can run stages individually if you need more control:

```bash
vphone-cli vm new myphone
vphone-cli fw prepare myphone --iphone-version <version>
vphone-cli fw patch myphone --variant jb
vphone-cli vm restore myphone
vphone-cli cfw install myphone
vphone-cli vm launch myphone
```

## Cloning & identity

```bash
vphone-cli vm clone myphone myphone-2
```

Creates a fast APFS clone with a fresh device identity.

## Export / Import

```bash
vphone-cli vm export myphone --out myphone.tzst
vphone-cli vm import myphone.tzst --name restored
```

## Resource tuning

```bash
vphone-cli vm config myphone --cpu 8 --memory 8192
```

## Control socket / automation

Upstream exposes a host control socket for screenshots, touch, swipes and keys.  
See the original project and related MCP wrappers for AI-driven automation.

## Environment overrides

| Variable | Purpose |
|----------|---------|
| `VPHONE_ROOT` | Move the entire data tree |
| `VPHONE_LIBRARY_ROOT` | Move only the VM library |
| `VPHONE_VENV_DIR` | Custom Python venv location |
