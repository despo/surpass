# The  XF  record is able to store explicit cell formatting attributes or the
# attributes  of  a cell style. Explicit formatting includes the reference to
# a  cell  style  XF  record. This allows to extend a defined cell style with
# some  explicit  attributes.  The  formatting  attributes  are  divided into
# 6 groups:
# 
# Group           Attributes
# -------------------------------------
# Number format   Number format index (index to FORMAT record)
# Font            Font index (index to FONT record)
# Alignment       Horizontal and vertical alignment, text wrap, indentation, 
#                 orientation/rotation, text direction
# Border          Border line styles and colours
# Background      Background area style and colours
# Protection      Cell locked, formula hidden
# 
# For  each  group  a flag in the cell XF record specifies whether to use the
# attributes  contained  in  that  XF  record  or  in  the  referenced  style
# XF  record. In style XF records, these flags specify whether the attributes
# will  overwrite  explicit  cell  formatting  when  the  style is applied to
# a  cell. Changing a cell style (without applying this style to a cell) will
# change  all  cells which already use that style and do not contain explicit
# cell  attributes for the changed style attributes. If a cell XF record does
# not  contain  explicit  attributes  in a group (if the attribute group flag
# is not set), it repeats the attributes of its style XF record.

COLOURS = {
        'aqua'    => 0x0F,
        'cyan'    => 0x0F,
        'black'   => 0x08,
        'blue'    => 0x0C,
        'brown'   => 0x10,
        'magenta' => 0x0E,
        'fuchsia' => 0x0E,
        'gray'    => 0x17,
        'grey'    => 0x17,
        'green'   => 0x11,
        'lime'    => 0x0B,
        'navy'    => 0x12,
        'orange'  => 0x35,
        'pink'    => 0x21,
        'purple'  => 0x14,
        'red'     => 0x0A,
        'silver'  => 0x16,
        'white'   => 0x09,
        'yellow'  => 0x0D,
}

