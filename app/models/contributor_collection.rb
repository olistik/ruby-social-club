require 'json'
require 'faraday'

class ContributorCollection
  include Enumerable

  def each
    contributors.each {|contributor| yield contributor}
  end

  private
  def contributors
    @contributors ||= fetch
  end

  def fetch
    github_data = REDIS.get 'contributors'
    unless github_data
      github_data = Faraday.get('https://api.github.com/repos/olistik/ruby-social-club/contributors').body
      REDIS.set 'contributors', github_data
      REDIS.expire 'contributors', 12.hours
    end
    contributors = JSON.parse github_data
    contributors.map do |contributor|
      Contributor.new contributor
    end
  end

end
