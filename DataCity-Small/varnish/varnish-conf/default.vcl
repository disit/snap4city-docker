vcl 4.1;

backend default {
    .host = "proxy";
    .port = "80";
}

sub vcl_recv {
    if (req.method == "PRI") {
        /* This will never happen in properly formed traffic (see: RFC7540) */
        return (synth(405));
    }

    if (!req.http.host && req.esi_level == 0 && req.proto ~ "^(?i)HTTP/1.1") {
        /* In HTTP/1.1, Host is required. */
        return (synth(400));
    }

    if (req.method != "GET" && req.method != "HEAD" &&
        req.method != "PUT" && req.method != "POST" &&
        req.method != "TRACE" && req.method != "OPTIONS" &&
        req.method != "DELETE" && req.method != "PATCH") {
        /* Non-RFC2616 or CONNECT which is weird. */
        return (pipe);
    }

    if (req.method != "GET" && req.method != "HEAD") {
        /* We only deal with GET and HEAD by default */
        return (pass);
    }

    if (req.http.Cookie) {
        /* Not cacheable by default */
        return (pass);
    }
	
    return (hash);
}

sub vcl_backend_response {
    # Happens after we have read the response headers from the backend.
    #
    # Here you clean the response headers, removing silly Set-Cookie headers
    # and other mistakes your backend does.

    
    if( !beresp.http.Vary || !(beresp.http.Vary=="Authorization")){
        set beresp.http.Vary = "Authorization";
    }

    if( beresp.http.Cache-Control ){
        unset beresp.http.Cache-Control;
    }

    if( beresp.http.Expires ){
        unset beresp.http.Expires;
    }

    if( beresp.status >= 400 && beresp.status <= 500 ){
        # Do not cache bad responses from the backend
        set beresp.uncacheable = true;
    }else{
        # Good response form the backend
        unset beresp.http.set-cookie;
        set beresp.ttl = 1800s;
    }
}
