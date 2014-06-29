set chan [open /Users/bradhscherer/cigarbid/output.htm]
set channew [open /Users/bradhscherer/cigarbid/outputnew.htm w+]
set lineNumber 0
set unique1 {<body><div} 
set unique2 {class="cb_breadcrumbs}
set replacement {}
while {[gets $chan line] >= 0} {
    regsub -- "($unique1) .* ($unique2)" $line "\\1$replacement\\2" line
set unique3 {</div><div class="grid_10} 
set unique4 {class="head">Filter</div></div><div}
    regsub -- "($unique3) .* ($unique4)" $line "\\1$replacement\\2" line
set unique5 {id="searchForm"} 
set unique6 {style="cursor:pointer;"}
    regsub -- "($unique5) .* ($unique6)" $line "\\1$replacement\\2" line
set unique7 {class="cb_display">View:} 
set unique8 {src="/Scripts/urchin.js"></script><script}
    regsub -- "($unique7) .* ($unique8)" $line "\\1$replacement\\2" line
    puts -nonewline $channew $line
    puts $line
}

close $chan


