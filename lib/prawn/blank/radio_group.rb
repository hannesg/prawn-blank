# -*- encoding : utf-8 -*-
module Prawn::Blank
  class RadioGroup < Field
    
    attr_accessor :children
    
    def radio(*args)
      @children ||= []
      rd = @document.radio(*args)
      @children << rd
      @opt ||= []
      @opt << rd.data[:T]
    end
    
    protected 
    def get_dict
      base = super
      base[:FT]=:Btn
      puts base.inspect
      base[:Ff] |= 32768
      if children
        base[:Kids] = children
        #base[:Opt] = @opt
      end
      base.delete :Rect
      return base
    end
    
    def default_options
      super.merge({:height=>10,:width=>10})
    end
  
    def self.get_possible_options
      super
    end
  public
  attr_accessor *get_possible_options
  end
end
