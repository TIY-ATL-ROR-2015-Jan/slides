require 'pry'

class User
  attr_accessor :name, :email, :password, :twitter

  def initialize(name, email)
    @name = name
    @email = email
  end

  def to_s
    "<User> Name: #{@name}, Email: #{@email}, Tweets: #{@twitter}"
  end
end

binding.pry
