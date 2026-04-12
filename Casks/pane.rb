cask "pane" do
  version "0.1.1"
  sha256 "8f9f1c897f207abb346cbaa097c6047880315fa7ed6ee1121b8e60a529de5fea"

  url "https://github.com/bryantebeek/pane-releases/releases/download/v#{version}/Pane-#{version}.dmg"
  name "Pane"
  desc "Native macOS app for managing remote development environments over SSH"
  homepage "https://bryantebeek.github.io/pane-releases/"

  depends_on macos: ">= :sequoia"
  depends_on formula: "tmux"

  app "Pane.app"

  zap trash: [
    "~/Library/Preferences/com.bryantebeek.pane.mac.plist",
    "~/Library/Caches/com.bryantebeek.pane.mac",
  ]
end
