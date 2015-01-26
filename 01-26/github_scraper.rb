require 'httparty'

class Github
  include HTTParty
  base_uri 'github.com'

  def initialize(u)
    @auth = {:username => u}
  end
end
