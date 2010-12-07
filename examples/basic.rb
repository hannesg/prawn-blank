# -*- encoding : utf-8 -*-
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require "rubygems"
gem "prawn"
require "prawn"
require "prawn/blank"

Prawn.debug = true

Prawn::Document.generate("prawn-blank-example.pdf",:page_size=>'A4') do |pdf|
  
  hlv = pdf.find_font("Helvetica")
  
  #pdf.font "argel.ttf"
  pdf.text "Welcome to the first small form example!", :size => 18
  
  page_top = pdf.bounds.top
  page_left = pdf.bounds.left
  
  
  pdf.draw_text "First a textbox:", :at=>[page_left,page_top-50]
  
  pdf.text_field(
    :at => [page_left+ 200,page_top-55],
    :name=>"text",
    :value=>"Try edit me!"
    )
  
  pdf.draw_text "Now a select:", :at=>[page_left,page_top-75]
  
  pdf.select(
    :name=>'select',
    :at => [page_left+ 200,page_top-80],
    :value=>"select me!",
    :editable=>true,
    :options=>['not him!','select me!','no, me!','You can even edit this field ;)']
    )
  
  pdf.draw_text "Now a checkbox:", :at=>[page_left,page_top-100]

  pdf.checkbox(
    :name => 'checkbox',
    :at => [page_left+ 200,page_top-105],
    :checked => true
  )

  pdf.draw_text "and a radio:", :at=>[page_left,page_top-125]
  
  pdf.draw_text "this", :at=>[page_left+215,page_top-130]
  
  pdf.draw_text "no that", :at=>[page_left+265,page_top-130]
  
  pdf.radiogroup(:name => 'radio', :value=>:That) do |rg|
    
    pdf.radio(
      :parent => rg,
      :at=>[page_left+200,page_top-130],
      :value => :This
    )
    
    pdf.radio(
      :parent => rg,
      :at => [page_left+250,page_top-130],
      :value => :That
    )
    
  end
  
  pdf.draw_text "Well that's it for now!", :at=>[page_left,page_top-150]
  
end
