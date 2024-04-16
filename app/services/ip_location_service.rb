class IpLocationService
  def self.get_location
    raw = Faraday.get("https://ipwho.is")
    response = JSON.parse(raw.body, symbolize_names: true)
    response[:city]
  end
end