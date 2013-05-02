use strict;
use warnings;
use ExtUtils::MakeMaker 6.58;
use File::ShareDir::Install;
install_share 'share';
my $name = 'CatalystX-Crudite';
(my $from = "lib/$name.pm") =~ y!-!/!;
WriteMakefile(
    ABSTRACT_FROM      => $from,
    AUTHOR             => 'Marcel Gruenauer <marcel@cpan.org>',
    BUILD_REQUIRES     => { 'Test::More' => '0.94' },
    CONFIGURE_REQUIRES => { 'ExtUtils::MakeMaker' => '6.58' },
    EXE_FILES          => ['bin/crudite_starter'],
    LICENSE            => 'perl',
    META_MERGE         => {
        resources => {
            bugtracker => "https://github.com/marcelgruenauer/$name/issues",
            repository => "git://github.com/marcelgruenauer/$name.git",
            homepage   => "https://github.com/marcelgruenauer/$name",
        },
    },
    MIN_PERL_VERSION => '5.12.0',
    NAME             => $name,
    PREREQ_PM        => {
        'Authen::Passphrase::BlowfishCrypt'          => '0',
        'Catalyst::Action::RenderView'               => '0',
        'Catalyst::ActionRole::ACL'                  => '0',
        'Catalyst::Model::DBIC::Schema'              => '0',
        'Catalyst::Plugin::Authentication'           => '0',
        'Catalyst::Plugin::Authorization::Roles'     => '0',
        'Catalyst::Plugin::ConfigLoader'             => '0',
        'Catalyst::Plugin::Session'                  => '0',
        'Catalyst::Plugin::Session::State::Cookie'   => '0',
        'Catalyst::Plugin::Session::Store::FastMmap' => '0',
        'Catalyst::Plugin::Static::Simple'           => '0',
        'Catalyst::Plugin::Static::Simple'           => '0',
        'Catalyst::Runtime'                          => '0',
        'Catalyst::View::TT'                         => '0',
        'CatalystX::Resource'                        => '0.006001',
        'CatalystX::SimpleLogin'                     => '0',
        'Config::General'                            => '0',
        'Data::Printer'                              => '0',
        'DBIx::Class'                                => '0',
        'DBIx::Class::PassphraseColumn'              => '0',
        'DBIx::Class::TimeStamp'                     => '0',
        'File::ShareDir'                             => '0',
        'File::Slurp'                                => '0',
        'HTML::FormHandler'                          => '0',
        'HTML::FormHandler::Model::DBIC'             => '0',
        'Modern::Perl'                               => '0',
        'Moose'                                      => '0',
        'Params::Validate'                           => '0',
        'Template'                                   => '0',
        'Web::Library'                               => '0',
        'Web::Library::Bootstrap'                    => '0',
        'Web::Library::jQuery'                       => '0',
        'Web::Library::jQueryUI'                     => '0',
        'Web::Library::DataTables'                   => '0',
        'namespace::autoclean'                       => '0',
        'parent'                                     => '0',
    },
    VERSION_FROM => $from,
    test         => { TESTS => 't/*.t' }
);

package MY;
use File::ShareDir::Install qw(postamble);

# Uninstall the old shared files so files that were present in older
# versions but aren't present now won't interfere.
sub install {
    my $result = shift->SUPER::install(@_);
    $result =~ s/install :: \K(?=pure_install )/share_uninstall /;
    $result .= <<EOMAKE;

share_uninstall ::
\t\$(RM_RF) \$(INSTALLSITELIB)/auto/share/dist/\$(DISTNAME)
EOMAKE
    $result;
}
