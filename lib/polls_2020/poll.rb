class Polls2020::Poll
  attr_accessor :name, :results, :date

  def initialize
    @results = []
  end
end
