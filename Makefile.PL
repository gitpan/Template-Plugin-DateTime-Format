
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'format DateTime objects from inside TT with C<DateTime::Format>-style formatters',
  'AUTHOR' => 'Jonathan Rockway <jrockway@cpan.org>',
  'BUILD_REQUIRES' => {
    'Template' => '0',
    'Test::Exception' => '0',
    'Test::More' => '0',
    'ok' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Template-Plugin-DateTime-Format',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Template::Plugin::DateTime::Format',
  'PREREQ_PM' => {
    'Class::MOP' => '0',
    'DateTime' => '0',
    'Template::Plugin' => '0'
  },
  'VERSION' => '0.02',
  'test' => {
    'TESTS' => 't/*.t t/author/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



