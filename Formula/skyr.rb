class Skyr < Formula
  include Language::Python::Virtualenv

  desc "Low-fat task runner"
  homepage "https://os.kytta.dev/skyr"
  url "https://files.pythonhosted.org/packages/5d/69/9941a8be36c27c7a8161076ca7355578ee4b9ef7758b2ad00c9c0813366c/skyr-0.3.1.tar.gz"
  sha256 "e371b29842ac98deb25836efa21ae3a05dc2e531bb40e39a2916267a0ea8f2bf"
  license "ISC"
  head "https://github.com/kytta/skyr.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/kytta/python"
    rebuild 1
    sha256 cellar: :any_skip_relocation, ventura:      "bf3bd2aa736a758e03a03d0f84660ed87b083c20f0c58d59bcefb60624e0d749"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "01457d038f80df1585f47fcea74438913a64775831dbbae341bd588fc758bb10"
  end

  depends_on "python3"

  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    system bin/"skyr", "--version"
  end
end
