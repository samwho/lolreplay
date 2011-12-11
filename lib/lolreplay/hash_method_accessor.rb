module HashMethodAccessor
  def method_missing id, *args
    hash_key = id.to_s.gsub(/_./) { $&[1].chr.upcase }.to_sym
    if @data[hash_key].nil?
      super
    else
      @data[hash_key]
    end
  end
end
