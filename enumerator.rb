class PrimeNumbers
  def self.each
    yield 1
    yield 2
    yield 3
    yield 5
    yield 7
    yield 11
  end
end

class Array
  def each_odd
    # each do |item|
    #   if item.odd?
    #     yield item
    #   end
    # end
    #
    # Enumerator.new do |block|
    #
    # end

    # to_enum(:each) do |item|
    #   block yield if item.odd?
    # end

    to_enum(:each) do |number|
      yield number if number.odd?
    end
  end
end

class UnderFiveIterator
  def initialize(collection)
    @collection = collection
  end

  def each_under_five
    @collection.each do |item|
      if item < 5
        yield item
      end
    end
  end
end
