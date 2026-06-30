cask "agentum" do
  arch arm: "arm64", intel: "x64"

  version "0.44.1"
  sha256 arm:   "1de19cde0d7967693d918cd6f89630f66c9f129a3f090ae5effa6430b1e2d0b0",
         intel: "bd68e8dbfc0f2610b6c874038caeab03540f39294d6868b2930f5b9853e01fe9"

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
