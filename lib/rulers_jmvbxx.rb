# frozen_string_literal: true

require_relative "rulers_jmvbxx/version"
require "rulers_jmvbxx/array"

module RulersJmvbxx
  class Error < StandardError; end

  # This is is main application class (for now)
  class Application
    def call(_env)
      `echo debug > debug.txt`
      [200, { "Content-Type" => "text/html" },
       ["Hello from Ruby on RulersJmvbxx!"]]
    end
  end
end
