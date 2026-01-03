cask "blackboard" do
  version "0.1.0"
  sha256 "34ac469ab09bbedd7e3f437756d6cf771baa9492b5a94c250b6f72ba59ebd5be"

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

