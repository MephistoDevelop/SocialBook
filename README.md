# Project: Fakebook ([Microverse - The Odin Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project))

This project it's building using Ruby on Rails Framework using Ruby Lenguage and it's part of the main curriculum from the odin project page. from Microverse, main curriculum
[Microverse](https://www.microverse.org/)

-The objetive from this project is build the core of logic from Facebook page.

#### [Live view - SocialBook Page](https://socialbook2019.herokuapp.com)

- Principal Functions:
  - Create Account Using Real Email confirmation
  - Create Login with your Facebook acccount
  - Send friends Requests
  - Views publications from others friends

#### [Link to odin page](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project)

#### [Entity Relation Diagam](https://github.com/MephistoDevelop/fakebook/blob/master/docs/Fakebook-ERM.png)

![alt text](https://github.com/MephistoDevelop/fakebook/blob/master/docs/Fakebook-ERM.png)

#### Language Requirements

    Ruby 2.6.3
    Rails 5.2.0

#### GEMS

- Postgre
- Bootstrap
- Devise
- Omniauth-facebook
- Figaro
- Factory-Bot
- Capybara
- Active storage

#### Web Services

- SendGrid
- AWS S3

#### Installation

Clone or download the repository to your local machine and after open your terminal on the repository folder and run :

    bundle install

    rails db:create

    rails db:migrate

    rails db:seed

#### Database Requirements

The project runs on PSQL. For running this application you must have a default PSQL role WITH LOGIN CREATEDB

For altering or creating a PSQL role run the following commands in postgres console

      For Creating a User:
      postgres=# CREATE ROLE role_name WITH LOGIN CREATEDB;

      For Altering Existing User
      postgres=# ALTER ROLE "role_name" WITH LOGIN CREATEDB;

#### Running

Run:

    rails server

    enter to your:   http://localhost:3000/

### Rspec tests

    To run rspec at terminal:

      rspec

#### Authors

- [@MephistoDevelop](https://github.com/MephistoDevelop)
- [@Sergio Diaz](https://github.com/serdg0)
