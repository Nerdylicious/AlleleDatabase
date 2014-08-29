use strict;
use warnings;
use Test::More;


use Catalyst::Test 'AlleleDatabase';
use AlleleDatabase::Controller::Allele;

ok( request('/allele')->is_success, 'Request should succeed' );
done_testing();
