# HTTP::Server

[![Build Status](https://travis-ci.org/perl6-community-modules/perl6-http-server.svg?branch=master)](https://travis-ci.org/perl6-community-modules/perl6-http-server)

Role that states that something abides by some standard

## Roles & intentions

# ```HTTP::Server```

###```Callable $sub```

This is the argument you can provide to any of the methods below

```perl6
sub ($req, $res) { 
  qw<do some stuff>;  
}
```

### Handlers: ```method handler(Callable $sub) {...}```

```handler``` subs are meant to be called when a request is _complete_ by both headers and body

### after: ```method after(Callable $sub) {...}```

```after``` subs are meant to be called when a response is _complete_ and sent

### middleware: ```method middleware(Callable $sub) {...}```

```middleware``` subs are meant to be called when request headers are _complete_ 

### listen: ```method listen {...}```

```listen``` is telling the server to start up and start accepting connections

# ```HTTP::Request```

provides a generic ```method header(*@headers)``` to retrieve headers in a case insensitive way

also provides some generic attributes for the class that _should_ be present in any decent HTTP::Request

# ```HTTP::Response```

should provide methods ```close($data?, :$force? = False)``` and ```write($data)```  

also provides some generic attributes for the class that _should_ be present in any decent HTTP::Response
