class Contract
  attr_accessor :signed_on, :product

  def initialize signed_on:, product:
    @signed_on = signed_on
    @product = product
  end

  def revenue
    @product.price
  end

  def recognized_revenue date
    portion =
    @product.class.revenue_portions
    .select{|h| @signed_on + h[:days_after] <= date}
    .map{|h| h[:portion]}.sum
    (@product.price * portion).floor
  end
end
