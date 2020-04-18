# Roles
Brief descriptions of the contained roles; more detailed information should be inside each role's directory

## setup - Creates default facts to use in following roles

## base - Create files and install packages needed by all other roles
- Creates ~/applications and ~/bin
  - Used as installation and executable directories for manually installed applications
- Installs and configures git 
  - Needed to install some packages in other roles
- Install basic package manager configurations 
  - apt when on linux
  - homebrew when on macOS
- Install extra fonts into the system
- Adds a default python/pip installation (on linux, where it might not be installed)

## shell - Configures the default system shell (bash)
- Installs the latest bash and bash-completion version available via package manager
- Links a configured .bashrc file and a .bashrc.d folder for application-specific scripts
- Installs and configures liquidprompt as default prompt

## cli - Installs common command-line applications
  Installs: 
  - [TLDR](https://tldr.sh/)
  - [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)
  - [fzf](https://github.com/junegunn/fzf)
  - [thefuck](https://github.com/nvbn/thefuck)
  - [fpp](https://github.com/facebook/PathPicker)
  - [go-jira](https://github.com/go-jira/jira)

## dev - Installs packages related to software development 
All packages are installed in separate sub-roles:
- dev/aws

  Installs awscli, aws-adfs and cfn-lint
- dev/python
  
  Installs:
    - [jedi](https://github.com/davidhalter/jedi), [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/) and [pipenv](https://github.com/pypa/pipenv) on system python
    - [pyenv](https://github.com/pyenv/pyen) for python version configuration by project
- dev/docker

  Installs docker (on linux), docker-compose and the ECR credential helper
- dev/nodejs

  Installs the latest versions of nodejs and nvm, and yarn and eslint as system-wide packages
- dev/hg
  - Installs [Mercurial](https://www.mercurial-scm.org) with [Watchman](https://github.com/facebook/watchman) and the [FsMonitor Extension](https://www.mercurial-scm.org/wiki/FsMonitorExtension) enabled for performance

## vim - For those who can't quit using it!
- Installs neovim, actually, but most configurations support vim 8
- Installs vim plugin dependencies such as exuberant-ctags when needed
- Links initial configuration and os-specific config to ~/.config/nvim
  - Such as mapping `<leader>` to \` on OSX instead of `\`
- Links a folder to .vim with
  - vim-plug
  - an excessively large .vimrc
  - custom snippets for Ultisnips
- Configures python2 and python3 providers via pyenv
- Installs vim plugins

## xorg - X customizations go here (ubuntu only)
- Adds support for the Logitech t650 touchpad
- Adds a few custom keymaps for å/Å

## i3 - Installs the i3 window manager and associated packages (ubuntu only)
Installs i3 with:
 - nitrogen for wallpapers
 - rofi and/or j4-dmenu-desktop as dmenu replacements
 - i3blocks for the statusbar
 - dunst for notifications
 - lxappearance to configure gtk appplications' appearance
 - and extra configs for most of those

## desktop - Installs common GUI applications (ubuntu only)
Installs:
  - nextcloud client (via PPA)
  - dropbox (via official link to .deb)
  - firefox dev edition (via mozilla.org) 
  - audacity
  - caffeine
  - chromium-browser
  - file-roller
  - firefox
  - gimp
  - gnucash
  - inkscape
  - keepassx
  - libreoffice
  - meld
  - redshift-gtk
  - speedcrunch
  - terminator
  - thunar
  - transmission-gtk
  - vlc
