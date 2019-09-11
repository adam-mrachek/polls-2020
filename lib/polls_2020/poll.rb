class Polls2020::Poll
  attr_accessor :name, :results, :date

  def initialize
    @results = []
  end

  def self.today
    self.scrape_polls
  end

  def self.scrape_polls
    polls = []
    doc = Nokogiri::HTML(open("https://projects.fivethirtyeight.com/polls/president-primary-d/national/"))
    all_polls = doc.search("tr[data-type='president-primary-d']")
    good_polls = all_polls.select do |poll|
      poll_grade = poll.css(".gradeText").text
      ["A+", "A", "A-", "B+", "B", "B-"].include?(poll_grade)
    end

    # date = poll.css(".date-wrapper").text
    # name = poll.css(".pollster-container a:nth-child(2)").text
    # result_name = poll.css(".mobile-answer p").text
    # result_percent = poll.css(".heat-map").text
    # all_results = poll.css(".mobile-answer")
    binding.pry
  end

end
