cask "raycast" do
  version "1.52.0"
  sha256 "5e0de474e0c1cb43d2677dc2fd87bd4ab6e7baae875496d216075dba70100f52"

  url "https://releases.raycast.com/releases/#{version}/download?build=universal"
  name "Raycast"
  desc "Control your tools with a few keystrokes"
  homepage "https://raycast.com/"

  livecheck do
    url :url
    regex(/Raycast[._-]v?(\d+(?:\.\d+)+)(?:[._-](\h+))[._-]universal\.dmg/i)
    strategy :header_match
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Raycast.app"

  uninstall quit: "com.raycast.macos"

  zap trash: [
    "~/Library/Application Support/com.raycast.macos",
    "~/Library/Caches/com.raycast.macos",
    "~/Library/Cookies/com.raycast.macos.binarycookies",
    "~/Library/Preferences/com.raycast.macos.plist",
  ]
end
