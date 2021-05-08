# Recipebook

## Usage guide

App deployed on heroku and can be accessed at 
1. To list all recipe list https://obscure-waters-29784.herokuapp.com/recipes
2. To view detailed description of any recipe click on title of above recipes page

Note: The page loading can be very slow or may timeout due to free version of heroku on which the app is deployed. In case of timeout reattempt to fetch url will fix it.

## Alternatively the app can be deployed locally with below steps.
1. Copy to local folder `git clone https://github.com/nisujju/recipebook.git && cd recipebook`
2. Make sure pgsql is installed locally as app uses Postgres
3. Run `EDITOR="nano" bin/rails credentials:edit` and update the credentials and make sure master.key file is present. It should not be uploaded on github. \
`contentful:` \
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`space_id: <spaceid string>` \
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`access_token: <accesstoken>`
4. `bundle install` to install all gem locally. It requires ruby version 2.7.2. Make sure its available and in use before running bundle install
5. Run `bin/rails db:create` `bin/rails db:migrate` to create and migrate db.
6. Run `bin/rake migrate_data:create_contentful_id_reference` to migrate contentful_id from contentful to local db for referencing.
7. Start server with `rails s` and visit localhost:3000/recipes for visiting index page for all recipes. 
  
