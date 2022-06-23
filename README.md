# Ruby Rails Pastebin
A fast and easy to use web application used for note sharing.

**Dependencies**
```
Bootstrap
SQLite
```

**Notes**

Use ```bundle install``` to install all the necessary dependencies.

Generate a Paste model and migration using ```rails generate model Paste endpoint:string content:string```.

Optionally add any constraints to the model in the **migration** and **schema** files. Then push the migration to the database with ```rails db:migrate``` and use ```rails server``` to run the web application locally.
