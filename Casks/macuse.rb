cask "macuse" do
  version "2026.10.15"
  sha256 "a4232fdceac0bff7bf246b18ee64a19e6223fb1f3187b4f4b0f9601a8ac277d7"

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
