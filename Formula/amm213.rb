class Amm213 < Formula
  desc "Ammonite is a cleanroom re-implementation of the Scala REPL"
  homepage "https://ammonite.io/"
  url "https://github.com/lihaoyi/Ammonite/releases/download/2.3.8/2.13-2.3.8"
  sha256 "e7af76416202ff02b8faece785740d957e3ca6351f8d56cf69a749ec4d25484b"
  license "MIT"

  bottle :unneeded

  depends_on "openjdk"

  def install
    (libexec/"bin").install Dir["*"].first => "amm213"
    chmod 0755, libexec/"bin/amm213"
    (bin/"amm213").write_env_script libexec/"bin/amm213", Language::Java.overridable_java_home_env
  end

  test do
    output = shell_output("#{bin}/amm213 -c 'print(\"hello world!\")'")
    assert_equal "hello world!", output.lines.last
  end
end
