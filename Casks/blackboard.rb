cask "blackboard" do
  version "0.8.0"
  sha256 "27b01b545540e64683f36d054e338e6c08b297be656ba847545d5cd7b4c43227"

  url "https://github.com/AndrewHannigan/blackboard/releases/download/v0.8.0/Blackboard-0.8.0-arm64.zip"
  name "Blackboard"
  desc "The minimum text editor"
  homepage "https://github.com/AndrewHannigan/blackboard"

  app "Blackboard.app"

  zap trash: [
    "~/Library/Application Support/Blackboard",
    "~/Library/Preferences/com.blackboard.app.plist",
  ]
end
