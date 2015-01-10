# todomvc
Sample todomvc implementation using [knockoutJS](http://knockoutjs.com/index.html).

## About
This is my version of the [todomvc](http://todomvc.com/) application using [knockoutJS](http://knockoutjs.com/index.html). The project also uses [Middleman](http://middlemanapp.com/) for handling HTML templating and stylesheet / javascript management. The core app is written in [CoffeeScript](http://coffeescript.org/).

### Project Layout
The standard Middleman [project layout](http://middlemanapp.com/basics/directory-structure/) is used. The `source/javascripts` folder is organized into 3 sub-folders for KnockoutJS models, view models and bindings.

```
├── Gemfile
├── Gemfile.lock
├── Rakefile
├── README.md
├── bower.json
├── config.rb
├── source
│   ├── images
│   │   └── ...
│   ├── index.html.erb # main page
│   ├── javascripts
│   │   ├── all.coffee # main app
│   │   ├── bindings
│   │   │   └── ...    # custom KnockoutJS bindings
│   │   ├── models
│   │   │   └── ...    # KnockoutJS models
│   │   └── viewmodels
│   │       └── ...    # KnockoutJS view models
│   ├── layouts
│   │   └── ...
│   └── stylesheets
│       └── ...
└── spec
    └── javascripts
        ├── bindings
        │   └── ...    # custom binding specs
        ├── models
        │   └── ...    # model specs
        ├── spec.js    # spec runner
        ├── support
        │   └── ...    # Jasmine support files
        └── viewmodels
            └── ...    # view model specs
```

## Development
### Setup
1. Clone the repository
2. Install Ruby dependencies (`bundle install`)
2. Install Bower dependencies (`bower install`)

### Running the Development Server
Middleman provides a server for running the project locally. Use `bundle exec middleman` to start it. See the Middleman [Getting Started](http://middlemanapp.com/basics/getting-started/) page for more information.

### Running Specs
Specs are written using [Jasmine](http://jasmine.github.io/). The Jasmine [gem](https://github.com/pivotal/jasmine-gem) provides two Rake tasks for running the specs. `bundle exec rake jasmine` will start a Jasmine server that provides a web page with the spec results. `bundle exec rake jasmine:ci` will run the specs and output the results on the command line.

### Issues
Use [GitHub issues](http://github.com/bnadlerjr/todomvc/issues) for reporting bug and feature requests.

### Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
(The MIT License)

Copyright (c) 2014-2015 Bob Nadler, Jr.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
