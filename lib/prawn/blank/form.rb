class Prawn::Blank::Form < Hash
  def initialize()
    super()
    self[:DR] = {}
    self[:Fields] = []
  end
  
  def add_ressource(type,name,dict)
    self[:DR][type] ||={}
    self[:DR][type][name] ||= dict
  end
  
  def add_ressources(hash)
    puts hash.inspect
    hash.each do |type, names|
      names.each do |name,dict|
        add_ressource(type, name, dict)
      end
    end
  end
  
  def add_field(field)
    self[:Fields] << field
  end
end