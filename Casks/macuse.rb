cask "macuse" do
  version "2026.10.1"
  sha256 "284406ab630a0d1d99177ff1d5cb583b30d0986cce94d47f1b5c02148d14ee4b"

  url "https://github.com/radutopala/macuse/releases/download/v#{version}/macuse_#{version}_macos.zip"
  name "macuse"
  desc "Lets AI agents use your apps, with your approval"
  homepage "https://github.com/radutopala/macuse"

  # The app updates itself.
  auto_updates true
  depends_on macos: ">= :ventura"

  app "macuse.app"
  # The CLI is the app's own binary, which holds the privacy grants.
  binary "#{appdir}/macuse.app/Contents/MacOS/macuse"

  uninstall launchctl: "io.github.radutopala.macuse",
            quit:      "io.github.radutopala.macuse"

  zap trash: [
    "~/Library/Application Support/macuse",
    "~/Library/Logs/macuse",
  ]
end
