class Polls2020::Poll
  attr_accessor :name, :results

  def self.today
    puts <<-DOC
      1. Quinnipiac (9/3/2018): Biden - 32%, Warren - 13%, Sanders - 16%
      2. Economist/YouGov (9/4/2018): Biden - 26%, Warren - 22%, Sanders - 14%
      3. Harvard-Harris (9/3/2018): Biden - 32%, Warren - 24%, Sanders - 16%
    DOC

    poll_1 = self.new
    poll_1.name = "Quinnipiac"
    poll_1.results = ['Biden 32', 'Warren 16', 'Sanders 14']

    poll_2 = self.new
    poll_2.name = "IDP/PPP"
    poll_2.results = ['Biden 24', 'Warren 24', 'Sanders 14']

    poll_3 = self.new
    poll_3.name = "YouGov"
    poll_3.results = ['Biden 28', 'Warren 20', 'Sanders 18']

    [poll_1, poll_2, poll_3]
  end
end
