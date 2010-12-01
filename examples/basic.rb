# -*- encoding : utf-8 -*-
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require "rubygems"
gem "prawn"
require "prawn"
require File.join(File.dirname(__FILE__),"../lib/prawn/blank")

Prawn.debug = true

Prawn::Document.generate "text_field.pdf" do |pdf|
  
  checkbox_on_str = "q 1 w 0 g 0 G 0 0 m 10 10 l s 10 0 m 0 10 l s Q"
  checkbox_on = pdf.ref!({:Type => :XObject,
                        :Subtype => :Form,
                        :Ressources => {:ProcSet => [:PDF]},
                        :BBox => [0, 0,10,10],:Length => checkbox_on_str.length})
  checkbox_on << checkbox_on_str
  
  checkbox_off_str = "q Q"
  checkbox_off = pdf.ref!({:Type => :XObject,
                        :Subtype => :Form,
                        :Ressources => {:ProcSet => [:PDF]},
                        :BBox => [0, 0,10,10],:Length => checkbox_off_str.length})
  checkbox_off << checkbox_off_str
  
  
  app = {
      :font=>pdf.find_font("Helvetica"),
      :font_size=>6,
      :checkbox => {:on => checkbox_on, :off => checkbox_off}
    }
  
  
  pdf.text_field(
    :name=>"name",
    :at=>[10,10],
    :width=>100,
    :value=>"Hallooo!",
    :multiline=>true,
    :appearance=>app
    )
    
  pdf.select(
    :name=>"select",
    :at=>[10,100],
    :width=>100,
    :value=>"Duuuuuuu",
    :appearance=>app,
    :options=>["Duuuuuuu","Icchhhhh"]
    )
    
  pdf.combo(
    :name=>"combo",
    :at=>[200,100],
    :width=>100,
    :value=>"Duuuuuuu",
    :appearance=>app,
    :options=>["Duuuuuuu","Icchhhhh"]
    )
    
  pdf.checkbox(
    :name=>'checkbox',
    :at=>[10,200],
    :width=>20,
    :height=>20,
    :value=>:Yes#,
    #:appearance=>app
  )
  
  
end
