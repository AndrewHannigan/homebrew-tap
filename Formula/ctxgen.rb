class Ctxgen < Formula
  desc "Generate AGENTS.md and CLAUDE.md from .context folder"
  homepage "https://github.com/andrewhannigan/ctxgen"
  version "0.2.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/andrewhannigan/ctxgen/releases/download/v0.2.4/ctxgen-aarch64-apple-darwin.tar.xz"
      sha256 "ede3e5fce2f8363f745fbaf5f9119da92e2d93554d5e45b2597ed2b9173a91bb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/andrewhannigan/ctxgen/releases/download/v0.2.4/ctxgen-x86_64-apple-darwin.tar.xz"
      sha256 "55da2916a77d9cdd68b0e7c6a34c44ce8be9d9833ced17ea1fba3cd47aefc959"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/andrewhannigan/ctxgen/releases/download/v0.2.4/ctxgen-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "20c6c5a638c8582e247f66c4bd30168c19b28b7d440a343f49a50cd1e2cbf54c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/andrewhannigan/ctxgen/releases/download/v0.2.4/ctxgen-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "56ec2fe844e6fa78e7948145ba45bbd5b5096eec3fa67551048ed753f494526b"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "ctxgen" if OS.mac? && Hardware::CPU.arm?
    bin.install "ctxgen" if OS.mac? && Hardware::CPU.intel?
    bin.install "ctxgen" if OS.linux? && Hardware::CPU.arm?
    bin.install "ctxgen" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
