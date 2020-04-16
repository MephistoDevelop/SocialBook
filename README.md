# Project: Fakebook ([Microverse - The Odin Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project))

> Project taken from Microverse Curriculum and[The Odin Page project Site](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project).

This project it's building using Ruby on Rails Framework using Ruby Language and it's part of the main curriculum from the Odin project page. from Microverse, main curriculum
[Microverse](https://www.microverse.org/)
[Devise Documentation]( https://github.com/plataformatec/devise/wiki.)

- The objective of this project is build a social networking using Facebook's core logic.

### Desktop view

![screenshot](./socialbook.gif)

Javascript with Webpack project from [The Odin Project curriculum](https://www.theodinproject.com/courses/javascript/lessons/todo-list)

## Built With:

- Ruby
- Ruby on Rails
- Heroku

## Live Demo

 [Live view - SocialBook Page](https://socialbook2019.herokuapp.com)
 
## Future features
 
- Login with Social Media Authentication
- Friendly UI.
- Filter Stories.
 
## Getting Started

 Principal Functions:
  - Create account using email address.
  - Login with your Facebook account.
  - Send friend Requests.
  - View posts from friends  of friends.


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


### Setup
To use this project you will need to download this repository to your computer, Then you will need to install webpack and npm to correctly run this project.

#### Installation

Clone or download the repository to your local machine. Then open your terminal on the repository folder and run:

    bundle install

    rails db:create

    rails db:migrate

    rails db:seed
    
    
#### Database Requirements

The project runs on PostgreSQL.

To run this application you must have a default PSQL role WITH LOGIN CREATED  and then run or create a PSQL role run the following commands in the Postgres console

      For Creating a User:
      postgres=# CREATE ROLE role_name WITH LOGIN CREATEDB;

      For Altering Existing User
      postgres=# ALTER ROLE "role_name" WITH LOGIN CREATEDB;
      

### Deployment


Run:

    rails server

    enter to your:   http://localhost:3000/

### Rspec tests

    To run rspec at terminal:

      rspec

## Authors

👤 **Cristian Ines Hernandez A. - MephistoDevelop**

- Github: [@MephistoDevelop](https://github.com/MephistoDevelop)
- Twitter: [@MephistoDevelop](https://twitter.com/MephistoDevelop)
- Linkedin: [Cristian Hernandez](https://www.linkedin.com/in/cristian-hernandez1992/)

👤 **Sergio Diaz**

[Github](https://github.com/serdg0) | [Twitter](https://twitter.com/thesergiod) | [Linkedin](https://www.linkedin.com/in/sergiodiaz-dev/) | [Portfolio](https://sergiodev.netlify.com/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give and ⭐️ if you like this project!

## 📝 License

This project is [MIT](lic.url) licensed.
