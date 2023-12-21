# SWEProject
Project for SWE 

## PARTNER AGREEMENT: 

Respond within 24 hours (preferably as soon as possible)

Communicate effectively and make efforts to share anything that involves both partners

Weekly check-ins  (create detailed documents individually or together to show weekly plans for assignment(s)

Wednesday 

Sunday

Communicate through Discord (or Canvas messages if not responded to Discord promptly, but in this case, it is a breach of agreement unless one of us has communicated we will not be responding for a good reason)

Respect each other's time and opinions to create a fair work relationship 

Positive and constructive feedback when/if needed 



UML DESIGN:
<img width="667" alt="Screenshot 2023-12-20 at 4 16 25 PM" src="https://github.com/nianatali18/SWEProject/assets/56011637/58512813-f752-4409-84aa-d99d71d63a38">




How to Use Micro-Service: 

a) Begin by running both Python scripts in your code editor (if you have a MAC use python3 (Script name)) 
b) Once it is running you can then use the application to request the use of the grocery list and it will display
c) When the grocery input system appears it will display the option to add or delete an item
d) If an option is not chosen correctly then it will show the options again until you get it right 
e) Once a correct option is selected you can enter or delete something (one at a time) and then press enter and it will update 
f) The list will then update and display and the options will be displayed again until another option in your app is chosen 

UML DETAILS:

1. The Partners app interacts with microservice when it is called 

2. The app requests a data update or deletion and it is sent to MS 

3. Micro-service validates the action entered by the user 

4. Micro-service displays the current grocery list or if there is an error it tells the user to try again 

5. Microservice performs the action chosen for the grocery list 

6. An update is sent to the ZeroMQ Socket 

7. ZeroMQ socket using the pub/sub mechanism publishes the list for full view 

 

