package inc::MooseMouseMakeMaker;
use Moose;
use MooseX::AttributeShortcuts;
use MooseX::Types::Moose 'Bool';

extends 'Dist::Zilla::Plugin::MakeMaker::Awesome';

override _build_WriteMakefile_dump => sub {
    my $self = shift;

    my $args = super();
    $args .= <<'END_WRITEMAKEFILE';
if (eval {require Mouse; 1}) {
    $WriteMakefileArgs{PREREQ_PM}{'MouseX::Getopt'} = 0;
}
if (eval {require Moose; 1}) {
    $WriteMakefileArgs{PREREQ_PM}{'MooseX::Getopt'} = '0.18';
}
if (not grep {/^Mo(?:o|u)seX::Getopt$/} keys %{$WriteMakefileArgs{PREREQ_PM}}) {
    $WriteMakefileArgs{PREREQ_PM}{'MouseX::Getopt'} = 0;
}
END_WRITEMAKEFILE

    return $args;
};

__PACKAGE__->meta->make_immutable;
1;
