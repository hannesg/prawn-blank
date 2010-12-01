# -*- encoding : utf-8 -*-
class Prawn::Blank::TextField < Prawn::Blank::Field
  
  
  
  protected 
    def get_dict
      base = super
      base[:BS][:S]=:U
      base[:FT]=:Tx
      
      return base
    end
    
    def default_options
      super().merge({:height=>16})
    end
  
    def self.get_possible_options
      super() + [:font,:font_size]
    end
  public
  attr_accessor *get_possible_options
end
