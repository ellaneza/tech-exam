# Technical Exam

## Dependencies

* ruby 2.7.7
* Rails 6.0.6.1
* Bundler version 2.4.6

## Configuration

* For initial configuration like setting up local environment (ruby and rails set-up) for testing purposes, this [link](https://gorails.com/setup/windows/10) provides a good information depends on the operating system installed in your work station.

## Application initialization
Run the ff commands inside project root directory to initialize the application
* `bundle install` - install/fetch needed gems
* `rails db:create` - create database
* `rails db:migrate` - initialize database tables 
* `rails db:seed` - runs the seeder and parse the data from the CSV file

## Sending API request
Before sending a request make sure that the rails server is running on you local environment. To run rails server on local run the command `rails server` on terminal/command prompt

To send an API request we need to secure an API token by running the command below on terminal/command prompt or using [Postman](https://www.postman.com/)

    curl -X POST http://localhost:3000/api/v1/authenticate -H 'content-type: multipart/form-data' -F 'email=ellaneza@test.com' -F 'password=password'
    
The endpoint- http://localhost:3000/api/v1/authenticate take two parameters

* **email** - user email
* **password** - user password

**Note:** User email and password that is used on the sample request above is seeded on application initialization

### Sample API request and Response

#### Obtaining API Token

***Request:***

  - `curl -X POST http://localhost:3000/api/v1/authenticate -H 'content-type: multipart/form-data' -F 'email=ellaneza@test.com' -F 'password=password'`

***Response:***

  - `{"auth_token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHBpcnkiOjE2NzU3MDQ3OTZ9.IE0-0uXqUsKz6xGSX7-FdInCCimYYJXna81BLtnc37U"}`

#### Sending request to `/top/confirmed` endpoint

After successfully obtaining an auth/API token, it can now be used on sending request to the endpoint `http://localhost:3000/top/confirmed`

    curl http://localhost:3000/top/confirmed?observation_date=2020-04-14&max_results=2 -H Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHBpcnkiOjE2NzU3MDQ3OTZ9.IE0-0uXqUsKz6xGSX7-FdInCCimYYJXna81BLtnc37U

