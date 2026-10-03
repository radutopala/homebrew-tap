cask "macuse" do
  version "2026.10.2"
  sha256 "dbd6e60ef49fda03ed10398e303d1b6f3a98045ef90eaba768adf5aacdffc28b"

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
