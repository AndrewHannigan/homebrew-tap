class Surface < Formula
  desc "Float a draggable file thumbnail on your screen"
  homepage "https://github.com/AndrewHannigan/surface"
  url "https://github.com/AndrewHannigan/surface/releases/download/v0.1.1/surface.tar.gz"
  sha256 "14264c019a630ebc9c7c0a2065f8aa53d21082343af767ecf15f2feb889f4f5b"
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
