package MyProjectBusinessLogic::AddAllele;

use 5.014002;

use strict;
use warnings;

use Readonly;

use MyProjectDAL::Dao;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use BusinessLogic::AddAllele':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(

) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
    _add_allele
);

our $VERSION = '0.01';

sub new{
    my $class = shift;
    my $self = {
        _dao => MyProjectDAL::Dao->new(),
    };
    bless $self, $class;
    return $self;
}

sub _add_allele{
    my ($self, $allele_type, $allele_sequence) = @_;
    
    $self->{_dao}->insert_allele($allele_type, $allele_sequence);
}

1;
__END__
