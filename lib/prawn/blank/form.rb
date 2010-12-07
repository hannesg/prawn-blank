# -*- encoding : utf-8 -*-
class Prawn::Blank::Form < Hash
  def initialize()
    super()
    self[:DR] = {}
    self[:Fields] = []
  end
  
  def add_resource(type,name,dict)
    self[:DR][type] ||={}
    self[:DR][type][name] ||= dict
  end
  
  def add_resources(hash)
    hash.each do |type, names|
      if names.kind_of? Array
        self[:DR][type] ||= []
        self[:DR][type] = self[:DR][type] | names
      else
        names.each do |name,dict|
          add_resource(type, name, dict)
        end
      end
    end
  end
  
  def add_field(field)
    self[:Fields] << field
  end
end
