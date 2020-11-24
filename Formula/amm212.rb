class Amm212 < Formula
  desc "Ammonite is a cleanroom re-implementation of the Scala REPL"
  homepage "https://ammonite.io/"
  url "https://github.com/lihaoyi/Ammonite/releases/download/2.2.0/2.12-2.2.0"
  sha256 "f717b8193e58a550ad0cf699be2f4f670156ff070d860f9009d6c9e139769459"
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
