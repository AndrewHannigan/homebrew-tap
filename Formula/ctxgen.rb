class Ctxgen < Formula
  desc "Generate AGENTS.md and CLAUDE.md from .context folder"
  homepage "https://github.com/andrewhannigan/ctxgen"
  version "0.2.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/andrewhannigan/ctxgen/releases/download/v0.2.3/ctxgen-aarch64-apple-darwin.tar.xz"
      sha256 "ff53078a11c0304c390cc1a898b731af14ff275f4740a556712df6dd888e3500"
    end
    if Hardware::CPU.intel?
      url "https://github.com/andrewhannigan/ctxgen/releases/download/v0.2.3/ctxgen-x86_64-apple-darwin.tar.xz"
      sha256 "4540e9b45be87b57c23a1a5e125a276f09b112fce785b3a62eb440fb37990ede"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/andrewhannigan/ctxgen/releases/download/v0.2.3/ctxgen-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a37dbe016e9b903a2346192174c725eb9c360b820120ff309d051e9b14851bf7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/andrewhannigan/ctxgen/releases/download/v0.2.3/ctxgen-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f0df0497623b56209d8e5e4cf9545bf93dcee0288d2b0ddc0bc6443fed614a4d"
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
