# homebrew-mailarbiter

Homebrew tap for [Mail Arbiter](https://cranfillenterprises.com/mailarbiter), a Mac app and
browser extension that checks Gmail and Outlook messages for phishing, on your own computer.

## Install

```sh
brew install --cask cranfille/mailarbiter/mailarbiter
```

This installs the app to `/Applications` and puts the `mailarbiter` command on your PATH.
Open Mail Arbiter once from Applications; its window offers to add the browser extension.

## Uninstall

```sh
brew uninstall --cask mailarbiter
```

`brew uninstall --zap --cask mailarbiter` also removes the local database, cache and logs.

## Notes

- The download is served from `downloads.cranfillenterprises.com` and is currently limited
  to the United States.
- Privacy policy: https://cranfillenterprises.com/mailarbiter/privacy/
