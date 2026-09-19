# Setup Checklist — Jailbreak Machine

Use this before reporting problems.

## Host

- [ ] Physical Apple Silicon Mac (not nested VM)
- [ ] macOS 15 or newer
- [ ] Xcode + command line tools installed
- [ ] SIP/AMFI steps completed and rebooted
- [ ] Homebrew dependencies installed

## Build

- [ ] Cloned with `--recurse-submodules`
- [ ] `./scripts/setup_tools.sh` finished without error
- [ ] `./scripts/build.sh` finished without error
- [ ] Binary runs (`vphone-cli --help`)

## First VM

- [ ] Created with a clear name
- [ ] Used `-V jb` unless you have a specific reason otherwise
- [ ] Launch succeeds
- [ ] SSH or VNC connection works

## If something fails

1. Read `docs/TROUBLESHOOTING.md`
2. Check the FAQ
3. Verify every item above
4. Only then look at upstream issues
