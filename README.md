# Prerequisites

## Install Vagrant

Obviously, you need to install [Vagrant](http://www.vagrantup.com/), which requires Ruby and VirtualBox.

## Create a working directory and start your new environment

    $ git clone git://github.com/JulienD/vagrant.git my-vagrant
    $ cd my-vagrant
    $ vagrant up

If you want to change the configuration of your box, edit the Vagrantfile file which collect all the settings of your new virtual machin.

# Provisionning

If you want to automate the provisionning of your box, have a look on [my puppet repositroy](https://github.com/JulienD/puppet-modules)


# Performing shell commands on your box from your host machine

This little shell script allows you to perform commands in the box from your host machine without having to connect via ssh to it. This command is really simple, if the first argument passed is not the name of a Vagrant command, the argument is considered as a command to be executed on the box through ssh.

## How to install

Edit your .bash_profile located in your home directory and put the following code at the bottom.

In order to make this code working you have to:
  - rename PROJECT as you wish. This will be your command name, so try something useful and easy to remember.
  - define the path of your vagrant directory to tell to the script where is your project. Rename project_dir variable.

## How to use it
  - project help
  - project up
  - project whoami
</ul>

```shell
# Vagrant command
#
PROJECT () {
  # Absolute path of your vagrant box.
  project_dir=$HOME/src/vagrant/vagrant

  cd $project_dir
  if vagrant help | grep -q "$1"; then
    vagrant "$@";
  else
    vagrant ssh -c "$*";
  fi
  cd $OLDPWD
}
```