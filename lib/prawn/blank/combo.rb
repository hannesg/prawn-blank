class Prawn::Blank::Combo < Prawn::Blank::Select
  
  
  protected 
    def get_dict
      base = super
      
      base[:Ff] |= 262144
      
      return base
    end
  
  
end