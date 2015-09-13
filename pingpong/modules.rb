module CommonMethods
  def ask(question)
    puts
    puts question
    variable = gets.chomp.downcase
    return variable
  end

  def say(something)
    puts
    puts something
    puts
  end
end
