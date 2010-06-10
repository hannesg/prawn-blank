class Prawn::Blank::Field
  
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
  
  def initialize(document,*args)
    @document=document
    options = (args.last.kind_of?(Hash) ? args.pop : {})
    Prawn.verify_options self.class.get_possible_options, options
    puts self.methods.sort.inspect
    options = default_options.merge(options)
    options.each do |k,v|
      self.send "#{k.to_s}=".to_sym,v
    end
    puts options.inspect
    #@options=options
  end
  
  
  def to_h
    get_dict
  end
  
  
  protected 
    def get_dict
      
      app=Prawn::Blank::Appearance.cast(self.appearance)
      
      app.font.instance_eval do 
        @references[0] ||= register(0)
        @document.acroform.add_ressource(:Font,identifier_for(0),@references[0])
      end
      
      base={
        :Type => :Annot,
        :Subtype => :Widget,
        :DA => app.to_s,
        :F => 4,
        :BS => {:Type => :Border, :W => 1, :S => :S},
        :MK => {:BC => [0, 0, 0]}
      }
      unless self.name.kind_of? Prawn::LiteralString
        self.name= Prawn::LiteralString.new(self.name)
      end
      
      base[:T]=self.name
      
      base[:Rect]=@document.get_field_rect(self.at, self.width, self.height)
      
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