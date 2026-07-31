cask "agentum" do
  arch arm: "arm64", intel: "x64"

  version "0.98.10"
  sha256 arm:   "b52bf358ee21821a1798a780cea72bd0b47f7700c66bb43e28642c41b192e246",
         intel: "e31ee62dd44b0eb342e94a9a072123162fe2d6b4e952fbcb21b9ba864dffc7bd"

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
