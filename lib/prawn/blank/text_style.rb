# -*- encoding : utf-8 -*-
module Prawn::Blank
  class TextStyle < Prawn::Core::LiteralString
    
    attr_reader :font, :color, :size
    
    def initialize(document, font,size,color,font_subset=0)
      @font = font
      @font_subset = font_subset
      @size = size
      @color = color
      @color = [@color] unless color.kind_of? Array
      super("/#{document.font(font).identifier_for(font_subset)} #{size} Tf #{document.send(:color_to_s,*@color)} #{color_cmd(@color)}")
    end
    
    def color_cmd(color)
      if color[0].kind_of? String
        return 'rg'
      else
        return 'k'
      end
    end
  end
end