# Post-Reformat Guide for OSX

* Install any pending updates
* Download Google Chrome
* Set default shell to bash because I haven't joined the zsh hype-train yet: `chsh -s /bin/bash`
* Set hostname:
```bash
NEW_HOSTNAME="name"
scutil --set ComputerName "$NEW_HOSTNAME"
scutil --set LocalHostName "$NEW_HOSTNAME"
scutil --set HostName "$NEW_HOSTNAME"
scutil --get HostName
```

## Homebrew
1. Install homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
2. ```brew install awscli azure-cli bettercap boost circleci coreutils csvkit dockutil dos2unix fzf git gnu-sed gnu-getopt htop hugo icdiff icu4c iftop ipython jq libusb magic-wormhole mtr p7zip romkatv/powerlevel10k/powerlevel10k proxychains-ng pv ripgrep shellcheck socat source-highlight sqlite hudochenkov/sshpass/sshpass tmux tree watch wget xz yamllint zsh-syntax-highlighting```
3. `$(brew --prefix)/opt/fzf/install` # Install fzf

## Clear out the dock
```bash
for item in $(dockutil --list | cut -f 1);
  do
  dockutil --remove "$item" --allhomes
done
```

## Finder
* Show Hard Disks on the Desktop
* Customize finder toolbar to include Path button
* Right click desktop > Sort by > Snap to grid

## Install Nano w/ Syntax Highlighting
```bash
wget https://www.nano-editor.org/dist/v4/nano-4.9.3.tar.gz
tar -xvf nano-4.9.3.tar.gz
cd nano-4.9.3
./configure --prefix=/usr/local/
sudo make
sudo make install
echo "You're about to curl a file (https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh) and pipe it to sh. You have 10 seconds to abort..."
sleep 10
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
```

## Install TinkerTool and import the [config](files/tinkertool.ttps)
https://www.bresink.com/osx/TinkerTool.html

## Install HEIC image conversion quick action
[HEIC->PNG.workflow](files/HEIC->PNG.workflow.zip)

## Transfer over data
* SSH Keys/config
* [Github personal access token](https://github.com/settings/tokens/)
* Keychains
* Re-install printer
* [dotfiles](dotfiles/)
* [ut](files/ut) (CLI time converter)
  * `sudo cp ut /usr/local/bin/ut`
* sudo_local
  * `sudo cp sudo_local /etc/pam.d/`

## Security Software
* Little Snitch: https://obdev.at/products/littlesnitch/download.html
* Wireguard: https://apps.apple.com/us/app/wireguard/id1441195209
* BlockBlock: https://objective-see.com/products/blockblock.html
* What's Your Sign: https://objective-see.com/products/whatsyoursign.html
* ReiKey: https://objective-see.com/products/reikey.html
* Netiquette: https://objective-see.com/products/netiquette.html
* Task Explorer: https://objective-see.com/products/taskexplorer.html
* 1Password: https://1password.com/downloads/mac/
* 1Password Chrome Extension: https://chrome.google.com/webstore/detail/1password-extension-deskt/aomjjhallfgjeglblehebfpbcfeobpgk?hl=en

## Misc
```bash
## Disable paging in git
git config --global pager.branch false

## Disable text drag and drop
defaults write -g NSDragAndDropTextDelay -int -1

## Nano is best
git config --global core.editor "/usr/local/bin/nano"
 
## Don't rebase during git pull
git config pull.rebase false --global

## Don't ask to push the current branch to upstream
git config --global push.default current
 
## Create a global .gitignore file
echo .DS_Store >> ~/.gitignore_global && git config --global core.excludesfile ~/.gitignore_global
 
## Show hidden files
defaults write com.apple.finder AppleShowAllFiles YES
 
## Install python virtualenv
python3 -m pip install --user --upgrade virtualenv

## Symlink ovftool into /usr/local/bin
sudo ln -s "/Applications/VMware Fusion.app/Contents/Library/VMware OVF Tool/ovftool" "/usr/local/bin/ovftool"
 ```
* [Allow TouchID to be used for sudo](https://www.imore.com/how-use-sudo-your-mac-touch-id)
* [Allow Apple Watch to be used for sudo](https://github.com/biscuitehh/pam-watchid)
  * To make this work, the content of Line 4 of the makefile needs to be the output from `swift -version | grep Target`
* Every OS software update will remove these PAM modifications. You can run the following to fix it (assuming gsed is installed):
```
if ! grep 'pam_tid' /etc/pam.d/sudo >/dev/null; then
  sudo gsed -i 's/# sudo: auth account password session/# sudo: auth account password session\nauth       sufficient     pam_tid.so\nauth       sufficient     pam_watchid.so/g' /etc/pam.d/sudo
fi
```
```
# Contents of /private/etc/pam.d/sudo
auth       sufficient     pam_tid.so
auth       sufficient     pam_watchid.so
auth       sufficient     pam_smartcard.so
auth       required       pam_opendirectory.so
account    required       pam_permit.so
password   required       pam_deny.so
session    required       pam_permit.so
```
* Remove old Mac from AppleID account
* Accessibility > Display > Reduce motion
* Dock: Minimize using scale effect

---

## Apps
#### Many can be installed from https://macapps.link/ if you trust it

### Multimedia
* Spotify
* VLC

### Utilities
* Flux
* Obsidian
* Carbon Copy Cloner
* aText
* Microsoft Remote Desktop
    * Restore data from `~/Library/Containers/com.microsoft.rdc.macos`
* [Acme.sh](https://github.com/acmesh-official/acme.sh)
* [Grand Perspective](https://apps.apple.com/us/app/grandperspective/id1111570163?mt=12)
* CyberChef

### Security
* Wireshark
* Nmap
* Shodan
    * `pip3 install --user shodan`
    * `shodan init <api_key>`

### Productivity
* Dropbox
* Spectacle
  * Restore data from `~/Library/Application Support/Spectacle/Shortcuts.json`
* [iStat Menus](configs/iStat.ismp) 
* Slack
* Zoom
* Chrome
    * Restore profile from `~/Library/Application Support/Google/Chrome`

### Developer
* [VSCode](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)
* [iTerm2](configs/iTerm.json)
    * Install shell integration
* Golang

### DevOps
* Docker

---

## Keyboard / Trackpad settings
1. Increase key repeat speed
2. Shorten delay
3. Change function keys
4. Update Mission Control hotkeys
5. Add an app shortcut for Lock Screen
6. Add Japanese as an input source

![](img/kb1.png)
![](img/kb2.png)
![](img/kb3.png)
![](img/tp1.png)
![](img/tp2.png)
![](img/tp3.png)

--- 


## Set some desired Mac Defaults
## Sourced from https://github.com/mathiasbynens/dotfiles/blob/master/.macos

```
# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 35

# Show language menu in the top right corner of the boot screen
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show the ~/Library folder
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes
```
