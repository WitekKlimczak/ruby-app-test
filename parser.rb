#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path(File.join('.', 'lib'), __dir__))

require 'main'

Main.new($stdout).run
