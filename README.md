# Technical Exam

## Dependencies
    * ruby 2.7.7
    * Rails 6.0.6.1
    * Bundler version 2.4.6

## Configuration
    * For initial configuration like setting up local environment (ruby and rails set-up) for testing purposes, this [link](https://gorails.com/setup/windows/10) provides a good information depends on the operating system installed in your work station.

## Application initialization
    - Run the ff commands inside project root directory to initialize the application
    * `bundle install` - install/fetch needed gems
    * `rails db:create` - create database
    * `rails db:migrate` - initialize database tables 
    * `rails db:seed` - runs the seeder and parse the data from the CSV file
