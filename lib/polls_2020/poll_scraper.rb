class Polls2020::PollScraper

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

    good_polls.each do |poll|
      new_poll = Polls2020::Poll.new
      new_poll.name = poll.css(".pollster-container a:nth-child(2)").text
      new_poll.date = poll.css(".date-wrapper").text

      all_results = poll.css(".mobile-answer")

      all_results.each do |result|
        candidate = []
        candidate << result.css("p").text
        candidate << result.css(".heat-map").text
        new_poll.results << candidate
      end
      polls << new_poll
    end

    polls
  end

end
