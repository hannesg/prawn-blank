# -*- encoding : utf-8 -*-
module Prawn::Blank
  class Appearance
  
  
    class Item
      
      
      def self.arguments(args={})
        @arguments = args
      end
      
      def cache_key(elem)
        
      end
      
      
    end
  
    attr_reader :document
    
    STYLE = {
      
      :border_color => '202020',
      :background_color => 'ffffff',
      :border_width => 1
      
    }
    
    def initialize(document)
      @document = document
      @cache = {}
      #@style = STYLE.dup
    end
    
    def render(dict)
      dict = {:Subtype => :Form,
      :Resources => {:ProcSet => [:PDF, :ImageC, :ImageI, :ImageB]}}.merge(dict)
      
      result = @document.ref!(dict)
      @document.state.page.stamp_stream(result) do
        yield
      end
      @document.acroform.add_resources(result.data[:Resources])
      return result
    end
    
    def button(element)
      if !element.width or element.width <= 0
        element.width = 10
      end
      if !element.height or element.height <= 0
        element.height = 10
      end
      width = element.width
      height = element.height
      style = element.style ||= Prawn::ColorStyle(@document,'ffffff','000000')
      border_style = element.border_style ||= Prawn::BorderStyle(@document,1)
      return cached(:checkbox_off, width, height, style, border_style) do
        render( :BBox => [0, 0, width, height] ) do
          document.canvas do
            # render background
            document.fill_color( *denormalize_color(style[:BG]) )
            document.stroke_color( *denormalize_color(style[:BC]) )
            document.line_width(border_style[:W])
            bw = border_style[:W]/2.0
            document.fill_and_stroke_rectangle( [bw, height - bw], width - border_style[:W], height - border_style[:W] )
          end
        end
      end
    end
    
    alias_method :button_over, :button
    alias_method :button_down, :button
    
    def checkbox_off(element)
      if !element.width or element.width <= 0
        element.width = 10
      end
      if !element.height or element.height <= 0
        element.height = 10
      end
      width = element.width
      height = element.height
      style = element.style ||= Prawn::ColorStyle(@document,'ffffff','000000')
      border_style = element.border_style ||= Prawn::BorderStyle(@document,1)
      return cached(:checkbox_off, width, height, style, border_style) do
        render( :BBox => [0, 0, width, height] ) do
          document.canvas do
            # render background
            document.fill_color( *denormalize_color(style[:BG]) )
            document.stroke_color( *denormalize_color(style[:BC]) )
            document.line_width(border_style[:W])
            bw = border_style[:W]/2.0
            document.fill_and_stroke_rectangle( [bw, height - bw], width - border_style[:W], height - border_style[:W] )
          end
        end
      end
    end
    
    alias_method :checkbox_off_over, :checkbox_off
    alias_method :checkbox_off_down, :checkbox_off
    
    def checkbox_on(element)
      if !element.width or element.width <= 0
        element.width = 10
      end
      if !element.height or element.height <= 0
        element.height = 10
      end
      width = element.width
      height = element.height
      style = element.style ||= Prawn::ColorStyle(@document,'ffffff','000000')
      border_style = element.border_style ||= Prawn::BorderStyle(@document,1)
      return cached(:checkbox_on, width, height, style, border_style) do
        render( :BBox => [0, 0, width, height] ) do
          document.canvas do
            # render background
            document.fill_color( *denormalize_color(style[:BG]) )
            document.stroke_color( *denormalize_color(style[:BC]) )
            document.line_width(border_style[:W])
            bw = border_style[:W]/2.0
            document.fill_and_stroke_rectangle( [bw, height - bw], width - border_style[:W], height - border_style[:W] )
            document.stroke_line(0,0,width, height)
            document.stroke_line(width,0,0, height)
          end
        end
      end
    end
    
    alias_method :checkbox_on_over, :checkbox_on
    alias_method :checkbox_on_down, :checkbox_on
    
    def radio_off(element)
      if !element.width or element.width <= 0
        element.width = 10
      end
      if !element.height or element.height <= 0
        element.height = 10
      end
      width = element.width
      height = element.height
      style = element.style ||= Prawn::ColorStyle(@document,'ffffff','000000')
      border_style = element.border_style ||= Prawn::BorderStyle(@document,1)
      return cached(:radio_off, width, height, style, border_style) do
        render( :BBox => [0, 0, width, height] ) do
          document.canvas do
            # render background
            document.fill_color( *denormalize_color(style[:BG]) )
            document.stroke_color( *denormalize_color(style[:BC]) )
            document.line_width(border_style[:W])
            rx = (width / 2.0)
            ry = (height / 2.0)
            document.fill_and_stroke_ellipse_at([rx,ry], rx-border_style[:W], ry-border_style[:W])
          end
        end
      end
    end
    
    alias_method :radio_off_over, :radio_off
    alias_method :radio_off_down, :radio_off
    
    def radio_on(element)
      if !element.width or element.width <= 0
        element.width = 10
      end
      if !element.height or element.height <= 0
        element.height = 10
      end
      width = element.width
      height = element.height
      style = element.style ||= Prawn::ColorStyle(@document,'ffffff','000000')
      border_style = element.border_style ||= Prawn::BorderStyle(@document,1)
      return cached(:radio_on, width, height, style, border_style) do
        render( :BBox => [0, 0, width, height] ) do
          document.canvas do
            # render background
            document.fill_color( *denormalize_color(style[:BG]) )
            document.stroke_color( *denormalize_color(style[:BC]) )
            document.line_width(border_style[:W])
            rx = (width / 2.0)
            ry = (height / 2.0)
            document.fill_and_stroke_ellipse_at([rx,ry], rx-border_style[:W], ry-border_style[:W])
            
            document.fill_color( *denormalize_color(style[:BC]) )
            document.fill_ellipse_at([rx,ry], rx-border_style[:W]-2, ry-border_style[:W]-2)
          end
        end
      end
    end
    
    alias_method :radio_on_over, :radio_on
    alias_method :radio_on_down, :radio_on
    
    def text_field(element)
      
      text_style = element.text_style ||= Prawn::TextStyle(@document,"Helvetica",9,'000000')
      border_style = element.border_style ||= Prawn::BorderStyle(@document,1)
      
      if !element.width or element.width <= 0
        element.width = 100
      end
      if !element.height or element.height <= 0
        element.height = text_style.size + 6 + 2 * border_style[:W]
      end
      width = element.width
      height = element.height
      style = element.style ||= Prawn::ColorStyle(@document,'ffffff','000000')
      multiline = element.multiline
      value = element.value
      return cached(:text_field, width, height, style, border_style, text_style, multiline, value) do
        render( :BBox => [0, 0, width, height] ) do
          document.canvas do
          document.save_font do
            # render background
            document.fill_color( *denormalize_color(style[:BG]) )
            document.stroke_color( *denormalize_color(style[:BC]) )
            document.line_width(border_style[:W])
            bw = border_style[:W]/2.0
            document.fill_and_stroke_rectangle( [bw, height - bw], width - border_style[:W], height - border_style[:W])
            if text_style
              document.font(text_style.font, :size=>text_style.size )
              document.fill_color( *text_style.color )
            end
            if value
              document.draw_text(value, :at =>[border_style[:W]+1, [1,height - document.font_size - border_style[:W]- 1.5].max ] )
            end
          end
          end
        end
      end
    end
    
    
protected
    def cached(*args)
      @cache[args] ||= yield
    end
    
    def denormalize_color(color)
      s = color.size
      if( s == 1 ) # gray
        return [0,0,0,color[0]]
      elsif( s == 3 ) # rgb
        return Prawn::Graphics::Color.rgb2hex(color.map{|component| component * 255.0})
      elsif( s == 4 ) # cmyk
        return color.map{|component| component * 100.0}
      end
      raise "Unknown color: #{color}"
    end
    
  end
end
