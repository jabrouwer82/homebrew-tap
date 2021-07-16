class Amm30 < Formula
  desc "Ammonite is a cleanroom re-implementation of the Scala REPL"
  homepage "https://ammonite.io/"
  url "https://github.com/com-lihaoyi/Ammonite/releases/download/2.4.0/3.0-2.4.0"
  sha256 "31bb222b2513c59849de6d94af987d69d4646ebd8f866bfda6847b7861f1c230"
  license "MIT"

  bottle :unneeded

  depends_on "openjdk"

  def install
    (libexec/"bin").install Dir["*"].first => "amm30"
    chmod 0755, libexec/"bin/amm30"
    (bin/"amm30").write_env_script libexec/"bin/amm30", Language::Java.overridable_java_home_env
  end

  test do
    output = shell_output("#{bin}/amm30 -c 'print(\"hello world!\")'")
    assert_equal "hello world!", output.lines.last
  end
end
