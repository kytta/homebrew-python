class Bumerge < Formula
  include Language::Python::Virtualenv

  desc "Merge Butane configurations"
  homepage "https://github.com/kytta/bumerge"
  url "https://files.pythonhosted.org/packages/fd/aa/14e02c9db79f1b30e5d1055841acb233c38d488ec2766ad08cb79bb9c9ec/bumerge-0.2.0.tar.gz"
  sha256 "95e870eaff1ba633d5df0073cc26fa3b18d5dd723d4ad0c8d4ff2eae3164d3b1"
  license "BSD-3-Clause"

  depends_on "python"

  resource "ruamel-yaml" do
    url "https://files.pythonhosted.org/packages/29/81/4dfc17eb6ebb1aac314a3eb863c1325b907863a1b8b1382cdffcb6ac0ed9/ruamel.yaml-0.18.6.tar.gz"
    sha256 "8b27e6a217e786c6fbe5634d8f3f11bc63e0f80f6a5890f28863d9c45aac311b"
  end

  resource "ruamel-yaml-clib" do
    url "https://files.pythonhosted.org/packages/46/ab/bab9eb1566cd16f060b54055dd39cf6a34bfa0240c53a7218c43e974295b/ruamel.yaml.clib-0.2.8.tar.gz"
    sha256 "beb2e0404003de9a4cab9753a8805a8fe9320ee6673136ed7f04255fe60bb512"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"bumerge", "--version"
  end
end
