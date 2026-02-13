cask "openclaw-toggle" do
  version "2.0.2"
  sha256 :no_check

  url "https://github.com/aariya50/openclaw-toggle/releases/download/v#{version}/OpenClawToggle.app.zip"
  name "OpenClaw Toggle"
  desc "macOS menu bar app to monitor and control OpenClaw node and SSH tunnel services"
  homepage "https://github.com/aariya50/openclaw-toggle"

  depends_on macos: ">= :sonoma"

  app "OpenClawToggle.app"

  zap trash: [
    "~/Library/Preferences/ai.openclaw.toggle.plist",
    "~/.openclaw/logs",
  ]
end
