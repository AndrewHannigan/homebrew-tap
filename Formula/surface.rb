class Surface < Formula
  desc "Float draggable file thumbnails from your terminal to your desktop"
  homepage "https://github.com/AndrewHannigan/surface"
  version "0.1.1"
  url "https://github.com/AndrewHannigan/surface/releases/download/v0.1.1/surface"
  sha256 "46480bf55b522504f505ceea422701a24b0460f7902174103ee52edeadbe7aca"
  license "MIT"

  depends_on :macos

  def install
    bin.install "surface"
  end

  test do
    assert_match "Usage: surface", shell_output("#{bin}/surface 2>&1", 1)
  end
end
