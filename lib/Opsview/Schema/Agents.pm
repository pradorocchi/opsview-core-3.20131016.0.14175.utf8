package Opsview::Schema::Agents;

use strict;
use warnings;

use base 'Opsview::DBIx::Class';

__PACKAGE__->load_components( "+Opsview::DBIx::Class::Common", "Core" );
__PACKAGE__->table( __PACKAGE__->opsviewdb . ".agents" );
__PACKAGE__->add_columns(
    "id",
    {
        data_type     => "INT",
        default_value => undef,
        is_nullable   => 0,
        size          => 11
    },
    "parent",
    {
        data_type     => "INT",
        default_value => undef,
        is_nullable   => 1,
        size          => 11
    },
    "name",
    {
        data_type     => "VARCHAR",
        default_value => "",
        is_nullable   => 0,
        size          => 128
    },
    "priority",
    {
        data_type     => "INT",
        default_value => undef,
        is_nullable   => 1,
        size          => 11
    },
    "command",
    {
        data_type     => "VARCHAR",
        default_value => undef,
        is_nullable   => 1,
        size          => 255,
    },
);
__PACKAGE__->set_primary_key( "id" );
__PACKAGE__->add_unique_constraint( "name", ["name"] );
__PACKAGE__->has_many(
    "agentplugins",
    "Opsview::Schema::Agentplugins",
    { "foreign.agentid" => "self.id" },
);
__PACKAGE__->belongs_to( "parent", "Opsview::Schema::Agents",
    { id => "parent" }
);
__PACKAGE__->has_many( "agents", "Opsview::Schema::Agents",
    { "foreign.parent" => "self.id" },
);
__PACKAGE__->has_many(
    "servicechecks",
    "Opsview::Schema::Servicechecks",
    { "foreign.agent" => "self.id" },
);

# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-09-17 13:24:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AXZ7H0FwgyiM7KzdsJOxKg
#
# AUTHORS:
#	Copyright (C) 2003-2013 Opsview Limited. All rights reserved
#
#    This file is part of Opsview
#
#    Opsview is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    Opsview is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with Opsview; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

# You can replace this text with custom content, and it will be preserved on regeneration
1;
