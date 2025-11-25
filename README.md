# dotfiles-mac
dotfiles for my Mac, hopefully find a way to take a note on how to set it ground up as well e

PUT SHORTCUTS on .skhdrc instead of any other custom places provided by raycast or aerospace

#ToDo
- dotfiles installation manual / sh script
- sh script for sketchy bar and figure out what kind of design do I want to use for it
- fix overlapping logo on sketchybar
- turn the sketchybar's right to be clickable, preferably if a menu could pop out

install [brew](https://brew.sh) and install git
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
follow brewinstruction
install necessary packages
```
brew install git
brew install lazygit
brew install neovim
brew install stow
```
if you're repo owner :
auth git
```
ssh-keygen -t rsa -b 4096 -C "demonlordx777@gmail.com"
git config --global user.email "demonlordx777@gmail.com"
git config --global user.name "DMelisena"
```
```
git clone git@github.com/DMelisena/dotfiles-mac.git
```
set up key [key](https://github.com/settings/keys)
if not :
```
git clone https://github.com/DMelisena/dotfiles.git
cd dotfiles
stow .
```
delete or backup existing data if needed

install twm
```
brew tap FelixKratz/formulae
brew install sketchybar
brew services start sketchybar
brew install --cask nikitabobko/tap/aerospace

```
run aerospace from cmd+space
