class Gitlike < Formula
  desc "GitLike CLI with Git-like workflow for developers"
  homepage "https://github.com/bigdog156/gitlike"
  version "1.0.1"
  
  if Hardware::CPU.arm?
    url "https://github.com/bigdog156/gitlike/releases/download/v1.0.1/gitlike-darwin-arm64"
    sha256 "9481419ac3ca37416b75d17686aa6003e486c2acc34fa561967c75bb9193d87e"
  else
    url "https://github.com/bigdog156/gitlike/releases/download/v1.0.1/gitlike-darwin-amd64"
    sha256 "65ee23bd668c162d3cfffb98de81f63f2d648a6f408fdd6af38b1d7dc6d93a9f"
  end

  def install
    bin.install "gitlike-darwin-arm64" => "gitlike" if Hardware::CPU.arm?
    bin.install "gitlike-darwin-amd64" => "gitlike" if Hardware::CPU.intel?
  end

  test do
    system "#{bin}/gitlike", "--help"
    assert_match "1.0.1", shell_output("#{bin}/gitlike --version 2>&1")
  end
end

