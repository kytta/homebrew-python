class Bumerge < Formula
  include Language::Python::Virtualenv

  desc "Merge Butane configurations"
  homepage "https://github.com/kytta/bumerge"
  url "https://files.pythonhosted.org/packages/aa/6a/1cbadab3d1b5e4147bce5c8c14abb3aef7f114cf21fe93fd99f7ea326a9f/bumerge-0.2.1.tar.gz"
  sha256 "8e5276fcb3eb8d1e146d613b4739dd9f664ff72a694b1a3d9b666c91b3c921b6"
  license "BSD-3-Clause"

  bottle do
    root_url "https://ghcr.io/v2/kytta/python"
    sha256 cellar: :any_skip_relocation, ventura:      "8431fa34e1c500d31e415b6f5cac3bcda4d1c6b7beb605acca7ebc6f30dac15b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "01950b8a31bf31c7d135ee80a646252b0ad9027e7e2215194edeab7311110dd6"
  end

  depends_on "libyaml"
  depends_on "python@3.12"

  resource "ruamel-yaml" do
    url "https://files.pythonhosted.org/packages/29/81/4dfc17eb6ebb1aac314a3eb863c1325b907863a1b8b1382cdffcb6ac0ed9/ruamel.yaml-0.18.6.tar.gz"
    sha256 "8b27e6a217e786c6fbe5634d8f3f11bc63e0f80f6a5890f28863d9c45aac311b"
  end

  resource "ruamel-yaml-clib" do
    url "https://files.pythonhosted.org/packages/46/ab/bab9eb1566cd16f060b54055dd39cf6a34bfa0240c53a7218c43e974295b/ruamel.yaml.clib-0.2.8.tar.gz"
    sha256 "beb2e0404003de9a4cab9753a8805a8fe9320ee6673136ed7f04255fe60bb512"
  end

  def install
    # Work around ruamel.yaml.clib not building on Xcode 15.3, remove after a new release
    # has resolved: https://sourceforge.net/p/ruamel-yaml-clib/tickets/32/
    ENV.append_to_cflags "-Wno-incompatible-function-pointer-types" if DevelopmentTools.clang_build_version >= 1500

    virtualenv_install_with_resources
  end

  test do
    system bin/"bumerge", "--version"
  end
end
