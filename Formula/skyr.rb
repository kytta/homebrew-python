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
    sha256 cellar: :any_skip_relocation, ventura:      "b9076904c1bdc6ebc222cf24cf9eaf3b95f5599965dbaaf25522a8c058ef27b4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fb91d427b4f8ee76222ff5f06d98031f037a7bcf65bba3a6e881f38bcb8fe9c9"
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
