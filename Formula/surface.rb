class Surface < Formula
  desc "Float a draggable file thumbnail on your screen"
  homepage "https://github.com/AndrewHannigan/surface"
  url "https://github.com/AndrewHannigan/surface/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "3380bd0ab2afaeb149350b306054315459461c252faef02e1d044de05e6c8224"
  license :cannot_represent

  depends_on :macos

  def install
    system "swiftc", "-O", "-o", "surface",
           "-framework", "Cocoa",
           "-framework", "QuickLookThumbnailing",
           "surface.swift"
    bin.install "surface"
  end

  test do
    assert_match "Usage: surface", shell_output("#{bin}/surface 2>&1", 1)
  end
end
