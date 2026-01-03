cask "whiteboard" do
  version "0.1.0"
  sha256 "34ac469ab09bbedd7e3f437756d6cf771baa9492b5a94c250b6f72ba59ebd5be"

  url "https://github.com/AndrewHannigan/whiteboard/releases/download/v#{version}/Whiteboard-#{version}-arm64.zip"
  name "Whiteboard"
  desc "A text editor with all the features of a whiteboard"
  homepage "https://github.com/AndrewHannigan/whiteboard"

  app "Whiteboard.app"
end

