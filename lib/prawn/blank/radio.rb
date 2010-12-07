# -*- encoding : utf-8 -*-
module Prawn::Blank
  class Radio < Field
    
    def value=(v)
      @value = v
    end
    
    def value
      @value
    end
    
    def finalize(document)
    # render this field
      
      app = self.appearance || document.default_appearance
    
      @data[:AP] = {:N =>{:Off=>app.radio_off(self), @value=>app.radio_on(self)},
                    :R =>{:Off=>app.radio_off_over(self),@value=>app.radio_on_over(self)},
                    :D =>{:Off=>app.radio_off_down(self),@value=>app.radio_on_down(self)}}
      @data[:AS] = (self.parent.value == @value) ? @value : :Off
      @data[:V] = @value
    return
  end
    
    protected
    def default_options
      super.merge({:FT => :Btn, :Ff => 32768})
    end

    
  end
end
