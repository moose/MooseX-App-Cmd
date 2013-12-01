use 5.006;

package MouseX::App::Cmd;
use Mouse;

# VERSION
use namespace::clean -except => 'meta';
extends 'MooseX::App::Cmd';
__PACKAGE__->meta->make_immutable();   ## no critic (RequireExplicitInclusion)
no Mouse;
1;

# ABSTRACT: Mashes up MouseX::Getopt and App::Cmd

=head1 SYNOPSIS

    package YourApp::Cmd;
    use Mouse;

    extends qw(MouseX::App::Cmd);


    package YourApp::Cmd::Command::blort;
    use Mouse;

    extends qw(MouseX::App::Cmd::Command);

    has blortex => (
        traits => [qw(Getopt)],
        isa => 'Bool',
        is  => 'rw',
        cmd_aliases   => 'X',
        documentation => 'use the blortext algorithm',
    );

    has recheck => (
        traits => [qw(Getopt)],
        isa => 'Bool',
        is  => 'rw',
        cmd_aliases => 'r',
        documentation => 'recheck all results',
    );

    sub execute {
        my ( $self, $opt, $args ) = @_;

        # you may ignore $opt, it's in the attributes anyway

        my $result = $self->blortex ? blortex() : blort();

        recheck($result) if $self->recheck;

        print $result;
    }

=head1 DESCRIPTION

This module marries L<App::Cmd|App::Cmd> with L<MouseX::Getopt|MouseX::Getopt>.

It extends L<MooseX::App::Cmd|MooseX::App::Cmd> which uses
L<Any::Moose|Any::Moose> to work with either L<Moose|Moose> or
L<Mouse|Mouse>.  Consult those modules' documentation for full
usage information.

=head1 SEE ALSO

=over

=item L<MooseX::App::Cmd|MooseX::App::Cmd>

=item L<App::Cmd|App::Cmd>

=item L<App::Cmd::Tutorial|App::Cmd::Tutorial>

=item L<MouseX::Getopt|MouseX::Getopt>

=item L<MouseX::App::Cmd::Command|MouseX::App::Cmd::Command>

=back
