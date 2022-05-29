role HTTP::Request::Role {
    has Str $.method;
    has Str $.uri;
    has Str $.version;
    has Buf $.data is rw;
    has     %.params;
    has     %.headers;

    method header(*@headers) {
        my @r;
        my %h = @headers.map({ $_.lc => $_ });
        %.headers.keys.map(-> $k {
            @r.append($( %h{$k.lc} => %.headers{$k} )) if $k.lc ~~ any %h.keys;
        });
        @r
    }
}

# vim: expandtab shiftwidth=4
