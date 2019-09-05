# The CLI Controller

class Polls2020::CLI
  def call
    list_polls
  end

  def list_polls
    puts "Today's Poll Numbers"
    puts <<-DOC
      Quinnipiac (9/3/2018): Biden - 32%, Warren - 13%, Sanders - 16%
      Economist/YouGov (9/4/2018): Biden - 26%, Warren - 22%, Sanders - 14%
      Harvard-Harris (9/3/2018): Biden - 32%, Warren - 24%, Sanders - 16%
    DOC
  end
end
