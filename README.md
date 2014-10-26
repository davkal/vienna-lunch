# Vienna Lunch
This is a web app to show the daily lunch menus of a selection of restaurants in Vienna.

You can suggest a new restaurant by opening an issue. Or, if you have basic Ruby skills, open a pull request.

If you don’t happen to live in Vienna, you can just fork the repo and replace the restaurant files.

Its backend is a Ruby-on-Rails app that uses the restaurants’ Facebook feeds and websites to pull today’s lunch menu.
The frontend is an AngularJS app that shows the menus in columns as well as on a Google map.

## Contributing
To add a new restaurant just open a pull request.

### Setup
* Clone the repo
* Set up RVM for Rails 4.1 and Ruby 2.1, then run `bundler install`
* In the `client/` directory run `bower install`.
* Start the rails server
* Start the JS build environment in `client/` via `gulp serve`
* Point your browser to `http://localhost:9000`

### Adding a restaurant
Restaurants publish the lunch menus in different ways, e.g., their Facebook page or their website. The data source for the restaurant should be reliable and consistent in its publication week after week.
For a new restaurant, a Ruby script needs to be added. Depending on the data source, have a look at the existing scripts:
* Facebook page: [Figar](lib/vienna_lunch/restaurants/figar.rb)
* The restaurant’s website: [Steman](lib/vienna_lunch/restaurants/steman.rb)
* A PDF file linked on the restaurants’s website: [CoteSud](lib/vienna_lunch/restaurants/cote_sud.rb)

The files have to be put in a certain place:
* The new restaurant script needs to be placed under `lib/vienna_lunch/restaurants` and then added to `lib/vienna_lunch/restaurants.rb`.
* A test file should be added under `spec/restaurants`. This can then be run with `rspec spec/restaurants/NAME_spec.rb`. 

In the user interface (`client/`) no change is needed.