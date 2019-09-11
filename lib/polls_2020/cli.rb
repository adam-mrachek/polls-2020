# The CLI Controller

class Polls2020::CLI
  attr_accessor :polls
  def call
    list_polls
    menu
    goodbye
  end

  def list_polls
    puts "Today's Poll Numbers"
    @polls = Polls2020::Poll.today
    @polls.each_with_index do |poll, i|
      puts "#{i + 1}. #{poll.name} (#{poll.date}): #{poll.results[0][0]} - #{poll.results[0][1]}, #{poll.results[1][0]} - #{poll.results[1][1]}, #{poll.results[2][0]} - #{poll.results[2][1]}"
    end
  end

  def menu
    input = nil
    while input != 'exit'
      puts "Enter the number of a poll to see all candidates, type list to see options again, or type exit:"
      input = gets.chomp.downcase
      if input.to_i > 0 && input.to_i <= @polls.size
        display_full_poll(input.to_i - 1)
      elsif input == 'list'
        list_polls
      else
        puts "Not a valid input. Type list to see options or type exit."
      end
    end
  end

  def display_full_poll(selection)
    puts "#{@polls[selection].name} (#{@polls[selection].date})"
    @polls[selection].results.each do |result|
      puts "#{result[0]} - #{result[1]}"
    end
  end

  def goodbye
    puts "Thanks for using Polls 2020!"
  end
end
