# typed: false
# frozen_string_literal: true

class Tk < Formula
  desc "Minimal CLI ticket management system for AI agents"
  homepage "https://github.com/radutopala/ticket"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_intel do
      url "https://github.com/radutopala/ticket/releases/download/v0.1.0/tk_0.1.0_darwin_amd64.tar.gz"
      sha256 "f8b4cc535513e335ecee14d36106e17573f1c80f3608e53d0b3d0730ea052038"
    end
    on_arm do
      url "https://github.com/radutopala/ticket/releases/download/v0.1.0/tk_0.1.0_darwin_arm64.tar.gz"
      sha256 "5a6ce2642f48a367ba12d65be519358cc3b1869465839e83f2ea52473606d616"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/radutopala/ticket/releases/download/v0.1.0/tk_0.1.0_linux_amd64.tar.gz"
      sha256 "0c3280e780612fcd30e0e63f7de51f91e955662967d5cad76d7ee9f1fa4d362c"
    end
    on_arm do
      url "https://github.com/radutopala/ticket/releases/download/v0.1.0/tk_0.1.0_linux_arm64.tar.gz"
      sha256 "68784719bb3788085da2f1ab049d9ca2fa4425d57d07724cd0ce1f64f2fe569e"
    end
  end

  def install
    bin.install "tk"
  end

  test do
    system "#{bin}/tk", "--help"
  end
end
