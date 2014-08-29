package AlleleDatabase::Controller::Allele;
use Moose;
use namespace::autoclean;
use AlleleDatabase::Form::AddAlleleForm;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

AlleleDatabase::Controller::Allele - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched AlleleDatabase::Controller::Allele in Allele.');
}

sub list :Local{
    my ($self, $c) = @_;

    my $obj = $c->model('GetAlleleInfo');
    my $allele_list = $obj->_get_allele_list();

    $c->stash(template => 'allele/list.tt2', allele_list => $allele_list);
}

sub add :Local{
    my ($self, $c) = @_;

    my $form = AlleleDatabase::Form::AddAlleleForm->new;
    $c->stash(template => 'allele/AddAlleleForm.tt2', form => $form);

    $form->process(params => $c->request->params);
    return unless $form->validated;

    my $allele_type = $c->request->params->{allele_type};
    my $allele_sequence = $c->request->params->{allele_sequence};

    my $obj = $c->model('AddAllele');
    $obj->_add_allele($allele_type, $allele_sequence);

    $c->response->redirect($c->uri_for($self->action_for('list')));
}

=encoding utf8

=head1 AUTHOR

Irish Medina

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
