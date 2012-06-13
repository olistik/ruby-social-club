require 'ostruct'

class Contributor
  def initialize(data)
    @data = OpenStruct.new data
  end

  def <=>(other)
    @data.contributions <=> other.contributions
  end

  def method_missing(name, *arg, &block)
    @data.send name, *arg, &block
  end
end
