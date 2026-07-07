cask "agentum" do
  arch arm: "arm64", intel: "x64"

  version "0.62.0"
  sha256 arm:   "d8b85a00b731b18611de3b7e6f7634f9cc3b3744bb28373e4e5a43e6c0cfd7a4",
         intel: "37e621307c714ea324830cbac6c4639a2dea878947c5885ece8a18bef7adb8dc"

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
