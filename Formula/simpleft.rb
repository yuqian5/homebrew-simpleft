class Simpleft < Formula
  desc "Lightweight command-line tool designed to simplify p2p file sharing"
  homepage "https://github.com/yuqian5/simpleft"
  url "https://github.com/yuqian5/simpleft.git", tag: "v0.0.1"
  license "GPL-3.0-or-later"
  head "master"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", "./source", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "false"
  end
end
