$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require "rubygems"
gem "prawn"
require "prawn"
require File.join(File.dirname(__FILE__),"../lib/prawn/blank")

Prawn.debug = true

Prawn::Document.generate "text_field.pdf" do |pdf|
  
  app = {
      :font=>pdf.find_font("Courier",:style=>:bold_italic),
      :font_size=>1
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
    :value=>:Yes,
    :appearance=>app
  )
end