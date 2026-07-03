cask "agentum" do
  arch arm: "arm64", intel: "x64"

  version "0.57.0"
  sha256 arm:   "7c6b2eaca9ae4355bc7550a356b04b68487aca7ccf040aebc6984685e7148ff8",
         intel: "bbf215edfd8810e839c1ddc54e5ea1ef504c9bb6bc8e0ab35652d74355e2d7ac"

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
