package AlleleDatabase::Model::GetAlleleInfo;
use strict;
use warnings;
use base 'Catalyst::Model::Adaptor';

__PACKAGE__->config( 
    class       => 'MyProjectBusinessLogic::GetAlleleInfo',
    constructor => 'new',
);

1;