class Font
  ESCAPEMENT_NONE         = 0x00
  ESCAPEMENT_SUPERSCRIPT  = 0x01
  ESCAPEMENT_SUBSCRIPT    = 0x02
  
  UNDERLINE_NONE          = 0x00
  UNDERLINE_SINGLE        = 0x01
  UNDERLINE_SINGLE_ACC    = 0x21
  UNDERLINE_DOUBLE        = 0x02
  UNDERLINE_DOUBLE_ACC    = 0x22
  
  FAMILY_NONE         = 0x00
  FAMILY_ROMAN        = 0x01
  FAMILY_SWISS        = 0x02
  FAMILY_MODERN       = 0x03
  FAMILY_SCRIPT       = 0x04
  FAMILY_DECORATIVE   = 0x05
  
  CHARSET_ANSI_LATIN          = 0x00
  CHARSET_SYS_DEFAULT         = 0x01
  CHARSET_SYMBOL              = 0x02
  CHARSET_APPLE_ROMAN         = 0x4D
  CHARSET_ANSI_JAP_SHIFT_JIS  = 0x80
  CHARSET_ANSI_KOR_HANGUL     = 0x81
  CHARSET_ANSI_KOR_JOHAB      = 0x82
  CHARSET_ANSI_CHINESE_GBK    = 0x86
  CHARSET_ANSI_CHINESE_BIG5   = 0x88
  CHARSET_ANSI_GREEK          = 0xA1
  CHARSET_ANSI_TURKISH        = 0xA2
  CHARSET_ANSI_VIETNAMESE     = 0xA3
  CHARSET_ANSI_HEBREW         = 0xB1
  CHARSET_ANSI_ARABIC         = 0xB2
  CHARSET_ANSI_BALTIC         = 0xBA
  CHARSET_ANSI_CYRILLIC       = 0xCC
  CHARSET_ANSI_THAI           = 0xDE
  CHARSET_ANSI_LATIN_II       = 0xEE
  CHARSET_OEM_LATIN_I         = 0xFF
  
  PLAIN           = 0x00
  BOLD            = 0x01
  ITALIC          = 0x02
  UNDERLINE       = 0x04
  STRUCK_OUT      = 0x08
  OUTLINE         = 0x010
  SHADOW          = 0x020
  
  attr_accessor :height
  attr_accessor :italic
  attr_accessor :struck_out
  attr_accessor :outline
  attr_accessor :shadow
  attr_accessor :colour_index
  attr_accessor :bold
  attr_accessor :weight
  attr_accessor :escapement
  attr_accessor :underline
  attr_accessor :family
  attr_accessor :charset
  attr_accessor :name
  
  def initialize(hash = {})
    @height = hash[:height] || 0x00C8 # 200: this is font with height 10 points
    @italic = hash[:italic] || false
    @struck_out = hash[:struck_out] || false
    @outline = hash[:outline] || false
    @shadow = hash[:shadow] || false
    
    colour1 = hash[:colour_index]
    colour2 = hash[:color_index]
    colour3 = colour_index_from_name(hash[:colour])
    colour4 = colour_index_from_name(hash[:color])
    colour5 = 0x7FFF
    
    @colour_index = colour1 || colour2 || colour3 || colour4 || colour5
    
    @bold = hash[:bold] || false
    @weight = hash[:weight] || 0x0190 # 0x02BC gives bold font
    @escapement = hash[:escapement] || ESCAPEMENT_NONE
    @underline = hash[:underline] || UNDERLINE_NONE
    @family = hash[:family] || FAMILY_NONE
    @charset = hash[:charset] || CHARSET_SYS_DEFAULT
    @name = hash[:name] || 'Arial'
  end
  
  def colour_index_from_name(colour_name)
    COLOURS[colour_name]
  end
  
  def colour=(colour_name)
    new_colour = colour_index_from_name(colour_name)
    if new_colour.nil?
      raise "Invalid Colour #{colour_name}"
    else
      @colour_index = new_colour
    end
  end
  alias :color= :colour=
  
  def to_biff
    options = PLAIN
    options |= BOLD if @bold
    options |= ITALIC if @italic
    options |= UNDERLINE if (@underline != UNDERLINE_NONE)
    options |= STRUCK_OUT if @struck_out
    options |= OUTLINE if @outline
    options |= SHADOW if @shadow

    @weight = 0x02BC if @bold
    colour_index = COLOURS[@colour_index] || @colour_index
    args = [@height, options, colour_index, @weight, @escapement, @underline, @family, @charset, @name]
    FontRecord.new(*args).to_biff
  end
end

