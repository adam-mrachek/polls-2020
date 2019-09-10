# The CLI Controller

class Polls2020::CLI
  def call
    list_polls
    menu
    goodbye
  end

  def list_polls
    puts "Today's Poll Numbers"
    @polls = Polls2020::Poll.today
    @polls.each_with_index do |poll, i|
      puts "#{i + 1}. #{poll.name} - #{poll.results}"
    end
  end

  def menu
    input = nil
    while input != 'exit'
      puts "Enter the number of a poll to see all candidates, type list to see options again, or type exit:"
      input = gets.chomp.downcase
      if input.to_i > 0 && input.to_i < @polls.size
        puts @polls[input.to_i - 1].name
      elsif input == 'list'
        list_polls
      else
        puts "Not a valid input. Type list to see options or type exit."
      end
    end
  end

  def goodbye
    puts "Thanks for using Polls 2020!"
  end
end
