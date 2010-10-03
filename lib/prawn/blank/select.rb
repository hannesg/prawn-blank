class Prawn::Blank::Select < Prawn::Blank::Field
  
  def initialize(*args)
    @options = []
    super
  end
  
  
  protected 
    def get_dict
      base = super
      #base[:BS][:S]=:U
      base[:FT]=:Ch
      base[:Opt]=@options
      
      base[:Ff] |= 131072
      
      puts @options.inspect
      
      return base
    end
    
    def default_options
      super().merge({:height=>16})
    end
  
    def self.get_possible_options
      super() + [:font,:font_size, :options]
    end
  public
  attr_accessor *get_possible_options
end