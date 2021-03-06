require 'shoulda'
require 'shoulda/datamapper/helpers'
require 'shoulda/datamapper/matchers'
require 'shoulda/datamapper/assertions'
require 'shoulda/datamapper/macros'
require 'data_mapper'

module Test # :nodoc: all
  module Unit
    class TestCase
      include Shoulda::DataMapper::Helpers
      include Shoulda::DataMapper::Matchers
      include Shoulda::DataMapper::Assertions
      extend Shoulda::DataMapper::Macros
    end
  end
end

