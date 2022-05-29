role HTTP::Server::Role {
    method handler(Callable $sub) {*}    # to be called when request is complete
    method middleware(Callable $sub) {*} # to be called when headers are complete
    method after(Callable $sub) {*}      # to be called when response is complete
    method listen() {*}                  # to be called to start the server
}

# vim: expandtab shiftwidth=4
