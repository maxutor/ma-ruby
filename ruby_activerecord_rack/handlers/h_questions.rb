module Handlers
  class Question < Base

    def initialize(request)
      @request = request
    end

    def response
      request_arr = @request.path_info.split('/')
      product_id = request_arr[7]

      if @request.path_info.match /\A#{'/api/shops/'}\d+#{'/categories/'}\d+#{'/products/'}\d+#{'/questions/'}\d+\z/
        question_id = request_arr.last
        question = ::Question.find_by(product_id: product_id, id: question_id)
        return respond_404 unless question

        respond_200(question)
      elsif @request.get? && @request.path_info.start_with?(/\A#{'/api/shops/'}\d+#{'/categories/'}\d+#{'/products/'}\d+#{'/questions'}\z/)
        questions = ::Question.where(product_id: product_id).select(:comment, :id, :username)

        respond_200(questions)
        elsif @request.post? && @request.path_info.start_with?(/\A#{'/api/shops/'}\d+#{'/categories/'}\d+#{'/products/'}\d+#{'/questions'}\z/)

          question_data = JSON.parse(@request.body.read)
          question = ::Question.create(question_data.slice('comment', 'product_id', 'username'))

          respond_200(question)
      else
        respond_404
      end
    end
  end
end
