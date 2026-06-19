# homebrew-agentum

Homebrew tap for [Agentum](https://github.com/MateoCerquetella/agentum) — a
self-hosted control plane for AI coding agents.

## Install the desktop app

```sh
brew install --cask MateoCerquetella/agentum/agentum
```

This drops `Agentum.app` into `/Applications`. Agentum is not yet Apple-notarized,
so the cask clears the macOS quarantine flag during install — you will **not** see
the "app is not verified" / unidentified-developer Gatekeeper warning.

## Update

```sh
brew upgrade --cask agentum
```

The cask is bumped automatically by Agentum's release workflow on every tag, so it
always points at the latest published `.dmg`.
