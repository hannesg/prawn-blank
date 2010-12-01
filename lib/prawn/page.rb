# -*- encoding : utf-8 -*-
class Prawn::Core::Page
  
  def appearance_stream(appearance)
    @stamp_stream     = ""
    @stamp_dictionary = appearance.dictionary

    appearance.block.call()
    
    document.instance_eval do
      font.add_to_current_page(0)
      add_content "/#{font.identifier_for(0)} #{font_size} Tf"
    end

    appearance.stream = @stamp_stream

    @stamp_stream      = nil
    @stamp_dictionary  = nil
  end
end
