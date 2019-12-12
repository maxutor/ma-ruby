class Question < ActiveRecord::Base
  belongs_to :product

  validates :comment, length: { maximum: 256 }, presence: true
  validates :username, length: { in: 3..56 }, presence: true

  before_save :question_state

  private

  def question_state
    self.is_open = admin_answer.blank?
  end
end
