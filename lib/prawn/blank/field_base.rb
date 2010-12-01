# -*- encoding : utf-8 -*-
class Prawn::Blank::FieldBase
  
  
  # see pdf reference for documentation
  FF_FLAGS={
    :readonly => 1,
    :required => 2,
    :no_export => 3,
    
    # for text fields
    :multiline => 13,
    :password => 14,
    
    # for buttons
    :no_toggle_to_off => 15
  }
  
  attr_reader :document
  
  
  def initialize(document,*args)
    @document=document
    options = (args.last.kind_of?(Hash) ? args.pop : {})
    Prawn.verify_options self.class.get_possible_options, options
    #puts self.methods.sort.inspect
    options = default_options.merge(options)
    options.each do |k,v|
      self.send "#{k.to_s}=".to_sym,v
    end
    #puts options.inspect
    #@options=options
  end
  
  
  def to_h
    get_dict
  end
  
  
  protected 
    def get_dict
      
      base={
        :Type => :Annot,
        :Subtype => :Widget,
        :F => 4,
        :BS => {:Type => :Border, :W => 1, :S => :S},
        :MK => {:BC => [0, 0, 0]}
      }
      
      unless self.name.nil? or (self.name.kind_of? Prawn::Core::LiteralString) or (self.name.kind_of? Symbol)
        self.name= Prawn::Core::LiteralString.new(self.name)
      end
      
      base[:T]=self.name
      
      unless at.nil?
        base[:Rect]=@document.get_field_rect(self.at, self.width, self.height)
      end
      
      base[:V]=self.value if self.value
      base[:DV]=self.default_value if self.default_value
      
      ff=0
      
      FF_FLAGS.each do |key,value|
        if self.send(key)
          ff += (1<<(value-1))
        end
      end
      
      base[:Ff]=ff
      
      return base
    end
    
    def default_options
      {}
    end
  
    def self.get_possible_options
      [:at, :height, :width, :name, :appearance, :value, :default_value] + FF_FLAGS.keys
    end
  
  public
  attr_accessor *get_possible_options
  
  
end