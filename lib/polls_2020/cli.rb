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
  end

  def menu
    input = nil
    while input != 'exit'
      puts "Enter the number of a poll to see all candidates, type list to see options again, or type exit:"
      input = gets.chomp.downcase
      case input
      when "1"
        puts "Poll numbers for all candidates in poll 1"
      when "2"
        puts "Poll numbers for all candidates in poll 2"
      when "3"
        puts "Poll numbers for all candidates in poll 3"
      when 'list'
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
