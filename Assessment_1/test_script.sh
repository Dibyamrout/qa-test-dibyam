#!/bin/bash
  

FRONTEND_URL="http://localhost:8081/"  


EXPECTED_MESSAGE="Hello from the Backend!"  


test_frontend() {
    
    RESPONSE=$(curl -s "$FRONTEND_URL")

    
    if [[ "$RESPONSE" == *"$EXPECTED_MESSAGE"* ]]; then
        echo "Test Passed: Frontend correctly displays the greeting message."
        return 0
    else
        echo "Test Failed: Frontend did not display the expected message."
        echo "Response: $RESPONSE"
        return 1
    fi
}


test_frontend

