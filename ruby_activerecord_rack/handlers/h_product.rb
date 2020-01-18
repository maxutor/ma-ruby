module Handlers
  class Product < Base

    def initialize(request)
      @request = request
    end

    def response
      request_arr = @request.path_info.split('/')
      shop_id = request_arr[3]
      category_id = request_arr[5]

      if @request.path_info.match /\A#{'/api/shops/'}\d+#{'/categories/'}\d+#{'/products/'}\d+\z/
        product_id = request_arr.last
        product = ::Product.find_by(shop_id: shop_id, category_id: category_id, id: product_id)
        return respond_404 unless product

        respond_200(product)
      elsif @request.get? && @request.path_info.start_with?(/\A#{'/api/shops/'}\d+#{'/categories/'}\d+#{'/products'}\z/)
        products = ::Product.where(shop_id: shop_id, category_id: category_id).select(:title, :price, :id)

        respond_200(products)
        elsif @request.post? && @request.path_info.start_with?(/\A#{'/api/shops/'}\d+#{'/categories/'}\d+#{'/products'}\z/)

          product_data = JSON.parse(@request.body.read)
          product = ::Product.create(product_data.slice('title', 'price', 'shop_id', 'category_id'))

          respond_200(product)
      else
        respond_404
      end
    end
  end
end
