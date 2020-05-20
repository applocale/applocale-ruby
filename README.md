# AppLocale

![Tests](https://github.com/applocale/applocale-ruby/workflows/Tests/badge.svg)
![StandardRB](https://github.com/applocale/applocale-ruby/workflows/StandardRB/badge.svg)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)

Welcome to AppLocale's Ruby gem. This gem helps customers of AppLocale.dev to easily pull down their
latest translations with a simple `bundle exec applocale pull`.

Getting started with AppLocale will give you a free 14-day trial.

## Installation

### With our RailsBytes application template:

This application template will install the gem for you, and walk you through setting up a configuration file for your project. You'll need to login to your https://applocale.dev account, click on your avatar and click API Tokens to have the information ready for this step.

You should **always** review contents of scripts you run before hand, you may do so by visiting this url and reading the script: https://railsbytes.com/public/templates/X8Bsjj

```
rails app:template LOCATION="https://railsbytes.com/script/X8Bsjj"
```

### Manually:

Add this line to your application's Gemfile:

```ruby

group :development do
  gem 'applocale-ruby'
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install applocale-ruby

Then follow the instructions in Usage to setup your configuration file.

## Usage

Using AppLocale's gem requires a configuration file to be present. By default we assume this file to
live at `config/applocale.yml` but you can alternatively run each command with `--config-file=path-to-applocale.yml`

You'll need to login to your https://applocale.dev account, click on your avatar and click API Tokens to have the information ready for this step after creating an API Token and Project.

**Sample configuration file:**

```yaml
applocale:
  project_id: 234qfewaf
  api_key: API_KEY_HERE
  locale_directory: "config/locales" # Default, you can override this if you wish.
```

Once you have your configuration file setup for your project you can proceed to use the following commands.

After that, to pull ALL your setup languages in AppLocale:

```
bundle exec applocale pull
```

Or just your specified languages:

```
bundle exec applocale en es
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/applocale/applocale-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

### Code Formatting

This project uses [Standard](https://github.com/testdouble/standard) to minimize bike shedding related to source formatting.

Please run `./bin/format` prior to submitting pull requests.

## Code of Conduct

Everyone interacting in the Applocale::Ruby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/applocale/applocale-ruby/blob/master/CODE_OF_CONDUCT.md).
