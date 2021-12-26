# frozen_string_literal: true

require_relative "rulers_jmvbxx/version"
require "rulers_jmvbxx/array"
require "rulers_jmvbxx/routing"

module RulersJmvbxx
  class Error < StandardError; end

  # This is is main application class (for now)
  class Application
    def call(env)
      if env["PATH_INFO"] == "/favicon.ico"
        [404, { "Content-Type" => "text/html" }, []]
      elsif env["PATH_INFO"] == "/test"
        [200, { "Content-Type" => "text/html" }, [File.read("public/index.html")]]
      elsif env["PATH_INFO"] == "/search"
        [301, { "Location" => "https://google.com" }, []]
      else
        klass, act = get_controller_and_action(env)
        controller = klass.new(env)
        text = controller.send(act)
        [200, { "Content-Type" => "text/html" }, [text]]
      end
    end
  end

  # This is the first controller gem
  class Controller
    def initialize(env)
      @env = env
    end

    attr_reader :env
  end
end
