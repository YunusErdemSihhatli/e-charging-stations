require 'faraday'

class OpenChargeMap
  API_URL = "https://api.openchargemap.io/v3/poi"

  # ENV variable
  API_KEY = "6ae9b37b-062a-4788-bfdd-1a18922bcb1e"

  def initialize
  end

  def get_data
    uri = URI(API_URL)
    params = { 
      key: API_KEY,
      maxresults: 1000  
    }
    headers = { 'Content-Type': 'application/json' }

    response = Faraday.get(uri, params, headers)

    if response.success?
      return JSON.parse(response.body)
    else
      raise "Error: #{response}"
    end
  end
end
