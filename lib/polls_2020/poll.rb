class Polls2020::Poll
  attr_accessor :name, :results

  def self.today
    self.scrape_polls
    # poll_1 = self.new
    # poll_1.name = "Quinnipiac"
    # poll_1.results = ['Biden 32', 'Warren 16', 'Sanders 14']
    #
    # poll_2 = self.new
    # poll_2.name = "IDP/PPP"
    # poll_2.results = ['Biden 24', 'Warren 24', 'Sanders 14']
    #
    # poll_3 = self.new
    # poll_3.name = "YouGov"
    # poll_3.results = ['Biden 28', 'Warren 20', 'Sanders 18']
    #
    # [poll_1, poll_2, poll_3]
  end

  def self.scrape_polls
    polls = []

    polls << self.scrape_quinnipiac

    polls
  end

  def self.scrape_quinnipiac
    doc = Nokogiri::HTML(open("https://projects.fivethirtyeight.com/polls/president-primary-d/national/"))
    poll = test = doc.search("tr.visible-row")
    binding.pry
  end

  def self.scrape_idp

  end

  def self.scrape_yougov

  end
end
