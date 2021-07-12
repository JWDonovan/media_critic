# Media Critic

Media Critic is a website to rate and review your favorite movies. Users can also read reviews created by others to determine what movies they want to watch.

## Installation

Prerequisites: `ruby`, `gem`, `bundle`, and `postgresql` must be installed

Clone the GitHub repository:

```bash
$ git clone git@github.com:JWDonovan/media_critic.git
```

Once in the project directory, install the dependencies:

```bash
$ bundle install
```

## Usage

To get a local version of the project working, you must first setup a local database.
Media Critic uses PostgreSQL, so this must be installed and running in order to proceed.
Make sure your user has proper permissions to access the Postgres databases.

```bash
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

Once the database is setup, start the webserver:

```bash
$ rails s
```

Check the output from the rails server to see which hostname and port the website is running on.
By default, it should be running on (http://127.0.0.1:3000).
Navigate to the url in your browser to see the website.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JWDonovan/media_critic/. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The repository is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT)