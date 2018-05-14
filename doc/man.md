% VMCTL(1)
% Masaki Waga
% May 2018

# NAME

vmctl - A uniform interface to multiple virtual machines

# SYNOPSIS

    vmctl <command> <server_name>

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
