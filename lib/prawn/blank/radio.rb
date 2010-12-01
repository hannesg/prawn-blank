# -*- encoding : utf-8 -*-
module Prawn::Blank
  class Radio < Field
    
    protected 
    def get_dict
      base = super
      base[:FT]=:Btn
      base[:Ff] |= 32768
      if @parent
        base[:Parent] = @parent
      end
      puts base.inspect
      return base
    end
    
    def default_options
      super.merge({:height=>10,:width=>10})
    end
  
    public
    attr_accessor *get_possible_options
    
  end
end
