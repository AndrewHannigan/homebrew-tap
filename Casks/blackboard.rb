cask "blackboard" do
  version "0.9.6"
  sha256 "80921ca4c117a9f1928222a4300c389a26a7c0af56b1eaec538ab2d026412b66"

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
