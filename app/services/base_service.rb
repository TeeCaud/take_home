class BaseService
	class << self

		def get_json(response)
			JSON.parse(response.body, symbolize_names: true)
		end

		def conn
			Faraday.new(url: "http://localhost:3000")
		end
	end
end
