use 5.006;

package MouseX::App::Cmd::Command;
use Mouse;

# VERSION
use namespace::clean -except => 'meta';
extends 'MooseX::App::Cmd::Command';
__PACKAGE__->meta->make_immutable();   ## no critic (RequireExplicitInclusion)
no Mouse;
1;

# ABSTRACT: Base class for MouseX::Getopt based App::Cmd::Commands

=head1 SYNOPSIS

    use Mouse;

    extends qw(MouseX::App::Cmd::Command);

    # no need to set opt_spec
    # see MouseX::Getopt for documentation on how to specify options
    has option_field => (
        isa => 'Str',
        is  => 'rw',
        required => 1,
    );

    sub execute {
        my ( $self, $opts, $args ) = @_;

        print $self->option_field; # also available in $opts->{option_field}
    }

=head1 DESCRIPTION

This is a replacement base class for L<App::Cmd::Command|App::Cmd::Command>
classes that includes
L<MouseX::Getopt|MooseX::Getopt> and the glue to combine the two.

It extends C<MouseX::App::Cmd::Command> which uses
L<Any::Moose|Any::Moose> to work with either L<Moose|Moose> or
L<Mouse|Mouse>.  Consult those modules' documentation for full
usage information.

=head1 SEE ALSO

=over

=item L<MooseX::App::Cmd::Command|MooseX::App::Cmd::Command>

=back
