[![Actions Status](https://github.com/raku-community-modules/HTTP-Roles/actions/workflows/test.yml/badge.svg)](https://github.com/raku-community-modules/HTTP-Roles/actions)

NAME
====

HTTP::Roles - Roles for an HTTP::Server with interchangeable backends

SYNOPSIS
========

```raku
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
```

DESCRIPTION
===========

HTTP::Roles provides a set of roles to define the functionality of an HTTP server, and handling requests and responses.

ROLES
=====

HTTP::Server::Role
------------------

All of the methods defined by the `HTTP::Server::Role` take a `Callable` as the argument, which should provide the necessary functionality.

### listen

Calling the `listen` method is telling the server to start up and start accepting connections.

### middleware

The `middleware` method should be called with a `Callable` during server setup: the specified `Callable` is to be executed whenever the reception of the request headers of a request is complete.

### handler

The `handler` method should be called with a `Callable` during server setup: the specified `Callable` is to be executed whenever the reception of the request headers **and** the body of a request is complete.

### after

The `after` method should be called with a `Callable` during server setup: the specified `Callable` is to be executed whenever the response is complete and sent.

HTTP::Request::Role
-------------------

The `HTTP::Request::Role` provides some generic attributes for the class that *should* be present in any decent `HTTP::Request` class. These are:

```raku
has Str $.method;
has Str $.uri;
has Str $.version;
has Buf $.data is rw;
has     %.params;
has     %.headers;
```

### header

A generic `header` method to retrieve headers in a case insensitive way from the `%.headers` attribute.

HTTP::Response::Role
--------------------

The `HTTP::Response::Role` provides some generic attributes for the class that *should* be present in any decent `HTTP::Response` class.

```raku
has Int:D $.status is rw = 200;
has       %.headers is rw;
has       $.connection;
has       %.statuscodes = HTTP::Status.Map;
```

### write

The `write` method is expected to write the given data of the response.

### close

The `close` method is expected to close the connection to the client, taking any optional data to be sent, and a named argument `:force` to forcefully close the connection (which defaults to `False`).

AUTHOR
======

Tony O'Dell

COPYRIGHT AND LICENSE
=====================

Copyright 2015 - 2019 Tony O'Dell

Copyright 2020 - 2022 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

