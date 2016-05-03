# MuraVagrant

A development environment for [MuraCMS](http://www.getmura.com) using [Vagrant](http://www.vagrantup.com).

## Prerequisites

You will need the following applications to set up the development environment:

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

## MuraCMS

You'll now be walked through MuraCMS's configuration screens.

1. Database
	* Select `MySQL` from the dropdown list
	* Use an existing database
	* Set `mura` as the datasource name
	* Leave database username blank
	* Leave database password blank

2. Admin
	* Select a new `Super Admin` username, or leave as default
	* Select a new `Super Admin` password, or leave as default
	* Set a `Super Admin` email, can not be left blank

3. Options
	* Keep `Do not use SiteID in URLs`
	* Set `Do not use "index.cfm" in URLs`


## Lucee

You can access the Lucee Admin by navigating to `local.getmura.com/lucee/admin.cfm` in your browser.
