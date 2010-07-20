
module MrT 

  def from_hash(hash)
    self.attributes.each do |attr_array|
      attr=attr_array.first
      self.send(:"#{attr}=", hash[attr.to_sym]) if self.respond_to? attr
    end
  end

  def to_hash
  end
end
