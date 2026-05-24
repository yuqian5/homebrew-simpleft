class Simpleft < Formula
  desc "Lightweight command-line tool designed to simplify p2p file sharing"
  homepage "https://github.com/yuqian5/simpleft"
  url "https://github.com/yuqian5/simpleft.git", tag: "v0.0.5"
  license "GPL-3.0-or-later"
  head "master"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build

  # libsodium ships SIMD assembly for x86 only (SSE2/AVX2/AVX-512 ChaCha20 +
  # Poly1305). On x86_64 it crushes the vendored monocypher backend; on
  # AArch64 it falls back to portable C and is actually slower than monocypher
  # (which gets full LTO when built into the binary). So we only pull it in
  # on Intel hosts; arm builds use the vendored monocypher backend.
  on_intel do
    depends_on "libsodium"
  end

  def install
    system "cmake", "-S", "./source", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "false"
  end
end
