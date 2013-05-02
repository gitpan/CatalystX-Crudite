# NAME

CatalystX::Crudite - Framework for Catalyst-based CMS Web Applications

# SYNOPSIS

    $ crudite-starter MyApp
    $ cd MyApp
    $ ./test.sh
    $ ./script/db_deploy.pl
    $ ./script/myapp_server.pl

    # log in with username 'admin' and password 'admin'
    # enjoy

    ...

    # later
    $ ./script/myapp_crudite_create.pl resource Article

# DESCRIPTION

CatalystX-Crudite is a framework for writing Catalyst-based CMS web
applications. It includes out-of-the-box user and role management
and many starter templates. It builds upon [CatalystX-Resource](https://metacpan.org/module/CatalystX-Resource) and
[CatalystX-SimpleLogin](https://metacpan.org/module/CatalystX-SimpleLogin).

In order for `crudite_starter` to work, you need to install this distribution.
The starter templates are stored as per-dist shared files using
`File::ShareDir`, so they can't be found from the uninstalled repository. I
hope to improve this in a later version.

# AUTHORS

The following person is the author of all the files provided in
this distribution unless explicitly noted otherwise.

Marcel Gruenauer `<marcel@cpan.org>`, [http://marcelgruenauer.com](http://marcelgruenauer.com)

# COPYRIGHT AND LICENSE

The following copyright notice applies to all the files provided in
this distribution, including binary files, unless explicitly noted
otherwise.

This software is copyright (c) 2013 by Marcel Gruenauer.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
