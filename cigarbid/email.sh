#!/bin/bash
mailto=bradhscherer@gmail.com
from=CigarbidScript
subject="Todays top 15 Padron Closings"
output=`cat /Users/bradhscherer/cigarbid/output.htm`
body=$output

  (
    echo "To: $mailto"
    echo "From: $from"
    echo "Subject: $subject"
    echo "Content-Type: text/html";
    echo "MIME-Version: 1.0";
    echo "$body"
  )  |  /usr/sbin/sendmail -t
  
  
