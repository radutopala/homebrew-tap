cask "macuse" do
  version "2026.10.3"
  sha256 "a2bc44882e3f57d04f393eb42dc963df3cbc35adfc7956c31e6f3da58eb57af5"

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
