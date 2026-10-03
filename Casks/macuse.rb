cask "macuse" do
  version "2026.10.4"
  sha256 "040ab3749d71b7d60d132f65c5fa7d51f55d4329d9e52bf8717ee69c5f667487"

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
    "~/.macuse",
    "~/Library/Application Support/macuse",
    "~/Library/Logs/macuse",
  ]
end
