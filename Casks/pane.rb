cask "pane" do
  version "0.3.0"
  sha256 "5c472cb1b529ba41874195ff0a79e9b1a4a6ca41ebe4631982ba161e86259d29"

  url "https://github.com/bryantebeek/pane-releases/releases/download/v#{version}/Pane-#{version}.dmg"
  name "Pane"
  desc "Native macOS app for managing remote development environments over SSH"
  homepage "https://bryantebeek.github.io/pane-releases/"

  depends_on macos: ">= :sequoia"

  app "Pane.app"

  preflight do
    unless system("command -v tmux >/dev/null 2>&1")
      ohai "tmux not found — installing via Homebrew"
      system("brew", "install", "tmux")
    end
  end

  zap trash: [
    "~/Library/Preferences/com.bryantebeek.pane.mac.plist",
    "~/Library/Caches/com.bryantebeek.pane.mac",
  ]
end
