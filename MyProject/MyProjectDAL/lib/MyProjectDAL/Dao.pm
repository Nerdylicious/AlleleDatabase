package MyProjectDAL::Dao;

use 5.014002;
use strict;
use warnings;

# Set the path to the output of pwd from the last step
use lib '/home/.../MyProject/DatabaseObjects';
use AlleleDatabase::Schema;

use Readonly;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use MyProjectDAL::Dao ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
    get_allele_list
    insert_allele
);

our $VERSION = '0.01';

sub new{
    my ($class) = @_;
    my $self = {
        #you must specify the the mysql user and password here
        _schema => AlleleDatabase::Schema->connect('dbi:mysql:dbname=AlleleDatabase', 'root', 'root_password'),
    };
    bless $self, $class;
    return $self;
}

sub get_allele_list{
    my ($self) = @_;

    my @allele_list;
    my $result_set = $self->{_schema}->resultset('TblAllele');

    while(my $allele = $result_set->next){
        push @allele_list, {allele_type => $allele->allele_type,
                            allele_sequence => $allele->allele_sequence};
    }

    return \@allele_list;
}

sub insert_allele{
    my ($self, $allele_type, $allele_sequence) = @_;

    $self->{_schema}->resultset('TblAllele')->create({
        allele_type => $allele_type,
        allele_sequence => $allele_sequence,
    });
}

# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

MyProjectDAL::Dao - Perl extension for blah blah blah

=head1 SYNOPSIS

  use MyProjectDAL::Dao;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for MyProjectDAL::Dao, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Irish Medina, E<lt>irish_m@E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2014 by Irish Medina

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.


=cut
