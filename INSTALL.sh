
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# if the initial clone fails, need to tap manually
#while [[ $? -ne 0 ]]; do
#  rm -fr $(brew --repo homebrew/core) && brew tap homebrew/core
#done

# cli
brew install bash bash-completion@2
echo "/usr/local/bin/bash" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash

brew install homeshick
yes | homeshick clone kevinstadler/dotfiles
yes | homeshick clone kevinstadler/taskwarrior-vit-config
#pip3 install marko

# for truncate
brew install coreutils
# for vipe
brew install moreutils

yes "" | ssh-keygen -t ed25519 -C "air2k17"
ssh-add -K ~/.ssh/id_ed25519

# task/project management
brew install lucassabreu/tap/clockify-cli
brew install --cask rescuetime
brew install vit # includes taskwarrior, ssh,...
# alternatively: git clone ... && pip3 install -e vit

# vim + plugins
brew install vim
mkdir -p ~/.vim/pack/plugins/start
cd ~/.vim/pack/plugins/start
git clone git@github.com:vimwiki/vimwiki.git && cd vimwiki && git checkout dev
git clone git@github.com:vim-airline/vim-airline.git
git clone https://github.com/airblade/vim-gitgutter.git
git clone git@github.com:tpope/vim-fugitive.git
git clone git@github.com:tpope/vim-commentary.git
git clone git@github.com:tpope/vim-surround.git
git clone --depth=1 https://github.com/ervandew/supertab.git
git clone https://github.com/mattn/emmet-vim.git
# need to run ":helptags ALL" to rebuild help pages

brew install unar # rar

# messengers
brew install --cask discord
brew install --cask signal
brew install --cask skype
brew install --cask zoom

# developing
brew install --cask arduino
brew install --cask qgis
#brew install --cask processing

# brew install --cask ultimaker-cura
brew install --cask blender
brew install --cask unity-hub

# to avoid building from source, search for last mojave bottles here: https://github.com/Homebrew/homebrew-core/find/master
# creating your own tap still forces building from source...
#brew tap-new $USER/oldbottles
#brew extract --version="4.4_2" ffmpeg $USER/ffmpeg && brew install $USER/ffmpeg/ffmpeg@4.4_2

# ...so force direct install from github url instead:
#brew install ffmpeg
brew install --ignore-dependencies "https://raw.githubusercontent.com/Homebrew/homebrew-core/45dbd6f1218f65113d62f4a6ddbeb45bc27ba259/Formula/ffmpeg.rb"

#brew install imagemagick
brew install --ignore-dependencies "https://raw.githubusercontent.com/Homebrew/homebrew-core/19e8fdd2de4e6e8efc49f987bbb10340e9c3a483/Formula/imagemagick.rb"
brew install libomp liblqr

## pandoc dependency cabal-install@3.6.0.0 (--ignore-dependencies)
#brew install --ignore-dependencies "https://raw.githubusercontent.com/Homebrew/homebrew-core/a12c327a13371005f5d2c385230ee01a13362130/Formula/cabal-install.rb"
## ffmpeg dependency rav1e@0.4.1
#brew install "https://raw.githubusercontent.com/Homebrew/homebrew-core/2982cc52bd881457a62c4da9527b75e932ddd68a/Formula/rav1e.rb"
#cargo-c depends on rust :build, no way around it...
## ffmpeg dependency rust@1.55
# brew install "https://raw.githubusercontent.com/Homebrew/homebrew-core/347667579396cba32881d4e728d4a99088e3877c/Formula/rust.rb"
## rust dependency cargo-c@0.9.4_1
# brew install "https://raw.githubusercontent.com/Homebrew/homebrew-core/aace28c018fabc1b5246929e03bc8181c8ce2635/Formula/cargo-c.rb"

# editing
brew install ghostscript
brew install pdftk-java
brew install --cask scribus
brew install --cask wkhtmltopdf
# brew extract --version="2.14.2" pandoc $USER/oldbottles && brew install $USER/oldbottles/pandoc@2.14.2
brew install "https://raw.githubusercontent.com/Homebrew/homebrew-core/849640e3a0db9942ac1b24a2b1c347cf7941b896/Formula/pandoc.rb"

brew install wget
cd ~/Library/Fonts
wget "https://github.com/IBM/plex/releases/download/v6.0.0/TrueType.zip"
unzip TrueType.zip
mv TrueType/*/*.ttf .
rm -rf TrueType*

# entertainment/gaming
brew install --cask vlc
brew install --cask steam
brew install --cask transmission # qbittorrent

# TODO recover /var/spool/cron/$USER ?
