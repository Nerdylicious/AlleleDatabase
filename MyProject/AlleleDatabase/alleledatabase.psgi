use strict;
use warnings;

use AlleleDatabase;

my $app = AlleleDatabase->apply_default_middlewares(AlleleDatabase->psgi_app);
$app;

