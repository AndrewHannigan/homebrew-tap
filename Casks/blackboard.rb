cask "blackboard" do
  version "0.4.0"
  sha256 "9cc42c1da265925037f1919ebf45e2808540c2f6a335f4493a30b7a42a872036"

  url "https://github.com/AndrewHannigan/blackboard/releases/download/v#{version}/Blackboard-#{version}-arm64.zip"
  name "Blackboard"
  desc "Minimal scratch text editor"
  homepage "https://github.com/AndrewHannigan/blackboard"

  app "Blackboard.app"

  caveats <<~EOS
    Blackboard is not signed. To open it, run:
      xattr -cr /Applications/Blackboard.app
  EOS
end

