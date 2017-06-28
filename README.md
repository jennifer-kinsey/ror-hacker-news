# Hackernews

This app will save the world. Or it maybe is just recreating Hackernews with Faker data.

# Setup

Required:

* Ruby version 2.2.4

* Bundle

Git clone this repo:
```
git clone https://github.com/jennifer-kinsey/ror-hacker-news
```

Run Bundle

```
bundle install
```

* Database creation and initialization

This app uses Postgres for database storage. Please ensure Postgres is running in the background before executing the following command. If it is not running and is present on the machine you can simply open a new terminal window and run:

```
postgres
```

If it is up and running, you can move on to creating, initializing, and seeding the database with the next command:

```
bundle exec rake db:setup
```

* How to run the test suite

```
rspec
```

* Deployment instructions

Launch Rails:

```
rails server
```

If all goes well you should be able to launch the app in your browser at http://localhost:3000/

If you ran into any issues, Google is your friend.
