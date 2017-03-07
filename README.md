# Typescript & Durandal Demo application

This application is for demostration purpose only...

Application consumes BreweryDB Api - http://api.brewerydb.com/v2/ 

using jsonapi_resource used as Resource Controller to cater UI requirement
 
### Includes.. 
```
controlers - beers_controller.rb
model - beer.rb
resources - beer_resources.rb
services - brewery_db_client

to fetch beer resource using gem HTTParty 

```
 
UI powered by Typescript, Knockout, Durandal and gulp
use npm, bower package managers and typings to load type definitions

### Installation
Application requires [Node.js](https://nodejs.org/) v5+ to run.

Download and extract the application 
Install the dependencies and devDependencies and start the server.
```sh
$ cd typescript-durandal-app
$ npm install bower -g
$ npm install 
```
To serve gulp from .dev, which has all non-minified files, as this is demo only application
``` sh
$ cd assets
$ gulp serve
```

UI includes.. dashboard only...

Uses the DataTables.net library to load, display data fetch from BreweryDB api