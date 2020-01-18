module Handlers
  class Shop < Base

    def initialize(request)
      @request = request
    end

    def response
      if @request.path_info.match /\A#{'/api/shops/'}\d+\z/
        shop_id = @request.path_info.split('/').last
        shop = ::Shop.find_by(id: shop_id)
        return respond_404 unless shop

        respond_200(shop)
      elsif @request.get? && @request.path_info.start_with?(/\A#{'/api/shops'}\z/)
        shops = ::Shop.select(:id, :domain, :name, :is_open)

        respond_200(shops)
      elsif @request.post? && @request.path_info.start_with?(/\A#{'/api/shops'}\z/)

        shop_data = JSON.parse(@request.body.read)
        shop = ::Shop.create(shop_data.slice('domain', 'name', 'address', 'is_open', 'staff_count'))

        respond_200(shop)
      else
        respond_404
      end
    end
  end
end
