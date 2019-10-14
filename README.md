# README

This is Ruby on Rails demo app prepared by Matiss Gaigals.

Briefly about the app:
* Tech specs: Ruby 2.6.3, Rails 6 with Webpacker, Turbolinks, Bootstrap 4

* Assets are compiled with Webpacker. If you have any issues, please `bundle exec rails tmp:cache:clear` in your console.
  If for some reason assets are not working, please, start Webpacker Dev Server with `bundle exec bin/webpack-dev-server`

* To have fresh DB data, feel free to `rails db:reset` - app will seed 5 employees and 3 bikes

* Tests are done with Rspec, so just run `rspec`. Feature and view tests are in progress and may be added later.

* Main features:
  - User can add, edit, remove employees. Soft delete is done, so we keep employee name for historic records.
  - User can add, edit, remove bikes. Soft delete is done, so we keep bike number for historic records.
  - User can add, edit, remove rides. For each ride and employee and time range must be selected.
    App selects the best free bike by two criteria: a) free bikes for given time, b) least used bike.
  - User can see rides by any employee, by bike and all rides in single list.
  - Rides can only be booked in future + only future rides can be edited or deleted.
  - User cannot book a ride if there is not a single bike free for given time period. Before booking app will do
    pre-checking by showing green or red notice if there is any free bike.

* App is created for demo purposes only - no production usage, please.
