cask "mailarbiter" do
  version "0.1.0"
  sha256 "f6142e8fd690c812ad382003873aae8b42c3be813a7f3756c0fcf39567d9fdc6"

  url "https://downloads.cranfillenterprises.com/MailArbiter-#{version}.dmg"
  name "Mail Arbiter"
  desc "Checks Gmail and Outlook messages for phishing with a local service"
  homepage "https://cranfillenterprises.com/mailarbiter"

  livecheck do
    skip "Versions are bumped by hand when a release is uploaded"
  end

  depends_on macos: :ventura

  app "MailArbiter.app"
  binary "#{appdir}/MailArbiter.app/Contents/Resources/bin/mailarbiter"

  # The app quits first, then removes its login registration and the browser
  # native messaging manifests it wrote (only its own; see cli/browser_extensions.py).
  uninstall quit:   "com.cranfillenterprises.mailarbiter",
            script: [
              {
                executable: "#{appdir}/MailArbiter.app/Contents/MacOS/MailArbiter",
                args:       ["--agent", "unregister"],
              },
              {
                executable: "#{appdir}/MailArbiter.app/Contents/Resources/python/bin/python3.12",
                args:       ["-B", "-I", "-m", "cli.browser_extensions", "uninstall"],
              },
            ]

  # zap also removes the local corpus database and the cache.
  zap trash: [
    "~/.cache/mailarbiter",
    "~/.local/share/mailarbiter",
    "~/Library/Caches/com.cranfillenterprises.mailarbiter",
    "~/Library/HTTPStorages/com.cranfillenterprises.mailarbiter",
    "~/Library/Logs/MailArbiter",
    "~/Library/Preferences/com.cranfillenterprises.mailarbiter.plist",
  ]

  caveats <<~EOS
    Open Mail Arbiter once from Applications. Its window offers to add the browser
    extension and starts the background service. From a terminal:

      mailarbiter --help
  EOS
end
