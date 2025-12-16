class Ctxgen < Formula
  desc "Generate AGENTS.md and CLAUDE.md from .context folder"
  homepage "https://github.com/andrewhannigan/ctxgen"
  version "0.2.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/andrewhannigan/ctxgen/releases/download/v0.2.6/ctxgen-aarch64-apple-darwin.tar.xz"
      sha256 "a2a2cb5ef9ba61270311efe035c6f20e934a4bb815dae2ff5155204fe2e3ff7c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/andrewhannigan/ctxgen/releases/download/v0.2.6/ctxgen-x86_64-apple-darwin.tar.xz"
      sha256 "6a98171343bc98e1e6185c2746c0423e2a369812bf3b36b72ae875219ba9b031"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/andrewhannigan/ctxgen/releases/download/v0.2.6/ctxgen-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "2aa4a38f82219dc0be14fe5607605806841ae4e4d9528973ad6e36ae64a6772d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/andrewhannigan/ctxgen/releases/download/v0.2.6/ctxgen-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "75540e3fe4bed54c96b862af02c10510e237e324b812c0d6323abffa0555a75a"
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
