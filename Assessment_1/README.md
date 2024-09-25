Full Stack Application Deployment with Kubernetes:-
---------------------------------------------------------
This project demonstrates the deployment of a full-stack application consisting of a frontend and backend service in a local Kubernetes cluster using Minikube or Kind. The frontend service fetches a greeting message from the backend service, and automated tests are included to verify their integration.

Prerequisites:-
---------------
1.Docker

2.Minikube or Kind (for Kubernetes)

3.kubectl (Kubernetes CLI)

4.curl (for basic testing)

5.Bash (for running the automated test script)

Setup Instructions:-
---------------------
1. Clone the Repository:-
 >git clone https://github.com/Dibyamrout/qa-test-dibyam.git

 >cd qa-test

2.Build Docker Images
Go to the frontend and backend directories and build the Docker images:
 >docker build -t <your-docker-username>/frontend:latest ./frontend
 >docker build -t <your-docker-username>/backend:latest ./backend
 
3.Push Docker Images to Docker Hub
 ->(Make sure you are logged into Docker)
  >docker login (use this coomand for docker login )
 
 -Then push the Docker images to your Docker Hub account:-
  >docker push <your-docker-username>/frontend:latest
  >docker push <your-docker-username>/backend:latest
4. Deploy to Kubernetes
Apply the Kubernetes manifests to deploy the frontend and backend services to your Minikube or Kind cluster:--
 >kubectl apply -f deployment.yaml
 
5. Verify Deployment
Check if the services are running successfully:-
 >kubectl get pods
 >kubectl get svc

6.Testing the Application:-
 Manual Testing:-

  1.Minikube Users: Use the following command to open the frontend service:-
   >minikube service frontend-service
  (This will open the frontend service in your browser.)

  2.Kind Users: Use kubectl port-forward to access the frontend:-
   >kubectl port-forward svc/frontend-service 8081:80
   >Then visit http://localhost:8081 in your browser.

   output :-Hello from the Backend!

   (Note: if  port is busy then use another port)

  3.Check if the frontend displays the expected greeting message fetched from the backend (e.g., "Hello from the Backend!").


7.Automated Testing:-
 You can use the provided Bash script to automate the verification of the frontend-backend integration:-
 1.create the shell file  (abc.sh).

 2.write the sheel for  verify the integration between the frontend and backend services.

 3.Give the Execute permisson to the sheel file (chmod +x abc.sh ).

 4. Run the sheel (./abc.sh)

 5.The script will compare the actual response from the frontend with the expected message.

Expected Output

1)If the test passes:
You will see the following message:-
Test Passed: Frontend correctly displays the greeting message.

2)If the test fails:
You will see:-
Test Failed: Frontend did not display the expected message.
Response: <actual response from the frontend>



----------------------------------------------------------------------------------------
Troubleshooting
1.If the frontend is not accessible, verify that the services are running by checking the pods:
 >kubectl get pods

2.Check logs of the services for any errors:
>kubectl logs <pod-name>

3.f the frontend does not display the expected message, check if the backend is returning the correct response by accessing the backend service directly:
curl <backend-service-url>


Conclusion:-
This project demonstrates the deployment of a simple frontend-backend application on Kubernetes. The frontend service successfully communicates with the backend service, and automated tests have been added to verify their integration. Documentation is provided to help you set up and test the application efficiently.



Important Notes:-
------------------
. Make sure to replace <your-docker-username> with your actual Docker Hub username.
. The backend service URL for manual testing should be replaced with the actual URL that the backend service is exposing.
. Let me know if you'd like any adjustments to the README!
