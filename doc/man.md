% VMCTL(1)
% Masaki Waga
% July 2019

# NAME

vmctl - A uniform interface to multiple virtual machines

# SYNOPSIS

    vmctl <command> <server_name> [<server_name>...]

# DESCRIPTION

The tool **vmctl** provides basic operations for multiple virtual machines. Currently it supports **AWS EC2** and **Virtual Box**.

# COMMANDS

**help**
: Show the help message.

**start**
: Start the virtual machine.

**stop**
: Stop the virtual machine.

**restart**
: Restart the virtual machine.

**status**
: Show the status of the virtual machine.

**ip**
: Get the public IP address of the virtual machine (**AWS EC2** only).

**save**
: Save the virtual machine (**Virtual Box** only).

# EXIT STATUS

0
: if there is no error.

1
: if vmctl aborted because of a user's error

2
: if vmctl aborted because of an implementation error


# FILES

~/.vmctl.json
: The configuration file of the virtual machines. See README.md for the file format.

# EXAMPLE

Assume `reimu` is the name of the virtual machine. 

We can turn on / turn off / restart `reimu` by the following.

`vmctl start reimu`

`vmctl stop reimu`

`vmctl restart reimu`

We can see the status of `reimu` (e.g., if it is running) by the following.

`vmctl status reimu`

If `reimu` is an instance of AWS EC2, we can get the global IP address of `reimu` by the following. If `reimu` is not an instance of AWS EC2, it aborts.

`vmctl ip reimu`

If `reimu` is an instance of Virtual Box, we can save the status of `reimu` by the following. If `reimu` is not an instance of Virtual Box, it aborts.

`vmctl save reimu`
