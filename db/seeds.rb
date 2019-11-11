# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create( name: 'Star Wars' , name: 'Lord of the Rings' )
#   Character.create(name: 'Luke', movie: movies.first)
ines = User.create( username: 'Ines' ,
                                  email: 'mephisto@microverse.com' ,
                                  password: '123456' ,
                                  password_confirmation: '123456' 
                                    )

 checo = User.create( username: 'checo' ,
                                    email: 'checo@microverse.com' ,
                                    password: '123456' ,
                                    password_confirmation: '123456'
                                   )

michael = User.create(username: 'michael' ,
                                      email: 'michael@microverse.com' ,
                                      password: '123456' ,
                                      password_confirmation: '123456' )

post1 = Post.create( content: 'Im the  seed first post' ,
                                        user_id: 1 )

 post2 = Post.create( content: 'Im the  seed Second post' ,
                                     user_id: 2)

