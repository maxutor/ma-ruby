class Question < ActiveRecord::Base
  belongs_to :product
  validates :comment, length: { maximum: 256 }, presence: true
  validates :username, length: { in: 3..56 }, presence: true
  before_save :question_state
  before_validation :ensure_username

  private
  def question_state
    self.is_open = self.admin_answer.blank?
  end

  def ensure_username
    self.username = 'Anon' if self.username.blank?
  end
end
