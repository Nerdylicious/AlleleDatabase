package AlleleDatabase::Form::AddAlleleForm;

use HTML::FormHandler::Moose;
use namespace::autoclean;
extends 'HTML::FormHandler';
with 'HTML::FormHandler::Widget::Theme::Bootstrap3';

has_field 'allele_type' => (
    do_label => 0,
    type => 'Text',
    size => 2,
    required => 1,
    messages => {required => 'Please enter an allele type'},
    minlength => 1,
    maxlength => 3,
    validate_method => \&check_type
);

has_field 'allele_sequence' => (
    do_label => 0,
    type => 'TextArea',
    rows => 15,
    cols => 60,
    required => 1,
    messages => {required => 'Please enter a sequence'},
    minlength => 20,
    maxlength => 5000,
    validate_method => \&check_sequence
);

sub check_sequence{
    my ($self) = @_;

    unless($self->value =~ /\A[ATCG]+\z/i){
        $self->add_error('Please enter a valid sequence');
    }
}

sub check_type{
    my ($self) = @_;

    unless($self->value =~ /^[0-9]+$/){
        $self->add_error('Please enter a valid type');
    }
    else{
        if(($self->value < 0) or ($self->value > 999)){
            $self->add_error('Please enter a type that is in range');
        }
    }
}

1;