class Alignment
  HORZ_GENERAL                = 0x00
  HORZ_LEFT                   = 0x01
  HORZ_CENTER                 = 0x02
  HORZ_RIGHT                  = 0x03
  HORZ_FILLED                 = 0x04
  HORZ_JUSTIFIED              = 0x05 # BIFF4-BIFF8X
  HORZ_CENTER_ACROSS_SEL      = 0x06 # Centred across selection (BIFF4-BIFF8X)
  HORZ_DISTRIBUTED            = 0x07 # Distributed (BIFF8X)
  
  VERT_TOP                    = 0x00 
  VERT_CENTER                 = 0x01
  VERT_BOTTOM                 = 0x02
  VERT_JUSTIFIED              = 0x03 # Justified (BIFF5-BIFF8X)
  VERT_DISTRIBUTED            = 0x04 # Distributed (BIFF8X)

  DIRECTION_GENERAL           = 0x00 # BIFF8X
  DIRECTION_LR                = 0x01
  DIRECTION_RL                = 0x02

  ORIENTATION_NOT_ROTATED     = 0x00
  ORIENTATION_STACKED         = 0x01
  ORIENTATION_90_CC           = 0x02
  ORIENTATION_90_CW           = 0x03

  ROTATION_0_ANGLE            = 0x00
  ROTATION_STACKED            = 0xFF
  
  WRAP_AT_RIGHT               = 0x01
  NOT_WRAP_AT_RIGHT           = 0x00
  
  SHRINK_TO_FIT               = 0x01
  NOT_SHRINK_TO_FIT           = 0x00
  
  attr_accessor :horz
  attr_accessor :vert
  attr_accessor :dire
  attr_accessor :orie
  attr_accessor :rota
  attr_accessor :shri
  attr_accessor :inde
  attr_accessor :merg

  attr_reader :wrap
  
  def initialize(hash = {})
    # Initialize to defaults.
    @horz = HORZ_GENERAL
    @vert = VERT_BOTTOM
    @wrap = NOT_WRAP_AT_RIGHT
    @dire = DIRECTION_GENERAL
    @orie = ORIENTATION_NOT_ROTATED
    @rota = ROTATION_0_ANGLE
    @shri = NOT_SHRINK_TO_FIT
    @inde = 0
    @merg = 0
    
    # Allow defaults to be overridden in hash. Where there is no :align key in hash,
    # this just leaves the default value in place.
    self.align = hash[:align]
    self.wrap = hash[:wrap]
  end
  
  # Don't support passing constants here because :horz and :vert are exposed
  # so if someone wants to use nasty HORZ_RIGHT they can to align.vert = HORZ_RIGHT
  def align=(arg)
    case arg
    when 'right'
      @horz = HORZ_RIGHT
    when 'left'
      @horz = HORZ_LEFT
    when 'center', 'centre'
      @horz = HORZ_CENTER
    when 'general'
      @horz = HORZ_GENERAL
    when 'filled'
      @horz = HORZ_FILLED
    when 'justify'
      @horz = HORZ_JUSTIFIED
    when nil
      # Do nothing.
    else
      raise "I don't know how to set align to #{arg.inspect}"
    end
  end
  
  def wrap=(arg)
    case arg
    when TrueClass, WRAP_AT_RIGHT
      @wrap = WRAP_AT_RIGHT
    when FalseClass, NOT_WRAP_AT_RIGHT
      @wrap = NOT_WRAP_AT_RIGHT
    when nil
      # Do nothing.
    else
      raise "I don't know how to set wrap to #{arg.inspect}"
    end
  end
end

class Borders
  attr_accessor :left
  attr_accessor :right
  attr_accessor :top
  attr_accessor :bottom
  attr_accessor :diag

  attr_accessor :left_colour
  attr_accessor :right_colour
  attr_accessor :top_colour
  attr_accessor :bottom_colour
  attr_accessor :diag_colour

  attr_accessor :need_diag1
  attr_accessor :need_diag2
  
  NO_LINE = 0x00
  THIN    = 0x01
  MEDIUM  = 0x02
  DASHED  = 0x03
  DOTTED  = 0x04
  THICK   = 0x05
  DOUBLE  = 0x06
  HAIR    = 0x07
  #The following for BIFF8
  MEDIUM_DASHED               = 0x08
  THIN_DASH_DOTTED            = 0x09
  MEDIUM_DASH_DOTTED          = 0x0A
  THIN_DASH_DOT_DOTTED        = 0x0B
  MEDIUM_DASH_DOT_DOTTED      = 0x0C
  SLANTED_MEDIUM_DASH_DOTTED  = 0x0D
  
  NEED_DIAG1      = 0x01
  NEED_DIAG2      = 0x01
  NO_NEED_DIAG1   = 0x00
  NO_NEED_DIAG2   = 0x00
  
  def initialize
    @left   = NO_LINE
    @right  = NO_LINE
    @top    = NO_LINE
    @bottom = NO_LINE
    @diag   = NO_LINE

    @left_colour   = 0x40
    @right_colour  = 0x40
    @top_colour    = 0x40
    @bottom_colour = 0x40
    @diag_colour   = 0x40

    @need_diag1 = NO_NEED_DIAG1
    @need_diag2 = NO_NEED_DIAG2
  end
end

class Pattern
  NO_PATTERN      = 0x00 
  SOLID_PATTERN   = 0x01
  
  attr_accessor :pattern
  attr_accessor :pattern_fore_colour
  attr_accessor :pattern_back_colour
  
  def initialize
    @pattern = NO_PATTERN
    @pattern_fore_colour = 0x40
    @pattern_back_colour = 0x41
  end
end

class Protection
  attr_accessor :cell_locked
  attr_accessor :formula_hidden
  
  def initialize
    @cell_locked = 1
    @formula_hidden = 0
  end
end
