role HTTP::Server {
  method handler    {...} #to be called when request is complete
  method middleware {...} #to be called when headers are complete
  method after      {...} #to be called when response is complete
  method listen     {...}
}
