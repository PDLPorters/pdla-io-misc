use strict;
use warnings;
use ExtUtils::MakeMaker;
use PDLA::Core::Dev;

my @pack = (["misc.pd", qw(Misc PDLA::IO::Misc)]);

undef &MY::postamble; # suppress warning
*MY::postamble = sub { pdlpp_postamble(@pack); };

my %hash = pdlpp_stdargs(@pack);
for my $key (qw(BUILD_REQUIRES CONFIGURE_REQUIRES TEST_REQUIRES PREREQ_PM)) {
  $hash{$key}{'PDLA::Core'} = 0;
}
$hash{META_MERGE} = {
  "meta-spec" => { version => 2 },
  resources => {
    repository => {
      type => 'git',
      url => 'git://github.com/PDLPorters/pdla-io-misc',
      web => 'https://github.com/PDLPorters/pdla-io-misc',
    },
  },
};

WriteMakefile(
 %hash
);
