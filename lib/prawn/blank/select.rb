# -*- encoding : utf-8 -*-
class Prawn::Blank::Select < Prawn::Blank::Field
  
  def initialize(*args)
    super
    self.combo = true
  end
  
  def finalize(document)
    # render this field
    
    app = self.appearance || document.default_appearance
    
    @data[:AP] = {:N=>app.text_field(self)}
    @data[:AS] = :N
    
    #document.acroform.add_resources(da.data[:Resources])
    
    return
  end
  
  protected
    def default_options
      super.merge({:FT => :Ch})
    end
end
