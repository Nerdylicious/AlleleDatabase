package AlleleDatabase::Model::AddAllele;
use strict;
use warnings;
use base 'Catalyst::Model::Adaptor';

__PACKAGE__->config( 
    class       => 'MyProjectBusinessLogic::AddAllele',
    constructor => 'new',
);

1;
