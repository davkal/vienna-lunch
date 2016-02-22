# Vienna Lunch

![Screenshot](screenshot.png?raw=true)

This is a web app to show the daily lunch menus of a selection of restaurants in Vienna.

You can suggest a new restaurant by opening an issue. Or, if you have basic Ruby skills, open a pull request.

Its backend is a Ruby-on-Rails app that uses the restaurants’ Facebook feeds and websites to pull today’s lunch menu.
The frontend is an AngularJS app that shows the menus in columns as well as on a Google map.

*If you don’t happen to live in Vienna, you can just fork the repo and replace the restaurant files.*

## Contributing
To add a new restaurant just open a pull request.

### Setup
* Make sure you have libxml2 and friends installed: `brew install libxslt`
* Clone the repo
* Set up Rails 4.1 and Ruby 2.1, e.g. `rbenv install 2.1.3 && rbenv local 2.1.3` then run `bundler install`
* In the `client/` directory run `bower install`.
* Start the rails server `FB_APP_ID=your-app-id FB_APP_ID=your-client-secret rails s --env=production` (if you leave out the `--env` it will use test menus from `lib/vienna_lunch/support/restaurants.json`, so you can leave it out if you just want to develop the UI)
* Start the JS build environment in `client/` via `gulp serve`
* Point your browser to `http://localhost:9000`

### Use of Facebook API

Facebook now requires all requests to the graph API to have a valid access token.
If you want to add/maintain restaurants that publish their menu on their Facebook page, you need to get an App Access Token from `https://developers.facebook.com/apps/`.
To run the app or the tests, you need to have `FB_APP_ID` and `FB_CLIENT_SECRET` set as environment variables.

### Adding a restaurant
Restaurants publish the lunch menus in different ways, e.g., their Facebook page or their website. The data source for the restaurant should be reliable and consistent in its publication week after week.
For a new restaurant, a Ruby script needs to be added. Depending on the data source, have a look at the existing scripts:
* Facebook page: [Figar](lib/vienna_lunch/restaurants/figar.rb)
* The restaurant’s website: [Steman](lib/vienna_lunch/restaurants/steman.rb)
* A PDF file linked on the restaurants’s website: [CoteSud](lib/vienna_lunch/restaurants/cote_sud.rb)

The files have to be put in a certain place:
* The new restaurant script needs to be placed under `lib/vienna_lunch/restaurants` and then added to `lib/vienna_lunch/restaurants.rb`.
* A test file should be added under `spec/restaurants`. This can then be run with `FB_APP_ID=your-app-id FB_APP_ID=your-client-secret rspec spec/restaurants/NAME_spec.rb`. 

In the user interface (`client/`) no change is needed.

### Screen scraping API
* For Facebook pages, the page’s RSS feed is used. For that you need to look up the Facebook ID of the restaurant page and put that in the `MENU_URL`. [This website](http://findmyfacebookid.com/) can help you find the ID based on the page.
* For scraping the HTML of the restaurant’s website, just use [Nokogiri](http://www.rubydoc.info/github/sparklemotion/nokogiri)
* For PDF menus, I included this [wrapper as `pdf_helper.rb`](http://blog.peschla.net/2014/04/parsing-pdf-text-with-coordinates-in-ruby/) which is based on [pdf-reader](https://github.com/yob/pdf-reader). 
