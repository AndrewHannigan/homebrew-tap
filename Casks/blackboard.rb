cask "blackboard" do
  version "0.3.0"
  sha256 "8f1dc49fbfae9ac69ada14eac657220d41693f7c7abda1da2925d5f14206dad3"

  url "https://github.com/AndrewHannigan/blackboard/releases/download/v#{version}/Blackboard-#{version}-arm64.zip"
  name "Whiteboard"
  desc "Minimal scratch text editor"
  homepage "https://github.com/AndrewHannigan/blackboard"

  app "Blackboard.app"

  caveats <<~EOS
    Blackboard is not signed. To open it, run:
      xattr -cr /Applications/Blackboard.app
  EOS
end

