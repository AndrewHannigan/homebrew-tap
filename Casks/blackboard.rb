cask "blackboard" do
  version "0.6.0"
  sha256 "6b3aaa25c75f27a12aeba59f821ca236fac53ff6cd5c001d6dd6c9922e7fc6a3"

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
end

