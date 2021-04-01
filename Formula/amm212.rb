class Amm212 < Formula
  desc "Ammonite is a cleanroom re-implementation of the Scala REPL"
  homepage "https://ammonite.io/"
  url "https://github.com/lihaoyi/Ammonite/releases/download/2.3.8/2.12-2.3.8"
  sha256 "1a963296d69ffc9fba3162c782e0229fe96aa48a53eec9a14c8d0b780601f3cf"
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
