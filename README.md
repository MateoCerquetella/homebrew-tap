# homebrew-tap

Homebrew tap for [Agentum](https://github.com/MateoCerquetella/agentum) — a
self-hosted control plane for AI coding agents.

## Install the desktop app

```sh
brew tap MateoCerquetella/tap
brew trust MateoCerquetella/tap   # one-time: lets the cask clear the Gatekeeper quarantine flag
brew install --cask agentum
```

This drops `Agentum.app` into `/Applications`. Agentum is not yet Apple-notarized,
so the cask clears the macOS quarantine flag during install — you will **not** see
the "app is not verified" / unidentified-developer Gatekeeper warning, on the first
install or on later `brew upgrade --cask agentum`.

> The one-time `brew trust` is required because the cask runs `xattr` in a
> `postflight` block (to strip quarantine), and Homebrew gates third-party taps
> that execute code. Once notarized releases land, the postflight — and the trust
> requirement — can be dropped.
