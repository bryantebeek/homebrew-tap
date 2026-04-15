cask "pane" do
  version "0.4.0"
  sha256 "2bbd74e23b0653961b2b922b04245d18c04fcdcdcd083568812f6080ff5ca0a3"

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
