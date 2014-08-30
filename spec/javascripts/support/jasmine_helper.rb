#Use this file to set/override Jasmine configuration options
#You can remove it if you don't need it.
#This file is loaded *after* jasmine.yml is interpreted.

require "sprockets"

Jasmine.configure do |config|
  config.add_rack_path("/source/", lambda {
    Sprockets::Environment.new do |env|
      env.append_path("source/javascripts")
    end
  })

  config.add_rack_path("/spec/", lambda {
    Sprockets::Environment.new do |env|
      env.append_path("spec/javascripts")
    end
  })
end
