# -*- encoding : utf-8 -*-
class Prawn::Blank::Field < Prawn::Blank::FieldBase
  
  protected 
    def get_dict
      base = super
      if self.appearance
      
        app=Prawn::Blank::Appearance.cast(self.appearance)
        
        app.font.instance_eval do 
          @references[0] ||= register(0)
          @document.acroform.add_ressource(:Font,identifier_for(0),@references[0])
        end
        
        base.merge! app.apply_to(self)
      end
      return base
    end
end
