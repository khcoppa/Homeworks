class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.length
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
    elsif count >= @size
      #make space
      @cache.shift
      @cache << el
    else
      @cache << el
    end
  end

  def show
    puts @cache
  end
end