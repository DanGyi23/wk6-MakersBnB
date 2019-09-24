# MakersBnB

MakersBnB is the amazing new webApp that connects hosts and guests, enabling hosts to list available accommodation and enabling guests to find and book available accommodation.

### MVP design

We designed and built our MVP with 2 goals in mind:
- 1) Enable us to showcase a significant part of the user experience to get input for further development
- 2) Validate that we as a team can build a separate front-end/back-end stack which interacts with JSON

On 1) we decided to focus on the (potential) guest as the user group to focus on. Though the business model is 2-sided, we believe guests are more critical to win over in the earlier phase. We want to gage interest in booking private homes and learn about their preferred searching and booking process. The MVP therefore allows users to
- browse a list of available, pre-defined properties
- view additional details for each property
- request a booking for a property which then blocks this property for further booking
This feature set delivers on elements of use case 1,2,5 and 7. Given time/team size constraints and our dual focus for the MVP development, we chose a more narrow user-facing feature set for the MVP. Hosts and their needs are not considered at this stage of development.

On 2) To ensure scalability and flexibility in future development, we wanted to build a separate front-end and back-end which interact via HTTP requests and JSON data. Given our teams lack of experience with this type of design, we chose to experiment with this tech stack as part of the MVP build, which allowed us to learn and make an early continue/abandon decision.

![Domain Model](https://github.com/DanGyi23/wk6-MakersBnB/pics/domain_model.png)

![Database structure](https://github.com/DanGyi23/wk6-MakersBnB/pics/DB_structure.png)

### Installing and running the MVP

Installing
- 1) Clone this repo
- 2) Install Ruby 2.6.4 and run bundle install in the app's directory
- 3) Install SQL database manager and run the SQL queries in /db/migrations to set up the databases
- 4) Run SQL script 01 on both test and production database, run SQL script 02 on the production database to create entries for testing in production

Running
- 1) Start webserver for back-end (e.g. rack-up) - front-end expects back-end server on localhost on port 9292
- 2) Run index.html in your browser

Testing
- 1) Run all steps under installing (step 4 is optional for testing)
- 2) Run rspec to test back-end unit and overall feature tests
- 3) Run SpecRunner.html in app directory to run unit tests for front-end unit tests

### User Stories

```
1)
As a host,
So I can attract guests to my property(ies)
I want to list my property(ies) as a new space

2)
As a host,
So my guests can find the accommodation that fits their needs and budget,
I want to provide a short description and a price per night for each of my spaces

3)
As a host,
So that I can avoid double bookings and unnecessary booking requests from guests,
I want to define dates when my space(s) are available

4)
As an admin,
So that I verify who is offering the space,
I want to sign up and identify new hosts

5)
As a guest,
So that I can stay in a BnB,
I want to request to book that BnB for my stay.

6)
As a host,
So that I can give approval for a guest to hire my BnB,
I want to be able to approve a hire request before it's confirmed.

7)
As a guest,
So that I can only book vacant BnBs,
I want to not be able to book a BnB on dates that it's already booked.

8)
As a host,
So that I don't miss out on potential bookings,
I want to continue to accept bookings until I approve/confirm a booking for particular dates.
