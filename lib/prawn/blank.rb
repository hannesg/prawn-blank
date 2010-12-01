# -*- encoding : utf-8 -*-
module Prawn
  module Blank
    autoload :Form,"prawn/blank/form"
    autoload :Style,"prawn/blank/style"
    autoload :FieldBase,"prawn/blank/field_base"
    autoload :Field,"prawn/blank/field"
    autoload :Appearance,"prawn/blank/appearance"
    autoload :TextField,"prawn/blank/text_field"
    autoload :Checkbox,"prawn/blank/checkbox"
    autoload :Select,"prawn/blank/select"
    autoload :Combo,"prawn/blank/combo"
    autoload :RadioGroup, "prawn/blank/radio_group"
    autoload :Radio, "prawn/blank/radio"
    
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
    
    def radiogroup(options={})
      f=RadioGroup.new(self,options)
      if block_given?
        yield(f)
      end
      return add_field(f)
    end
    
    def radio(options={})
      f=Radio.new(self,options)
      if block_given?
        yield(f)
      end
      return add_field(f)
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
      hsh = field.to_h
      annotation = ref!(hsh)
      if hsh.key? :Kids
        hsh[:Kids].each do |kid|
          if kid.kind_of? Prawn::Reference
            kid.data[:Parent] = annotation
          end
        end
      end
      acroform.add_field(annotation)
      page.dictionary.data[:Annots] ||= []
      page.dictionary.data[:Annots] << annotation
      return annotation
    end
   
    def acroform
      state.store.root.data[:AcroForm] ||= ref!(Form.new)
      state.store.root.data[:AcroForm].data
    end
    
    
   
  end
end
require 'prawn/document'
Prawn::Document.extensions << Prawn::Blank
require 'prawn/page'
