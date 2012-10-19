Neil's dotfiles
===============

Installation
------------

This repository is meant to be cloned into its own directory. It can be cloned
anywhere but I put it in ~/src/dotfiles.

To set it up once cloned, run the following:

    git clone git://github.com/spladug/dotfiles.git ~/src/dotfiles/
    sh ~/src/dotfiles/setup.sh

The setup script assumes a debian-based distribution and will install the
necessary prerequisites as well as set up the vim modules. Symbolic links will
be created from your home directory  to the individual files in the repo.
