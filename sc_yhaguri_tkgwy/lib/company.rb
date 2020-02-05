class Company
  attr_accessor :contracts

  def initialize
    @contracts = []
  end

  def gross_revenue(date)
    @contracts.sum do |contract|
      contract.revenue(date)
    end
  end
end
