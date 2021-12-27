# frozen_string_literal: true

# dependencies class
class Object
  def self.const_missing(const)
    require RulersJmvbxx.to_underscore(const.to_s)
    Object.const_get(const)
  end
end
