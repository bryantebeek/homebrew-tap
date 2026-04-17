cask "pane" do
  version "0.5.0"
  sha256 "693c07bf212f065fdf68ec3282d3c490ef012d74cfe874d393c114a0281ddec6"

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
