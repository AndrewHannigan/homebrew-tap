class Surface < Formula
  desc "Float a draggable file thumbnail on your screen"
  homepage "https://github.com/AndrewHannigan/surface"
  url "https://github.com/AndrewHannigan/surface/releases/download/v0.1.1/surface"
  sha256 "5b627a00e287667158c194dda50ca825f4ac968d1ec05d39df3d0cdff96104fd"
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
