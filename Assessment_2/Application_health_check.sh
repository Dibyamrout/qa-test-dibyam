#!/bin/bash

URL="http://10.10.30.15:9002/cgi-bin/welcome"  
LOG_FILE="application_health_check.log"

HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" $URL)

check_status() {
    if [ "$HTTP_STATUS" -eq 200 ]; then
        echo "Application status: UP (HTTP Status: $HTTP_STATUS)" | tee -a $LOG_FILE
    else
        echo "Application status: DOWN (HTTP Status: $HTTP_STATUS)" | tee -a $LOG_FILE
    fi
}

check_status

