# frozen_string_literal: true

require "rulers_jmvbxx/version"
require "rulers_jmvbxx/array"
require "rulers_jmvbxx/routing"
require "rulers_jmvbxx/util"
require "rulers_jmvbxx/dependencies"
require "rulers_jmvbxx/controller"

module RulersJmvbxx
  class Error < StandardError; end

  # This is is main application class (for now)
  class Application
    def call(env)
      case env["PATH_INFO"]
      when "/favicon.ico"
        [404, { "Content-Type" => "text/html" }, []]
      when "/test"
        [200, { "Content-Type" => "text/html" }, [File.read("test/index.html")]]
      when "/search"
        [301, { "Location" => "https://google.com" }, []]
      else
        klass, act = get_controller_and_action(env)
        controller = klass.new(env)
        text = controller.send(act)
        [200, { "Content-Type" => "text/html" }, [text]]
      end
    end
  end
end
