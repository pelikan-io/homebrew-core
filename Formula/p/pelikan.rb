class Pelikan < Formula
  desc "Production-ready cache services"
  homepage "https://pelikan.io"
  url "https://github.com/pelikan-io/pelikan/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "d96eb68f85cf4e0c4fb3b2e1c54b2a8705ebe4b33c2678bbeca3c24c409ab4c5"
  license "Apache-2.0"
  head "https://github.com/pelikan-io/pelikan.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "src/server/segcache")
    system "cargo", "install", *std_cargo_args(path: "src/server/rds")
    system "cargo", "install", *std_cargo_args(path: "src/server/pingserver")
    system "cargo", "install", *std_cargo_args(path: "src/proxy/ping")
  end

  test do
    system bin/"pelikan-pingserver", "--help"
  end
end
