class Company
  attr_reader :contracts

  def initialize
    @contracts = []
  end

  def make_contracts *contract
    @contracts.push(*contract)
  end

  def gross_revenue date
    @contracts.map{|c| c.recognized_revenue date }.sum
  end
end
