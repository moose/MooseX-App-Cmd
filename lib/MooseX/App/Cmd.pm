use 5.006;

package MooseX::App::Cmd;
use Moose;
use English '-no_match_vars';
use File::Basename ();

# VERSION
use MooseX::MarkAsMethods autoclean => 1;
extends qw(Moose::Object App::Cmd);

sub BUILDARGS {
    my ( undef, @arg ) = @_;
    return {} if !@arg;
    return { arg => $arg[0] } if @arg == 1;
    return {@arg};
}

sub BUILD {
    my $self  = shift;
    my $class = blessed $self;
    $self->{arg0}      = File::Basename::basename($PROGRAM_NAME);
    $self->{command}   = $class->_command( {} );
    $self->{full_arg0} = $PROGRAM_NAME;
    return;
}

## no critic (Modules::RequireExplicitInclusion)
__PACKAGE__->meta->make_immutable();
no Moose;
1;

# ABSTRACT: Mashes up MooseX::Getopt and App::Cmd

=head1 SYNOPSIS

    package YourApp::Cmd;
	use Moose;

    extends qw(MooseX::App::Cmd);


    package YourApp::Cmd::Command::blort;
    use Moose;

    extends qw(MooseX::App::Cmd::Command);

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

This module marries L<App::Cmd|App::Cmd> with L<MooseX::Getopt|MooseX::Getopt>.

Use it like L<App::Cmd|App::Cmd> advises (especially see
L<App::Cmd::Tutorial|App::Cmd::Tutorial>), swapping
L<App::Cmd::Command|App::Cmd::Command> for
L<MooseX::App::Cmd::Command|MooseX::App::Cmd::Command>.

Then you can write your moose commands as Moose classes, with
L<MooseX::Getopt|MooseX::Getopt>
defining the options for you instead of C<opt_spec> returning a
L<Getopt::Long::Descriptive|Getopt::Long::Descriptive> spec.

=method BUILD

After calling C<new> this method is automatically run, setting underlying
L<App::Cmd|App::Cmd> attributes as per its documentation.

=head1 SEE ALSO

=over

=item L<App::Cmd|App::Cmd>

=item L<App::Cmd::Tutorial|App::Cmd::Tutorial>

=item L<MooseX::Getopt|MooseX::Getopt>

=item L<MooseX::App::Cmd::Command|MooseX::App::Cmd::Command>

=back
