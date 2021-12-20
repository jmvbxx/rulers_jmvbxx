# frozen_string_literal: true

require_relative "rulers_jmvbxx/version"

module RulersJmvbxx
  class Error < StandardError; end

  class Application
    def call(env)
      [200, {'Content-Type' => 'text/html'},
       ['Hello from Ruby on RulersJmvbxx!']]
    end
  end
end
