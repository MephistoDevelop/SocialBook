# Project: Fakebook ([Microverse - The Odin Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project))

> Project taked from Microverse Curriculum from [The Odin Page project Site](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project).

This project it's building using Ruby on Rails Framework using Ruby Lenguage and it's part of the main curriculum from the odin project page. from Microverse, main curriculum
[Microverse](https://www.microverse.org/)
[Devise Documentation]( https://github.com/plataformatec/devise/wiki.)

-The objetive from this project is build the core of logic from Facebook page.

### Desktop view

![screenshot](./socialbook.gif)

Javascript with Webpack project from [The Odin Project curriculum](https://www.theodinproject.com/courses/javascript/lessons/todo-list)

## Built With Ruby , Ruby on Rails, Heroku
Tools used to build Aplication:

- Ruby
- Ruby on Rails
- Heroku

## Live Demo

 [Live view - SocialBook Page](https://socialbook2019.herokuapp.com)
 
## Future features
 
- Login with Social Medias Authentication
- UI friendly with final users
- Filter to stories
 
## Getting Started

- Principal Functions:
  - Create Account Using Real Email confirmation
  - Create Login with your Facebook acccount
  - Send friends Requests
  - Views publications from others friends


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

To use this project you will need to download this repository and put in on your computer.
after you will need to install webpack and npm to run correctlly this project.

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

- GitHub: [@Sergio Diaz](https://github.com/serdg0)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](lic.url) licensed.

### Author:

[Cristian Ines (MephistoDevelop)](https://github.com/MephistoDevelop)

[Sergio Diaz)](https://github.com/serdg0)
