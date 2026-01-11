cask "blackboard" do
  version "0.10.1"
  sha256 "29d1b896a17a4123a865d80b0d938f4fc9625a2867cc49e634b80e25241d2aac"

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
