##AuthMongoid

Mongoid implementation of Ryan Bates [authentication-from-scratch](http://railscasts.com/episodes/250-authentication-from-scratch) lesson on Railscasts.

Also uses 'username' rather than 'email' for validation

Commandline:

    rails new authmongoid -O
    cd authmongoid/

Gemfile:

    gem 'bcrypt-ruby', :require => 'bcrypt'
    gem 'mongoid'
    gem 'bson_ext'

Commandline:

    bundle
    rails g mongoid:config
    rails g controller users new
    rails g model user username:string email:string password_hash:string password_salt:string
    rails g controller sessions new
    rm public/index.html
    rails g controller home index
    
See Ryan's cast for more details