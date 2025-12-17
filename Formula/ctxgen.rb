class Ctxgen < Formula
  desc "Generate AGENTS.md and CLAUDE.md from .context folder"
  homepage "https://github.com/andrewhannigan/ctxgen"
  version "0.2.7"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/andrewhannigan/ctxgen/releases/download/v0.2.7/ctxgen-aarch64-apple-darwin.tar.xz"
      sha256 "d28e655d19ba38ef7f3fc72a4c0d4d78f5372b9de383c73512de74836d3b7022"
    end
    if Hardware::CPU.intel?
      url "https://github.com/andrewhannigan/ctxgen/releases/download/v0.2.7/ctxgen-x86_64-apple-darwin.tar.xz"
      sha256 "8a7bba766ba8783f74d425a687175b6c15050d9f4f644159a573005081d950ad"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/andrewhannigan/ctxgen/releases/download/v0.2.7/ctxgen-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "40961bf6e8e11ec4002cc808be198c14e2639f2f8f3134eff5282b4d3f3cbead"
    end
    if Hardware::CPU.intel?
      url "https://github.com/andrewhannigan/ctxgen/releases/download/v0.2.7/ctxgen-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "96aa3319b7af65fa85f131bbaf2c110381e41f04ecf3a80b721ce79e46fd50c7"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "aarch64-unknown-linux-gnu":         {},
    "x86_64-apple-darwin":               {},
    "x86_64-pc-windows-gnu":             {},
    "x86_64-unknown-linux-gnu":          {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static":  {},
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
