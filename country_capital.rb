class CountryCapital
  attr_reader :country, :capital

  def initialize(list)
    @country = list[0]
    @country.strip!
    @capital = list[1]
    @capital.strip!
  end

  def to_s
    "#{@country} #{@capital}"
  end
end
