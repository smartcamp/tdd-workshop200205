require 'date'

class Contract
  attr_reader :product, :signed_on
  def initialize(product:, signed_on:)
    @product = product
    @signed_on = signed_on
  end

  def revenue(date)
    case product.type
    when 'W'
      word_revenue(date)
    when 'S'
      excel_revenue(date)
    when 'D'
      db_revenue(date)
    else
      0
    end
  end

  private
  def word_revenue(date)
    product.price
  end

  def excel_revenue(date)
    return product.price if date >= Date.today.next_day(30)
    product.price / 3 * 2
  end

  def db_revenue(date)
    return product.price if date >= Date.today.next_day(120)
    return product.price / 3 * 2 if date >= Date.today.next_day(60)
    product.price / 3 * 1
  end
end
