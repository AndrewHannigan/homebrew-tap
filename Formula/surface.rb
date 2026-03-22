class Surface < Formula
  desc "Float a draggable file thumbnail on your screen"
  homepage "https://github.com/AndrewHannigan/surface"
  url "https://github.com/AndrewHannigan/surface/releases/download/v0.1.1/surface"
  sha256 "e37b2d2038836d0c288f79350243c3be9225ee72942d6218542164497452a30c"
  version "0.1.1"
  license :cannot_represent

  depends_on :macos

  def install
    bin.install "surface"
  end

  test do
    assert_match "Usage: surface", shell_output("#{bin}/surface 2>&1", 1)
  end
end
