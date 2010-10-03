class Prawn::Blank::Checkbox < Prawn::Blank::Field
  
  
  protected 
    def get_dict
      base = super
      base[:FT]=:Ch
      
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