class Makedeck < Formula
  desc "Run a project's dev services in tmux and control them from Raycast"
  homepage "https://github.com/Lorenzo-Se/makedeck"
  url "https://github.com/Lorenzo-Se/makedeck/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "9f0be8c7d9db5e8d4d8e6a5c3afd8b1b5e6c28c53819a3131deafe5dd9989c01"
  license "MIT"

  depends_on :macos
  depends_on "tmux"

  def install
    bin.install "bin/makedeck"
    pkgshare.install "skills"
  end

  def caveats
    <<~EOS
      Install the Raycast extension from the Raycast Store:
        https://www.raycast.com/SemL/makedeck

      For Claude Code, the skill is in
        #{opt_pkgshare}/skills/structuring-dev-makefiles
      The hook for ~/.claude/settings.json is described in
        https://github.com/Lorenzo-Se/makedeck#for-coding-agents
    EOS
  end

  test do
    assert_match "makedeck status", shell_output("#{bin}/makedeck help")
    pipe_output("#{bin}/makedeck hook", '{"tool_name": "Read"}', 0)
  end
end
