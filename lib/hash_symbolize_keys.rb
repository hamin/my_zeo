module  HashSymbolizeKeys
  def symbolize_keys!
    if defined? super
      super
    else
      keys.each do |key|
        self[(key.to_sym rescue key)] = delete(key) if key.respond_to?(:to_sym) && !key.is_a?(Fixnum)
      end
      self
    end    
  end
    
  def recursive_symbolize_keys!
    symbolize_keys!
    values.select { |v| v.is_a?(Hash) }.each { |h| h.recursive_symbolize_keys! }
    self
  end
end

class Hash
  include HashSymbolizeKeys
end