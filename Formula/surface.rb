class Surface < Formula
  desc "Float a draggable file thumbnail on your screen"
  homepage "https://github.com/AndrewHannigan/surface"
  url "https://github.com/AndrewHannigan/surface/releases/download/v0.1.0/surface.tar.gz"
  sha256 "cebf9851b6f00823da639a2ad36debec31db1c37f0750cccee7f9c0ff645be00"
  version "0.1.0"
  license :cannot_represent

  depends_on :macos

  def install
    bin.install "surface"
  end

  test do
    assert_match "Usage: surface", shell_output("#{bin}/surface 2>&1", 1)
  end
end
