# frozen_string_literal: true

# Text provided bu Rebuilding Rails and modified by rubocop
module RulersJmvbxx
  def self.to_underscore(string)
    string.gsub(/::/, "/")
          .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
          .gsub(/([a-z\d])([A-Z])/, '\1_\2')
          .tr("-", "_")
          .downcase
  end
end
