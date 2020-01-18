module Handlers
  class Category < Base

    def initialize(request)
      @request = request
    end

    def response
      request_arr = @request.path_info.split('/')
      shop_id = request_arr[3]

      if @request.path_info.match /\A#{'/api/shops/'}\d+#{'/categories/'}\d+\z/
        category_id = request_arr.last
        category = ::Category.find_by(shop_id: shop_id, id: category_id)
        return respond_404 unless category

        respond_200(category)
      elsif @request.get? && @request.path_info.start_with?(/\A#{'/api/shops/'}\d+#{'/categories'}\z/)
        categories = ::Category.where(shop_id: shop_id).select(:shop_id, :title, :id)

        respond_200(categories)
        elsif @request.post? && @request.path_info.start_with?(/\A#{'/api/shops/'}\d+#{'/categories'}\z/)

          category_data = JSON.parse(@request.body.read)
          category = ::Category.create(category_data.slice('title', 'shop_id'))

          respond_200(category)
      else
        respond_404
      end
    end
  end
end
