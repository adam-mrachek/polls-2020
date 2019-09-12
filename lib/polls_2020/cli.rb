# The CLI Controller

class Polls2020::CLI
  attr_accessor :polls

  def call
    @polls = Polls2020::PollScraper.new.today
    list_polls
    menu
    goodbye
  end

  def list_polls
    system "clear"
    puts "Today's Poll Numbers"
    puts "--------------------"
    display_partial_poll
  end

  def menu
    input = nil
    while input != 'exit'
      puts ""
      puts "Enter the number of a poll to see all candidates, type list to see options again, or type exit:"
      puts ""
      input = gets.chomp.downcase
      if input.to_i > 0 && input.to_i <= @polls.size
        display_full_poll(input.to_i - 1)
      elsif input == 'list'
        list_polls
      elsif input == 'exit'
        break
      else
        puts "Not a valid input. Type list to see options or type exit."
      end
    end
  end

  def display_partial_poll
    @polls.each_with_index do |poll, i|
      puts "#{i + 1}. #{poll.name} (#{poll.date}): #{poll.results[0][0]} - #{poll.results[0][1]}, #{poll.results[1][0]} - #{poll.results[1][1]}"
    end
  end

  def display_full_poll(selection)
    puts ""
    puts "#{@polls[selection].name} (#{@polls[selection].date})"
    puts "---------------------------"
    @polls[selection].results.each do |result|
      puts "  #{result[0]} - #{result[1]}"
    end
  end

  def goodbye
    puts "Thanks for using Polls 2020!"
  end
end
