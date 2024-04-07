class Skyr < Formula
  include Language::Python::Virtualenv

  desc "Low-fat task runner"
  homepage "https://os.kytta.dev/skyr"
  url "https://files.pythonhosted.org/packages/5d/69/9941a8be36c27c7a8161076ca7355578ee4b9ef7758b2ad00c9c0813366c/skyr-0.3.1.tar.gz"
  sha256 "e371b29842ac98deb25836efa21ae3a05dc2e531bb40e39a2916267a0ea8f2bf"
  license "ISC"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"skyr", "--version"
  end
end
