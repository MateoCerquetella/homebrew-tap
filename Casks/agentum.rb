cask "agentum" do
  arch arm: "arm64", intel: "x64"

  version "0.17.2"
  sha256 arm:   "0690159943d6e930ca9def726a81dfb3d8f40bdae35303cc898b259c7dddb49c",
         intel: "4217b551508b129f7c06d2d11d228334afc44d5387540af41994c2fc1e2f3988"

  url "https://github.com/MateoCerquetella/agentum/releases/download/v#{version}/agentum-#{version}-macos-#{arch}.dmg"
  name "Agentum"
  desc "Self-hosted control plane for AI coding agents"
  homepage "https://github.com/MateoCerquetella/agentum"

  depends_on macos: :big_sur

  app "agentum.app"

  # Agentum is not yet Apple-notarized. Homebrew applies com.apple.quarantine to
  # downloads by default, which makes Gatekeeper block an unsigned app on first
  # launch. Strip it post-install so `brew install` is warning-free — the same
  # approach nikitabobko/aerospace and mocki-toki/barik use. CI rewrites this file
  # on each release; once releases are notarized, drop this postflight block.
  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/agentum.app"],
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
