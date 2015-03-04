# Dead of Thrones

[![Join the chat at https://gitter.im/weslleyaraujo/deadofthrones](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/weslleyaraujo/deadofthrones?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Playing around with the large number of characters that our sweet [George R.R Martin]() killed on the
HBO Serie [Game of Thrones]().

## Installing
To install the app first you must have [MongoDB]() running, and you must create a database named `dead_of_thrones`,
after that execute the following commands:

```
bundle install
MONGOID_ENV=development bundle exec ruby crawler/app.rb
```

Still in development..
