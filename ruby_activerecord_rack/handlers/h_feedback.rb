module Handlers
  require_relative 'base'

  class Feedback < Base

    def initialize(request)
      @request = request
    end

    def response
      request_arr = @request.path_info.split('/')
      product_id = request_arr[7]

      if @request.path_info.match /\A#{'/api/shops/'}\d+#{'/categories/'}\d+#{'/products/'}\d+#{'/feedbacks/'}\d+\z/
        feedback_id = request_arr.last
        feedback = ::Feedback.find_by(product_id: product_id, id: feedback_id)
        return respond_404 unless feedback

        respond_200(feedback)
      elsif @request.get? && @request.path_info.start_with?(/\A#{'/api/shops/'}\d+#{'/categories/'}\d+#{'/products/'}\d+#{'/feedbacks'}\z/)
        feedbacks = ::Feedback.where(product_id: product_id).select(:rate, :id, :username, :comment)

        respond_200(feedbacks)
        elsif @request.post? && @request.path_info.start_with?(/\A#{'/api/shops/'}\d+#{'/categories/'}\d+#{'/products/'}\d+#{'/feedbacks'}\z/)

          feedback_data = JSON.parse(@request.body.read)
          feedback = ::Feedback.create(feedback_data.slice('rate', 'comment', 'product_id'))

          respond_200(feedback)
      else
        respond_404
      end
    end
  end
end


