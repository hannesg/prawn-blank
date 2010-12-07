# -*- encoding : utf-8 -*-
class Prawn::Blank::Checkbox < Prawn::Blank::Field
  
  def checked
    return @data[:AS] == :Yes
  end
  
  def checked=(value)
    if value
      @data[:AS] = :Yes
      @data[:V] = :Yes
    else
      @data[:AS] = :Off
      @data[:V] = :Off
    end
  end
  
  def finalize(document)
    # render this field
    
    app = self.appearance || document.default_appearance
    
    @data[:AP] = {:N =>{:Off=>app.checkbox_off(self),:Yes=>app.checkbox_on(self)},
                  :R =>{:Off=>app.checkbox_off_over(self),:Yes=>app.checkbox_on_over(self)},
                  :D =>{:Off=>app.checkbox_off_down(self),:Yes=>app.checkbox_on_down(self)}}
    return
  end
  
  
  protected 
    
    def default_options
      super.merge({:FT=>:Btn})
    end
end
