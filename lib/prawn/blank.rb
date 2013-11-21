# -*- encoding : utf-8 -*-
require 'prawn'
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
    autoload :TextStyle,"prawn/blank/text_style"
    
    def text_field(options={})
      if options[:at]
        options[:at] = self.send(:map_to_absolute,options[:at])
      end
      #puts self.bounds.inspect
      f=TextField.create(self,options)
      if block_given?
        yield(f)
      end
      add_field(f)
    end
    
    def select(options={})
      if options[:at]
        options[:at] = self.send(:map_to_absolute,options[:at])
      end
      f=Select.create(self,options)
      if block_given?
        yield(f)
      end
      add_field(f)
    end
    
    def checkbox(options={})
      if options[:at]
        options[:at] = self.send(:map_to_absolute,options[:at])
      end
      f=Checkbox.create(self,options)
      if block_given?
        yield(f)
      end
      add_field(f)
    end
    
    def radiogroup(options={})
      f=RadioGroup.create(self,options)
      if block_given?
        yield(f)
      end
      return add_field(f)
    end
    
    def radio(options={})
      if options[:at]
        options[:at] = self.send(:map_to_absolute,options[:at])
      end
      f=Radio.create(self,options)
      if block_given?
        yield(f)
      end
      return add_field(f)
    end
    
    def acroform
      state.store.root.data[:AcroForm] ||= ref!(Form.new)
      state.store.root.data[:AcroForm].data
    end
    
    attr_accessor :default_appearance
    
    def default_appearance
      @default_appearance ||= Appearance.new(self)
    end
    
protected
    def add_field(field)
      field.finalize(self)
      field.page = page.dictionary
      acroform.add_field(field) if field.root?
      page.dictionary.data[:Annots] ||= []
      page.dictionary.data[:Annots] << field
      return field
    end
  end
  
  def TextStyle(*args)
    
    Prawn::Blank::TextStyle.new(*args)
    
  end
  
  def BorderStyle(doc,width,style=:S)
    {
      :W => width,
      :Type => :Border,
      :S => style
    }
  end
  
  def ColorStyle(doc,fill,stroke)
    {
      :BC => doc.send(:normalize_color,stroke),
      :BG => doc.send(:normalize_color,fill)
    }
  end
  
end
require 'prawn/document'
Prawn::Document.extensions << Prawn::Blank
