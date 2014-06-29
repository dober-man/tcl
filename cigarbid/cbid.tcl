#!/opt/local/bin/tclsh

# Sample use of the http package, v2.
# Fetch a URL and save to a file.

package require http 2.0
# for non namespaced access to these fns use
#   package require http 1.0
#  and fn names http_config, gttp_get, http_...

#http::config -proxyhost webcache.eng -proxyport 8080 -useragent httpcopy

proc httpcopy {url file} {
    global token done
    set out [open $file w]
    fconfigure $out -translation binary

    # This uses the command callback just for illustration
    set done 0
    set token [http::geturl $url -channel $out \
	    -command [list httpdone $out]]
    return $token
}
proc httpdone {out token} {
    global done
    close $out
    set done 1
}

if {$argc < 2} {
    puts stderr "Usage: $argv0 url file"
    exit 1
}
set token [httpcopy [lindex $argv 0] [lindex $argv 1]]
vwait done

# The token is the name of the state array
upvar #0 $token state

# Print meta-data
puts $state(http)
set maxlen 0
foreach {name value} $state(meta) {
    if {[string length $name] > $maxlen} {
	set maxlen [string length $name]
    }
}
incr maxlen
foreach {name value} $state(meta) {
    puts [format "%-*s %s" $maxlen $name: $value]
}



