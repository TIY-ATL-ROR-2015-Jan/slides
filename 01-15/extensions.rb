class Hash
  def with_symbolic_keys
    rows = self.map do |key, value|
      [key.to_sym, value]
    end
    rows.to_h
  end

  def sub_hash(*keys)
    out = {}
    keys.each do |k|
      out[k] = self[k]
    end
    out
  end

  def invert
    self.map { |x| x.reverse }.to_h
  end
end

class String
  def first(n=1)
    self.slice(0, n)
  end
end
