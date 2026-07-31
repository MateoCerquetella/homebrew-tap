cask "agentum" do
  arch arm: "arm64", intel: "x64"

  version "0.98.9"
  sha256 arm:   "67d7b72fa87fd6611c27feb1d04f4e68bc0ee1184aab6d63fa5906b806081639",
         intel: "a4f93af1926b3ebe3c86c2f96e673cc11b716e6c55ec92e022e8bc6c4b476ccc"

  url "https://github.com/MateoCerquetella/agentum/releases/download/v#{version}/agentum-#{version}-macos-#{arch}.dmg"
  name "Agentum"
  desc "Self-hosted control plane for AI coding agents"
  homepage "https://github.com/MateoCerquetella/agentum"

  depends_on macos: :big_sur

  app "Agentum.app"

  zap trash: [
    "~/.agentum",
    "~/Library/Application Support/agentum",
    "~/Library/Application Support/Agentum",
    "~/Library/Application Support/dev.agentum.app",
    "~/Library/Caches/agentum",
    "~/Library/Caches/dev.agentum.app",
    "~/Library/Preferences/dev.agentum.app.plist",
    "~/Library/Saved Application State/dev.agentum.app.savedState",
  ]
end
