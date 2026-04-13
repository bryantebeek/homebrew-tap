cask "pane" do
  version "0.2.0"
  sha256 "10b8cdebe9a9ba1695ddb19bf50ff1db25d2357f154df058a2729ee31cc8a138"

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
