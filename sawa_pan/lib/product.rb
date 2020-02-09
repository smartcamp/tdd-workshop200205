class Product
  def self.type; end

  def self.revenue_portions; end

  attr_accessor :name, :price

  def initialize name:, price:
    @name = name
    @price = price
  end
end

class WordProcessor < Product
  def self.type; 'W' end
  def self.revenue_portions; [{days_after: 0, portion: 1r}] end
end

class SpreadSheet < Product
  def self.type; 'S' end
  def self.revenue_portions
    [
      {days_after: 0, portion: 2/3r},
      {days_after: 60, portion: 1/3r}
    ]
  end
end

class Database < Product
  def self.type; 'D' end
  def self.revenue_portions
    [
      {days_after: 0, portion: 1/3r},
      {days_after: 60, portion: 1/3r},
      {days_after: 120, portion: 1/3r}
    ]
  end
end