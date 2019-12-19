module Handlers
  class Tag < Base

    def initialize(request)
      @request = request
    end

    def response
      request_arr = @request.path_info.split('/')

      if @request.path_info.match /\A#{'/api/shops/'}\d+#{'/tags/'}\d+\z/
        tag_id = request_arr.last
        tag = ::Tag.find_by(id: tag_id)
        return respond_404 unless tag

        respond_200(tag)
      else
        respond_404
      end
    end
  end
end

