class String
  def underscore
    if defined? super
      super
    else  
      self.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
    end  
  end
end  

module  HashSymbolizeKeys
  def underscore_and_symbolize_keys!
    keys.each do |key|
      self[(key.to_s.underscore.to_sym rescue key)] = delete(key) if key.respond_to?(:to_sym) && !key.is_a?(Fixnum)
    end
    self
  end
    
  def recursive_symbolize_keys!
    underscore_and_symbolize_keys!
    values.select { |v| v.is_a?(Hash) }.each { |h| h.recursive_symbolize_keys! }
    self
  end
end

class Hash
  include HashSymbolizeKeys
end
