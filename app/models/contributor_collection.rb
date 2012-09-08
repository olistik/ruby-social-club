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
      contributors_list = JSON.parse(Faraday.get('https://api.github.com/repos/olistik/ruby-social-club/contributors').body)
      github_data = contributors_list.map do |contributor| 
        JSON.parse(Faraday.get(contributor["url"]).body) 
      end.to_json
      REDIS.set 'contributors', github_data
      REDIS.expire 'contributors', 12.hours
    end

    contributors = JSON.parse github_data
    contributors.map do |contributor|
      Contributor.new contributor
    end
  end

end
