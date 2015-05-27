# perl6-http-server

role stating something abides by some standard

##roles & intentions

###```Callable $sub```

This is the argument you can provide to any of the methods below

```perl6
sub ($req, $res) { 
  qw<do some stuff>;  
}
```

###handlers: ```method handler(Callable $sub) {...}```

```handler``` subs are meant to be called when a request is _complete_ by both headers and body

###after: ```method after(Callable $sub) {...}```

```after``` subs are meant to be called when a response is _complete_ and sent

###middleware: ```method middleware(Callable $sub) {...}```

```middleware``` subs are meant to be called when a response is _complete_ and sent

###listen: ```method listen {...}```

```listen``` is telling the server to start up and start accepting connections
