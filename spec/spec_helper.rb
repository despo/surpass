$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require "surpass"

include Utilities

class Array
  def to_bin
    hex_array_to_binary_string(self)
  end
end
