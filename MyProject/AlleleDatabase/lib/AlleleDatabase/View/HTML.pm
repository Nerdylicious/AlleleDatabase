package AlleleDatabase::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    # Change default TT extension
    TEMPLATE_EXTENSION => '.tt2',
    render_die => 1,
);

=head1 NAME

AlleleDatabase::View::HTML - TT View for AlleleDatabase

=head1 DESCRIPTION

TT View for AlleleDatabase.

=head1 SEE ALSO

L<AlleleDatabase>

=head1 AUTHOR

Irish Medina

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
