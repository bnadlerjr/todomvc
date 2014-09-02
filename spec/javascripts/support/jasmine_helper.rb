#Use this file to set/override Jasmine configuration options
#You can remove it if you don't need it.
#This file is loaded *after* jasmine.yml is interpreted.

require "sprockets"

Jasmine.configure do |config|
  %w(source spec).each do |f|
    config.add_rack_path("/#{f}/", lambda {
      Sprockets::Environment.new do |env|
        env.append_path("#{f}/javascripts")
        env.append_path("bower_components")
      end
    })
  end
end
