
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

# geodata
brew install --cask qgis
brew install spatialindex
pip3 install geopandas rtree
#brew install gdal
# last Mojave bottle: 3.3.2
#brew install --ignore-dependencies "https://raw.githubusercontent.com/Homebrew/homebrew-core/ba26d5df1d61dd960223782b1059e48c6b8ca79c/Formula/gdal.rb"
# gdal dependencies:
brew install proj@7 json-c unixodbc xerces-c netcdf libgeotiff libdap nss szip minizip && brew link proj@7
brew install --ignore-dependencies netcdf hdf5 libspatialite librttopo # don't install gcc
# poppler 21.10.0
brew install --ignore-dependencies "https://raw.githubusercontent.com/Homebrew/homebrew-core/4ac805c13b62d527f5081146e3480665806f8254/Formula/poppler.rb"
##brew install --ignore-dependencies geos
# geos 3.9.1
brew install --ignore-dependencies "https://raw.githubusercontent.com/Homebrew/homebrew-core/d4cdb31aeaa36543f21c88ef55f16f984d56f49c/Formula/geos.rb"
## cmake 3.21.3 (for geos compilation)
##brew install "https://raw.githubusercontent.com/Homebrew/homebrew-core/ede05bb6167db53cb3fba59aef35b477d2b08a94/Formula/cmake.rb"

# developing
brew install ghc
wget https://cran.r-project.org/bin/macosx/base/R-4.1.2.pkg

# brew install --cask serial
brew install --cask serial-tools

# cmdg for gmail
brew install lynx
git clone git@github.com:ThomasHabets/cmdg.git && cd cmdg && go build ./cmd/cmdg

wget https://github.com/pqrs-org/Karabiner-Elements/releases/download/v12.10.0/Karabiner-Elements-12.10.0.dmg
brew install yqrashawn/goku/goku

brew install --cask arduino
mkdir -p Documents/Arduino/tools
cd Documents/Arduino/tools
wget https://github.com/me-no-dev/EspExceptionDecoder/releases/download/1.1.0/EspExceptionDecoder-1.1.0.zip
unzip EspExceptionDecoder-1.1.0.zip
cd

#brew install --cask processing

brew install --cask ultimaker-cura
brew install --cask blender
brew install --cask unity-hub

# brew install --cask androidtool
# wget https://dl.google.com/android/repository/platform-tools-latest-darwin.zip

brew install --cask zotero

#brew install node # last Mojave bottle: 16.12.0 (17.* compile fails with overlapped-checker error)
brew install "https://raw.githubusercontent.com/Homebrew/homebrew-core/ca46e03474277de13b5152c19e19ba1e309e1ee2/Formula/node.rb"

# to avoid building from source, search for last mojave bottles here: https://github.com/Homebrew/homebrew-core/find/master
# creating your own tap still forces building from source...
#brew tap-new $USER/oldbottles
#brew extract --version="4.4_2" ffmpeg $USER/ffmpeg && brew install $USER/ffmpeg/ffmpeg@4.4_2

brew install --cask audacity

# ...so force direct install from github url instead:
#brew install ffmpeg
brew install --ignore-dependencies "https://raw.githubusercontent.com/Homebrew/homebrew-core/45dbd6f1218f65113d62f4a6ddbeb45bc27ba259/Formula/ffmpeg.rb"

# last Mojave bottle for mkvtoolnix is 53.0.0
brew install "https://raw.githubusercontent.com/Homebrew/homebrew-core/c4ae8e0509201105bf91c2b7e5094c3bf1b5ca23/Formula/mkvtoolnix.rb"
# requires fmt 7.*
brew install "https://raw.githubusercontent.com/Homebrew/homebrew-core/f281a5c6130f9e333a768a990d1a2a6f9af694d9/Formula/fmt.rb"

brew install imagemagick
# Python bindings
pip3 install Wand


## pandoc dependency cabal-install@3.6.0.0 (--ignore-dependencies)
#brew install --ignore-dependencies "https://raw.githubusercontent.com/Homebrew/homebrew-core/a12c327a13371005f5d2c385230ee01a13362130/Formula/cabal-install.rb"
## ffmpeg dependency rav1e@0.4.1
#brew install "https://raw.githubusercontent.com/Homebrew/homebrew-core/2982cc52bd881457a62c4da9527b75e932ddd68a/Formula/rav1e.rb"
#cargo-c depends on rust :build, no way around it...
## ffmpeg dependency rust@1.55
# brew install "https://raw.githubusercontent.com/Homebrew/homebrew-core/347667579396cba32881d4e728d4a99088e3877c/Formula/rust.rb"
## rust dependency cargo-c@0.9.4_1
# brew install "https://raw.githubusercontent.com/Homebrew/homebrew-core/aace28c018fabc1b5246929e03bc8181c8ce2635/Formula/cargo-c.rb"

brew install wine-stable

# editing
brew install ghostscript
# brew install pdftk-java
pip install --user pdftools.pdfposter

brew install --cask obsidian

# for pdfjam
#brew install --cask basictex

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

brew install --cask inkscape

# entertainment/gaming
brew install --cask vlc
brew install --cask steam
brew install --cask transmission # qbittorrent

# TODO recover /var/spool/cron/$USER ?

brew install --cask openscad

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


# QMK
brew install avr-gcc avrdude lsusb
brew install kicad
