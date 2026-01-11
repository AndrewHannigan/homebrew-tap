cask "blackboard" do
  version "0.10.0"
  sha256 "e90d5ba5cc6f4484c6d13566a321548baed8108b601cae42262653f9d13b4889"

  url "https://github.com/AndrewHannigan/blackboard/releases/download/v#{version}/Blackboard-#{version}-arm64.zip"
  name "Blackboard"
  desc "Minimal scratch text editor"
  homepage "https://github.com/AndrewHannigan/blackboard"

  app "Blackboard.app"
  binary "#{appdir}/Blackboard.app/Contents/Resources/app.asar.unpacked/bin/bb"

  zap trash: [
    "~/Library/Application Support/Blackboard",
    "~/Library/Preferences/com.blackboard.app.plist",
  ]
end
