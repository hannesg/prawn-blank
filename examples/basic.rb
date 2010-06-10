$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require "rubygems"
gem "prawn"
require "prawn"
require File.join(File.dirname(__FILE__),"../lib/prawn/blank")

Prawn.debug = true

Prawn::Document.generate "text_field.pdf" do |pdf|
  pdf.text_field(
    :name=>"name",
    #:at=>[10,10],
    :width=>100,
    :value=>"Hallooo!",
    :multiline=>true,
    :appearance=>{
      :font=>pdf.find_font("Courier",:style=>:bold_italic),
      :font_size=>7
    })
end