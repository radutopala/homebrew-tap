cask "macuse" do
  version "2026.10.5"
  sha256 "4a468a05dd22b00ecbeecfb01f95a137b2c7c77681738849b749c11c85af053f"

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
