class Prawn::Blank::Appearance
  
  attr_accessor :font,:font_subset,:font_size
  
  def initialize(options={})
    options.each do |k,v|
      self.send "#{k.to_s}=".to_sym,v
    end
  end
  
  def self.cast(hsh)
    if hsh.kind_of? self
      return hsh
    else
      return self.new(hsh)
    end
  end
  
  def to_s
    Prawn::LiteralString.new "/#{font.identifier_for(0)} #{font_size} Tf"
  end
end