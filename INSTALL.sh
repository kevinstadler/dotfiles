/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install homeshick
yes | homeshick clone kevinstadler/dotfiles

# keyboard
brew install --cask ukelele

# editing / journalling / task+project management
brew install --cask obsidian
launchctl load -w ~/Library/LaunchAgents/obsidian-vault-backup.plist
brew install --cask rescuetime
brew install --cask zotero

# design
brew install --cask gimp inkscape scribus
brew install fnt
fnt update
fnt install dseg

cd ~/Library/Fonts
wget "https://github.com/IBM/plex/releases/download/v6.1.1/TrueType.zip"
unzip TrueType.zip
mv TrueType/*/*.ttf .
rm -rf TrueType*
wget "https://www.cdnfonts.com/download/adobe-clean-cdnfonts.zip"
unzip adobe-clean-cdnfonts.zip
mv adobe-clean-cdnfonts/*.otf .
rm -rf adobe-clean-cdnfonts*


# 3d fabrication
brew install --cask openscad prusaslicer ultimaker-cura
brew install --cask kicad
brew install --cask blender
brew install --cask cycling74-max
#brew install --cask unity-hub
# brew install --cask androidtool
# wget https://dl.google.com/android/repository/platform-tools-latest-darwin.zip

# dev
brew install wget
brew install --cask balenaetcher
brew install zsh-completions
compaudit | xargs chmod g-w
brew install dosfstools
brew install --cask thonny
brew install node
brew install --cask android-studio

brew install --cask android-platform-tools

# qmk
brew install qmk/qmk/qmk
brew install avr-gcc #@8 avrdude lsusb

brew tap homebrew/cask-drivers
brew install --cask qmk-toolbox
## arduino: manually for 2.* version
#brew install --cask processing

# vim + plugins
#brew install vim
# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.vim/pack/plugins/start
cd ~/.vim/pack/plugins/start
#git clone git@github.com:vimwiki/vimwiki.git && cd vimwiki && git checkout dev
git clone git@github.com:vim-airline/vim-airline.git
#git clone https://github.com/airblade/vim-gitgutter.git
#git clone git@github.com:tpope/vim-fugitive.git
git clone git@github.com:tpope/vim-commentary.git
#git clone git@github.com:tpope/vim-surround.git
#git clone --depth=1 https://github.com/ervandew/supertab.git
#git clone https://github.com/mattn/emmet-vim.git
# need to run ":helptags ALL" to rebuild help pages

# messengers
brew install --cask discord signal zoom
#brew install --cask skype

# geodata
brew install --cask qgis
#brew install spatialindex
#pip3 install geopandas rtree
#brew install gdal
# gdal dependencies:
#brew install proj@7 json-c unixodbc xerces-c netcdf libgeotiff libdap nss szip minizip && brew link proj@7
#brew install --ignore-dependencies netcdf hdf5 libspatialite librttopo # don't install gcc
# poppler 21.10.0
#brew install --ignore-dependencies "https://raw.githubusercontent.com/Homebrew/homebrew-core/4ac805c13b62d527f5081146e3480665806f8254/Formula/poppler.rb"
##brew install --ignore-dependencies geos
# geos 3.9.1
#brew install --ignore-dependencies "https://raw.githubusercontent.com/Homebrew/homebrew-core/d4cdb31aeaa36543f21c88ef55f16f984d56f49c/Formula/geos.rb"
## cmake 3.21.3 (for geos compilation)
##brew install "https://raw.githubusercontent.com/Homebrew/homebrew-core/ede05bb6167db53cb3fba59aef35b477d2b08a94/Formula/cmake.rb"

# audio / video / entertainment / gaming
brew install --cask audacity vlc
brew install ffmpeg
brew install --cask qbittorrent # transmission






#brew install ghostscript
# brew install pdftk-java
#pip install --user pdftools.pdfposter

# for pdfjam
#brew install --cask basictex

brew install --cask wkhtmltopdf
# brew extract --version="2.14.2" pandoc $USER/oldbottles && brew install $USER/oldbottles/pandoc@2.14.2


# cli
brew install bash bash-completion@2
echo "/usr/local/bin/bash" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash

#pip3 install marko

# for truncate
brew install coreutils
# for vipe
brew install moreutils

yes "" | ssh-keygen -t ed25519 -C "air2k17"
ssh-add -K ~/.ssh/id_ed25519

brew install lucassabreu/tap/clockify-cli
#brew install vit # includes taskwarrior, ssh,...
# alternatively: git clone ... && pip3 install -e vit

brew install unar # rar

# developing
brew install ant
brew install ghc
wget https://cran.r-project.org/bin/macosx/base/R-4.1.2.pkg

# brew install --cask serial
#brew install --cask serial-tools

# cmdg for gmail
#brew install lynx
#git clone git@github.com:ThomasHabets/cmdg.git && cd cmdg && go build ./cmd/cmdg

wget https://github.com/pqrs-org/Karabiner-Elements/releases/download/v12.10.0/Karabiner-Elements-12.10.0.dmg
brew install yqrashawn/goku/goku

brew install --cask arduino
mkdir -p Documents/Arduino/tools
cd Documents/Arduino/tools
wget https://github.com/me-no-dev/EspExceptionDecoder/releases/download/1.1.0/EspExceptionDecoder-1.1.0.zip
unzip EspExceptionDecoder-1.1.0.zip
cd

#brew install node # last Mojave bottle: 16.12.0 (17.* compile fails with overlapped-checker error)
brew install "https://raw.githubusercontent.com/Homebrew/homebrew-core/ca46e03474277de13b5152c19e19ba1e309e1ee2/Formula/node.rb"

brew install imagemagick
# Python bindings
pip3 install Wand


## pandoc dependency cabal-install@3.6.0.0 (--ignore-dependencies)
#brew install --ignore-dependencies "https://raw.githubusercontent.com/Homebrew/homebrew-core/a12c327a13371005f5d2c385230ee01a13362130/Formula/cabal-install.rb"

brew install wine-stable

brew install "https://raw.githubusercontent.com/Homebrew/homebrew-core/849640e3a0db9942ac1b24a2b1c347cf7941b896/Formula/pandoc.rb"

# entertainment/gaming
# brew install --cask steam

# TODO recover /var/spool/cron/$USER ?

## set preview printing to default to 100% instead of fit-to-page
defaults write com.apple.Preview PVImagePrintingScaleMode -bool FALSE

# for Lindabrunn
brew install --cask oracle-jdk

# for Jekyll
brew install chruby ruby-install xz
ruby-install ruby

echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.bash_profile
echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.bash_profile
echo "chruby ruby-3.1.2" >> ~/.bash_profile # run 'chruby' to see actual version
# https://github.com/jekyll/jekyll/issues/8523


brew install kicad

# https://github.com/innocenat/kindle-epub-fix

# for blocking Adobe
brew install --cask lulu
