cask "blackboard" do
  version "0.10.2"
  sha256 "80c7efd0834654704710f1bc076540b9a18961e70a6f1b819914b743c89e5616"

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
