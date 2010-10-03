module Prawn
  module Blank
    autoload :Form,"prawn/blank/form"
    autoload :Style,"prawn/blank/style"
    autoload :Field,"prawn/blank/field"
    autoload :Appearance,"prawn/blank/appearance"
    autoload :TextField,"prawn/blank/text_field"
    autoload :Checkbox,"prawn/blank/checkbox"
    autoload :Select,"prawn/blank/select"
    autoload :Combo,"prawn/blank/combo"
    
    def text_field(options={})
      f=TextField.new(self,options)
      if block_given?
        yield(f)
      end
      add_field(f)
    end
    
    def select(options={})
      f=Select.new(self,options)
      if block_given?
        yield(f)
      end
      add_field(f)
    end
    
    def combo(options={})
      f=Combo.new(self,options)
      if block_given?
        yield(f)
      end
      add_field(f)
    end
    
    def checkbox(options={})
      f=Checkbox.new(self,options)
      if block_given?
        yield(f)
      end
      add_field(f)
    end
    
    def get_field_rect(at,width,height)
      unless at.nil?
        x,y=map_to_absolute(at)
      else
        x,y=image_position(width,height,{})
        move_text_position height
      end
      return [x,y,x+width,y+height]
    end
    
    #protected
    def add_field(field)
      annotation = ref!(field.to_h)
      acroform.add_field(annotation)
      page.dictionary.data[:Annots] ||= []
      page.dictionary.data[:Annots] << annotation
    end
   
    def acroform
      store.root.data[:AcroForm] ||= ref!(Form.new)
      store.root.data[:AcroForm].data
    end
   
  end
end
require 'prawn/document'
Prawn::Document.extensions << Prawn::Blank
require 'prawn/page'
