use HTTP::Server::Role;
use HTTP::Request::Role;
use HTTP::Response::Role;

=begin pod

=head1 NAME

HTTP::Roles - Roles for an HTTP::Server with interchangeable backends

=head1 SYNOPSIS

=begin code :lang<raku>

use HTTP::Roles;

my class HTTP::Server::MyWay does HTTP::Server::Role {
    ...
}
my class HTTP::Request::MyWay does HTTP::Request::Role {
    ...
}
my class HTTP::Response::MyWay does HTTP::Response::Role {
    ...
}

=end code

=head1 DESCRIPTION

HTTP::Roles provides a set of roles to define the functionality
of an HTTP server, and handling requests and responses.

=head1 ROLES

=head2 HTTP::Server::Role

All of the methods defined by the C<HTTP::Server::Role> take a
C<Callable> as the argument, which should provide the necessary
functionality.

=head3 listen

Calling the C<listen> method is telling the server to start up
and start accepting connections.

=head3 middleware

The C<middleware> method should be called with a C<Callable> during
server setup: the specified C<Callable> is to be executed whenever
the reception of the request headers of a request is complete.

=head3 handler

The C<handler> method should be called with a C<Callable> during
server setup: the specified C<Callable> is to be executed whenever
the reception of the request headers B<and> the body of a request
is complete.

=head3 after

The C<after> method should be called with a C<Callable> during
server setup: the specified C<Callable> is to be executed whenever
the response is complete and sent.

=head2 HTTP::Request::Role

The C<HTTP::Request::Role> provides some generic attributes for the
class that I<should> be present in any decent C<HTTP::Request> class.
These are:

=begin code :lang<raku>

has Str $.method;
has Str $.uri;
has Str $.version;
has Buf $.data is rw;
has     %.params;
has     %.headers;

=end code

=head3 header

A generic C<header> method to retrieve headers in a case insensitive
way from the C<%.headers> attribute.

=head2 HTTP::Response::Role

The C<HTTP::Response::Role> provides some generic attributes for the
class that I<should> be present in any decent C<HTTP::Response> class.

=begin code :lang<raku>

has Int:D $.status is rw = 200;
has       %.headers is rw;
has       $.connection;
has       %.statuscodes = HTTP::Status.Map;

=end code

=head3 write

The C<write> method is expected to write the given data of the response.

=head3 close

The C<close> method is expected to close the connection to the client,
taking any optional data to be sent, and a named argument C<:force> to
forcefully close the connection (which defaults to C<False>).

=head1 AUTHOR

Tony O'Dell

=head1 COPYRIGHT AND LICENSE

Copyright 2015 - 2019 Tony O'Dell

Copyright 2020 - 2022 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
