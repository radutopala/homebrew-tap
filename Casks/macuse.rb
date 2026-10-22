cask "macuse" do
  version "2026.10.17"
  sha256 "3d34225469527e3e0337251fd13d2c45532e9a537a353715a4e10cda2b9c7669"

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
