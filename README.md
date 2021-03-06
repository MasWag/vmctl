vmctl
=====

[![Static analysis](https://github.com/MasWag/vmctl/workflows/Static%20analysis/badge.svg)](https://github.com/MasWag/vmctl/actions?query=workflow%3A%22Static+analysis%22)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](./LICENSE)

A uniform interface to multiple virtual machines

The following types of machines are supported.

* AWS EC2
* Virtual Box

Usage
-----

See [usage manual](./doc/man.md).


Requirement
-----------

* sh
* jq
* sed
* Grep
* AWK
* aws-cli (when you manage EC2 instances)
* Virtual Box (when you manage Virtual Box instances)

Install
-------

### Using Homebrew

```bash
brew install MasWag/vmctl/vmctl
```

### From source

1. Put your configuration at ~/vmctl.json
2. Move *vmctl* to a PATH-ed place.
3. Setup vmctl_completion.bash

Format of vmctl.json
--------------------

The following fields are common.

* name: string, used to identify the machine
* type: ec2 | virtual_box, used to identify the type of machine

When fields specific to ec2 is as follows.

* instance_id: the instance\_id of the machine
* profile (optional): You can also specify the profile of aws-cli


When fields specific to virtual_box is as follows.

* instance_id: the instance\_id of the machine

A complete sample is as follows.

```
[
    {
        "name": "marisa",
        "type": "ec2",
        "instance_id": "i-0fsdfd13c7bf3d6b6",
        "profile": "sample"
    },
    {
        "name": "reimu",
        "type": "virtual_box",
        "instance_id": "95a2dsfdb-0dfbf-40bb-bf15-92df8d07c7dc"
    }
]
```

Developer Documentation
-----------------------

You can generate a document of the code using [ROBODoc](https://rfsber.home.xs4all.nl/Robo/robodoc.html). An example is as follows.

```sh
robodoc --src src/vmctl --doc vmctl --singlefile --html
```
