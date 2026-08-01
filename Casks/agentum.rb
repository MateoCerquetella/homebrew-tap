cask "agentum" do
  arch arm: "arm64", intel: "x64"

  version "0.98.11"
  sha256 arm:   "6669011b41b8c5d6f1265acb36ca5c9e4be8a24c080de00369486581ebe7ed3d",
         intel: "da91d7fd19dfe66cdd8f3f106374227736e535bf227bddb04aeb2ced46e91619"

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
