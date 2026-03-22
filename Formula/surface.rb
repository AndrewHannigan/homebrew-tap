class Surface < Formula
  desc "Float a draggable file thumbnail on your screen"
  homepage "https://github.com/AndrewHannigan/surface"
  url "https://github.com/AndrewHannigan/surface/releases/download/v0.2.0/surface.tar.gz"
  sha256 "ba0bebe58f4025486112b3746a518d8c4d7bc514d07400271f63056fd5ce3515"
  version "0.2.0"
  license :cannot_represent

  depends_on :macos

  def install
    bin.install "surface"
  end

  test do
    assert_match "Usage: surface", shell_output("#{bin}/surface 2>&1", 1)
  end
end
