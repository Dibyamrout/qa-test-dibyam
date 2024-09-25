#!/bin/bash
  
# Define the frontend service URL
FRONTEND_URL="http://localhost:8081/"  # Replace with your frontend service URL

# Expected greeting message (no spaces around the equal sign)
EXPECTED_MESSAGE="Hello from the Backend!"  # Replace with the actual expected message

# Function to test the frontend
test_frontend() {
    # Fetch the response from the frontend
    RESPONSE=$(curl -s "$FRONTEND_URL")

    # Check if the response contains the expected message
    if [[ "$RESPONSE" == *"$EXPECTED_MESSAGE"* ]]; then
        echo "Test Passed: Frontend correctly displays the greeting message."
        return 0
    else
        echo "Test Failed: Frontend did not display the expected message."
        echo "Response: $RESPONSE"
        return 1
    fi
}

# Run the test
test_frontend

