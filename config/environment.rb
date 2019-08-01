require 'bundler'
Bundler.require

require_relative '../lib/concerns/memorable'


module Concerns
  module Findable
    def find_by_name(name)
      self.all.find{|n| n.name == name}
    end

    def find_or_create_by_name(name)
      #if self.find_by_name(name)
      #  self.find_by_name(name)
      #else
      #  self.create_by_name(name)
      #end
      # above is same as below
      self.find_by_name(name) || self.create(name)
    end
  end

  require_all 'lib'

end
