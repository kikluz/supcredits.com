class SquareApi

  def initialize()
    @headers = {:Authorization => SQUAREUP_CONFIG['auth'], accept: :json}
  end

  def get_squareup_customer(customer_id)
    self.rails_error_handler do
      response = RestClient.get "https://connect.squareup.com/v2/customers/#{customer_id}", @headers
      return JSON.parse(response)['customer']
    end
  end

  def get_squareup_customers()
    self.rails_error_handler do
      headers = {:Authorization => SQUAREUP_CONFIG['auth'], accept: :json}
      response = RestClient.get 'https://connect.squareup.com/v2/customers', @headers
      return JSON.parse(response)['customers']
    end
  end

  def create_squareup_customer(customer_hash)
    self.rails_error_handler do
      result = RestClient.post 'https://connect.squareup.com/v2/customers', customer_hash.to_json, @headers
      return result
    end
  end

  def get_squareup_locations
    self.rails_error_handler do
      response = RestClient.get 'https://connect.squareup.com/v2/locations', @headers
      return JSON.parse(response)["locations"]
    end
  end

  def get_squareup_items(location_id)
    self.rails_error_handler do
      response = RestClient.get "https://connect.squareup.com/v1/#{location_id}/items", @headers
      return JSON.parse(response)
    end
  end

  def rails_error_handler
    begin

      return yield

    rescue => e
      Rails.logger.error e.inspect
      raise
    end
  end

end
