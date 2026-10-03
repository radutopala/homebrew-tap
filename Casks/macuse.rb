cask "macuse" do
  version "2026.10.9"
  sha256 "e6f54cf2e79e75a084d273c687dfe1a539f1b331edd501d41f1766bd7a50a0d0"

  url "https://github.com/radutopala/macuse/releases/download/v#{version}/macuse_#{version}_macos.zip"
  name "macuse"
  desc "Lets AI agents use your apps, with your approval"
  homepage "https://github.com/radutopala/macuse"

  # The app updates itself.
  auto_updates true
  depends_on macos: ">= :ventura"

  app "MacUse.app"
  # The CLI is the app's own binary, which holds the privacy grants.
  binary "#{appdir}/MacUse.app/Contents/MacOS/macuse"

  uninstall launchctl: "io.github.radutopala.macuse",
            quit:      "io.github.radutopala.macuse"

  zap trash: [
    "~/.macuse",
    "~/Library/Application Support/macuse",
    "~/Library/Logs/macuse",
  ]
end
