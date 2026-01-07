cask "blackboard" do
  version "0.9.3"
  sha256 "1e06463c5bb2c13adeb7505c2c5e5b6b4b5dbcc422f2cbb4f55214ff286ee0d4"

  url "https://github.com/AndrewHannigan/blackboard/releases/download/v#{version}/Blackboard-#{version}-arm64.zip"
  name "Blackboard"
  desc "Minimal scratch text editor"
  homepage "https://github.com/AndrewHannigan/blackboard"

  app "Blackboard.app"
  binary "#{appdir}/Blackboard.app/Contents/Resources/app.asar.unpacked/bin/bb"

  caveats <<~EOS
    Blackboard is not signed. To open it, run:
      xattr -cr /Applications/Blackboard.app
  EOS

  zap trash: [
    "~/Library/Application Support/Blackboard",
    "~/Library/Preferences/com.blackboard.app.plist",
  ]
end
