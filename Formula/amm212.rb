class Amm212 < Formula
  desc "Ammonite is a cleanroom re-implementation of the Scala REPL"
  homepage "https://ammonite.io/"
  url "https://github.com/com-lihaoyi/Ammonite/releases/download/2.4.0/2.12-2.4.0"
  sha256 "2bc24823a4809a706331643d6b736a48b2ee3f538b71bc286e3dc6f8e0a22dd0"
  license "MIT"

  bottle :unneeded

  depends_on "openjdk"

  def install
    (libexec/"bin").install Dir["*"].first => "amm212"
    chmod 0755, libexec/"bin/amm212"
    (bin/"amm212").write_env_script libexec/"bin/amm212", Language::Java.overridable_java_home_env
  end

  test do
    output = shell_output("#{bin}/amm212 -c 'print(\"hello world!\")'")
    assert_equal "hello world!", output.lines.last
  end
end
