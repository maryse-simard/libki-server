use utf8;

package Libki::Schema::DB;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;

# Created by DBIx::Class::Schema::Loader v0.07022 @ 2012-05-04 09:16:55
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cpTh6RhuHr1lLgfpUkL45A

our $VERSION = '2.00.00.00';

__PACKAGE__->load_components('+DBIx::Class::Schema::Versioned');

use FindBin;
__PACKAGE__->upgrade_directory("$FindBin::Bin/../../migration");

sub ddl_filename {
    my ( $self, $type, $version, $dir, $preversion ) = @_;

    my $dir = File::Spec->catdir( $dir, $version );
    mkdir( $dir );
    my $filename = File::Spec->catfile( $dir, "$type.sql" );
    $filename =~ s/$version/$preversion-$version/ if ($preversion);
    
    return $filename;
}

1;

=head1 AUTHOR

Kyle M Hall <kyle@kylehall.info> 

=cut

=head1 LICENSE

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the  
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.   

=cut
