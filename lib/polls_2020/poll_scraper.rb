class Polls2020::PollScraper
  attr_accessor :polls, :doc

  def initialize
    @polls = []
    @doc = Nokogiri::HTML(open("https://projects.fivethirtyeight.com/polls/president-primary-d/national/"))
  end

  def today
    scrape_polls
  end

  def scrape_polls
    all_polls = @doc.search("tr[data-type='president-primary-d']")

    good_polls = all_polls.select do |poll|
      poll_grade = poll.css(".gradeText").text
      ["A+", "A", "A-", "B+", "B", "B-"].include?(poll_grade)
    end

    good_polls.each do |poll|
      new_poll = Polls2020::Poll.new
      new_poll.name = poll.css(".pollster-container a:nth-child(2)").text
      new_poll.date = poll.css(".date-wrapper").text

      all_results = poll.css(".mobile-answer")

      new_poll.results = all_results.map do |result|
        candidate_name = result.css("p").text
        candidate_poll = result.css(".heat-map").text
        [candidate_name, candidate_poll]
      end

      @polls << new_poll
    end

    @polls
  end

end
