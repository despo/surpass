module Utilities
  # For ease of comparing with pyExcelerator output values
  # python seems to automatically decode to hex values
  def hex_array_to_binary_string(array_of_hex_values)
    [array_of_hex_values.collect {|h| [sprintf("%02x", h)]}.join].pack('H*')
  end
  
  def binary_string_to_hex_array(binary_string)
    binary_string.unpack("H*")
  end
  
  # def unicode_pack(string)
  #   string.unpack("C*").collect {|c| [c].pack('Cx')}.join
  # end
  
  def points_to_pixels(points)
    points*(4.0/3)
  end
  
  def pixels_to_points(pixels)
    pixels * (3.0 / 4)
  end
  
  def twips_to_pixels(twips)
    twips / 15.0
  end
  
  def pixels_to_twips(pixels)
    pixels * 15.0
  end
  
  def as_excel_date(date)
    date = DateTime.parse(date.strftime("%c")) if date.is_a?(Time)
    excel_date = (date - Date.civil(1899, 12, 31)).to_f
    excel_date += 1 if excel_date > 59 # Add a day for Excel's missing leap day in 1900
    excel_date
  end
  
  def as_boolean(input)
    case input
    when 1, true
      true
    when 0, false
      false
    else
      raise "Can't convert #{input} from excel boolean!"
    end
  end
  
  def as_numeric(input)
    case input
    when true, 1
      1
    when false, 0
      0
    else
      raise "Can't convert #{input} to excel boolean!"
    end
  end
  
  # Mimic python's "hex" function 0x00
  def hex(value)
    "0x" + value.to_s(16)
  end
end

def String.random_alphanumeric(size=16)
  s = ""
  size.times { s << (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }
  s
end

class TrueClass
  def to_i
    1
  end
end

class FalseClass
  def to_i
    0
  end
end

include Utilities
