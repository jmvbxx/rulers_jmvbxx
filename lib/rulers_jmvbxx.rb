# frozen_string_literal: true

require_relative "rulers_jmvbxx/version"
require "rulers_jmvbxx/array"
require "rulers_jmvbxx/routing"

module RulersJmvbxx
  class Error < StandardError; end

  # This is is main application class (for now)
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404,
                { "Content-Type" => "text/html" }, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, { "Content-Type" => "text/html" },
       [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
