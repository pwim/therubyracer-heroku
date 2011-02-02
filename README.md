# therubyracer-heroku

This version of [therubyracer](https://github.com/cowboyd/therubyracer) designed
to work on Heroku hosting.

Original gem doesn't install on Heroku because of some weird V8 compilation errors.
So this gem has prebuild version of V8 for linux amd64 (OS used by Heroku). It
works exactly the same as original on other platforms.

I tested it on Heroku bamboo-mri-1.9.2 stack, not sure will it work on others.

To use add following line to your Gemfile
    gem 'therubyracer-heroku', '0.8.1.pre3'

