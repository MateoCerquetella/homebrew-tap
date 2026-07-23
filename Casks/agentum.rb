cask "agentum" do
  arch arm: "arm64", intel: "x64"

  version "0.96.1"
  sha256 arm:   "3ae82b27a22c0457bc99f1d27d7720a6bb040c156f4bfe2d9101634d0da57c93",
         intel: "77933153b2733803eb4eec46909c762261af63d0cc8c198243d6d97dae5f7b2c"

  url "https://github.com/MateoCerquetella/agentum/releases/download/v#{version}/agentum-#{version}-macos-#{arch}.dmg"
  name "Agentum"
  desc "Self-hosted control plane for AI coding agents"
  homepage "https://github.com/MateoCerquetella/agentum"

  depends_on macos: :big_sur

  app "Agentum.app"

  # Agentum is not yet Apple-notarized. Homebrew applies com.apple.quarantine to
  # downloads by default, which makes Gatekeeper block an unsigned app on first
  # launch. Strip it post-install so `brew install` is warning-free — the same
  # approach nikitabobko/aerospace and mocki-toki/barik use. Once releases are
  # Apple-notarized, delete this postflight block.
  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/Agentum.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/.agentum",
    "~/Library/Application Support/dev.agentum.app",
    "~/Library/Caches/dev.agentum.app",
    "~/Library/Preferences/dev.agentum.app.plist",
    "~/Library/Saved Application State/dev.agentum.app.savedState",
  ]
end
