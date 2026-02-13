class OpenclawToggle < Formula
  desc "macOS menu bar app to monitor and control OpenClaw node and SSH tunnel services"
  homepage "https://github.com/aariya50/openclaw-toggle"
  url "https://github.com/aariya50/openclaw-toggle.git",
      tag:      "v1.0.0",
      revision: "2f86521a1d7bc17f046cb534dc9eabd0d02d3341"
  license "MIT"

  head "https://github.com/aariya50/openclaw-toggle.git", branch: "main"

  depends_on xcode: ["15.0", :build]
  depends_on macos: :sonoma

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"

    app_name = "OpenClawToggle"
    app_bundle = prefix/"#{app_name}.app"

    # Create .app bundle structure
    (app_bundle/"Contents/MacOS").mkpath
    (app_bundle/"Contents/Resources").mkpath

    # Copy binary — use cp instead of Pathname#install to avoid creating
    # a directory at the executable path.  Pathname#install treats the
    # receiver as a *directory* and copies the source into it, which would
    # produce Contents/MacOS/OpenClawToggle/OpenClawToggle (a dir containing
    # the real binary) instead of Contents/MacOS/OpenClawToggle (the binary).
    cp ".build/release/#{app_name}", app_bundle/"Contents/MacOS"/app_name

    # Copy Info.plist
    (app_bundle/"Contents").install "Info.plist"

    # Copy resources
    (app_bundle/"Contents/Resources").install "Resources/alfred-icon.png" if File.exist?("Resources/alfred-icon.png")
    (app_bundle/"Contents/Resources").install "Resources/AppIcon.icns" if File.exist?("Resources/AppIcon.icns")

    # Create PkgInfo
    (app_bundle/"Contents/PkgInfo").write "APPL????"
  end

  def caveats
    <<~EOS
      OpenClawToggle.app has been installed to:
        #{prefix}/OpenClawToggle.app

      To start the app, run:
        open #{prefix}/OpenClawToggle.app

      Or create a symlink in /Applications:
        ln -sf #{prefix}/OpenClawToggle.app /Applications/OpenClawToggle.app

      Note: This app is unsigned. On first launch, you may need to:
        Right-click → Open → Open (to bypass Gatekeeper)
    EOS
  end

  test do
    binary = prefix/"OpenClawToggle.app/Contents/MacOS/OpenClawToggle"
    assert_predicate binary, :exist?
    assert_predicate binary, :file?, "Binary must be a file, not a directory"
    assert_predicate binary, :executable?
    assert_predicate prefix/"OpenClawToggle.app/Contents/Info.plist", :exist?
  end
end
