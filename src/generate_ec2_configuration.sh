#!/bin/sh -u

# Copyright (c) 2020 Masaki Waga
#
# This file is part of vmctl.
#
# Vmctl is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Vmctl is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with vmctl.  If not, see <http://www.gnu.org/licenses/>.
#
#****h* vmctl/generate_ec2_configuration
# NAME
#  generate_ec2_configuration
# SYNOPSIS
#  generate_ec2_configuration [<profile>]
# DESCRIPTION
#  Generates the configuration for the ec2 instances
#
# EXAMPLE
#  generate_ec2_configuration.sh > ~/.vmctl.json
#
# PORTABILITY
#  We need jq <https://stedolan.github.io/jq/> and aws-cli
#******

if [ $# -gt 0 ]; then
    readonly PROFILE="$1"
else
    readonly PROFILE=default
fi

# shellcheck disable=SC2016
aws ec2 describe-instances --profile "$PROFILE" --query 'Reservations[*].Instances[*].[InstanceId,Tags[?Key==`Name`].Value|[0]]|[]' |
    jq --arg profile "$PROFILE" 'map({"type": "ec2", "profile": $profile, "instance_id": .[0], "name": .[1]})'
