class IpLocationService
  def self.get_location
    Rails.cache.fetch("user-location", expires_in: 2.hours) do
      raw = Faraday.get("https://ipwho.is")
      response = JSON.parse(raw.body, symbolize_names: true)
      require 'pry'; binding.pry # you'll only hit this when the page loads the first time, or after cache invalidation
      response[:city]
    end
  end
end