use HTTP::Status;
BEGIN my %status := HTTP::Status.Map;

role HTTP::Response::Role {
    has Int:D $.status is rw = 200;
    has %.headers is rw;
    has $.connection;
    has %.statuscodes = %status;

    method close($data?, :$force? = False) {*}
    method write($data) {*}
}

# vim: expandtab shiftwidth=4
