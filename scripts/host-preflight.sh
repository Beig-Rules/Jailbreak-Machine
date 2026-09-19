#!/usr/bin/env bash
# Jailbreak Machine — basic host preflight checks

set -euo pipefail

echo "==> Jailbreak Machine host preflight"
echo

fail=0

# Architecture
arch=$(uname -m)
if [[ "$arch" != "arm64" ]]; then
  echo "[FAIL] Not Apple Silicon (arch=$arch)"
  fail=1
else
  echo "[OK]   Apple Silicon"
fi

# macOS version (rough)
os_major=$(sw_vers -productVersion | cut -d. -f1)
if [[ "$os_major" -lt 15 ]]; then
  echo "[FAIL] macOS 15+ required (found $(sw_vers -productVersion))"
  fail=1
else
  echo "[OK]   macOS $(sw_vers -productVersion)"
fi

# Nested virtualization warning (heuristic)
if sysctl -n machdep.cpu.features 2>/dev/null | grep -qi hypervisor; then
  echo "[WARN] Hypervisor feature flag present — make sure you are NOT inside a nested VM"
else
  echo "[OK]   No obvious nested hypervisor flag"
fi

# Homebrew tools
for t in brew python3 aria2 wget; do
  if command -v "$t" >/dev/null 2>&1; then
    echo "[OK]   $t found"
  else
    echo "[FAIL] $t not found"
    fail=1
  fi
done

echo
if [[ $fail -eq 0 ]]; then
  echo "Preflight passed (still complete SIP/AMFI steps manually)."
else
  echo "Preflight found problems. Fix them before building."
  exit 1
fi
