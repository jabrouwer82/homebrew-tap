class Amm213 < Formula
  desc "Ammonite is a cleanroom re-implementation of the Scala REPL"
  homepage "https://ammonite.io/"
  url "https://github.com/com-lihaoyi/Ammonite/releases/download/2.4.0/2.13-2.4.0"
  sha256 "d85df9aa1588ea135bf8487d6530f39eaa35d7ac8decc64819572168020cdfa0"
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
