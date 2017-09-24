# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'TestRM538'
  # app.archs['iPhoneSimulator'] = ['i386']
  app.archs['iPhoneOS'] = ['arm64']
end
