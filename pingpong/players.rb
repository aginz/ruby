class Player
  attr_reader :name

  def self
  end

  def initialize
    @name = get_name
  end

  private

  def get_name
    ask("Enter contestant name.")
  end
end
