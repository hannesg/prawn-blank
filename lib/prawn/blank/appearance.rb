# -*- encoding : utf-8 -*-
module Prawn::Blank
  class Appearance
  
  attr_accessor :font,:font_subset,:font_size, :checkbox
  
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
    Prawn::Core::LiteralString.new "/#{font.identifier_for(0)} #{font_size} Tf"
  end
  
  def apply_to(field)
    base = {}
    if field.kind_of? Checkbox and checkbox
      #dictionary_name_on, dictionary_on = field.document.send(:stamp_dictionary,checkbox[:on])
      #dictionary_name_off, dictionary_off = field.document.send(:stamp_dictionary,checkbox[:off])
      #field.document.page.xobjects.merge!(dictionary_name_on => dictionary_on,dictionary_name_off => dictionary_off)
      
      base[:AS]=:Yes
      #base[:AP]={:N => {:Yes => dictionary_on, :Off => dictionary_off }}
      base[:AP]={:N => {:Yes => checkbox[:on], :Off => checkbox[:off] }}
    else
      base[:DA]=self.to_s
    end
    return base
  end
  end
end
