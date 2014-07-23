= Tlab
== Installation
add

``` ruby
  mount Tlab::Engine => "/blog"

```

to your routes.rb

run `rake tlab:install:migrations` from the terminal to install migrations.

enjoy ;)


== Authentication

The freerunning technologies site uses google oauth 2 to authenticate
users. To successfully authenticate, the domain must be in google's
white list of acceptable redirect points for your api key.

Currently, other than the production URL, the only available url for
redirect is set up at: http://localhost:5000/.

The API is managed through the google API console, which can be accessed
here:

https://code.google.com/apis/console/b/0/#project:141361864778:access

To successfully authenticate, you must also have the client id and
client secret set up in your environment variables:

export GOOGLE_OAUTH_ACCESS_ID=<my_client_id_here>
export GOOGLE_OAUTH_SECRET=<my_secret_here>
