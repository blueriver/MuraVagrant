# MuraVagrant

A development environment for [MuraCMS](http://www.getmura.com) using [Vagrant](http://www.vagrantup.com).

## Prerequisites

You will need the following applications to setup the Ghost development environment:

- [Vagrant](http://www.vagrantup.com/downloads.html)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Git](https://git-scm.com/downloads)

## Setup

To get started with the MuraCMS development environment, you will first need to clone (or download) this repo and navigate into it:

```bash
git clone git@github.com:blueriver/MuraVagrant.git
cd MuraVagrant
```

Now spin up the Vagrant image:

```bash
vagrant up
```

Once the VM has been automatically provisioned, you can now access MuraCMS by navigating to `local.getmura.com` in your browser.
