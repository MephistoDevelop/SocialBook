# Project: Fakebook ([Microverse - The Odin Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project))

This project it's building using Ruby on Rails Framework using Ruby Lenguageand it's part of the main curriculum from the odin project page. from Microverse, main curriculum
[Microverse](https://www.microverse.org/) - @microverseinc

-The objetive from this project is build the core of logic from Facebook page.

#### [Link to odin page](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project)

#### [Entity Relation Diagam](https://github.com/MephistoDevelop/fakebook/blob/master/docs/Fakebook-ERM.png)

![alt text](https://github.com/MephistoDevelop/fakebook/blob/master/docs/Fakebook-ERM.png)

#### [Live view](**_Working...._**)

#### Language Requirements

    Ruby 2.6.3

#### Installation

Clone or download the repository to your local machine and after open your terminal on the repo and run :

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
