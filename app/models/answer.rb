# frozen_string_literal: true

# Answer for test querstion
class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_count_for_question, on: :create

  private

  def validate_count_for_question
    return if question.answers.count < 4

    errors[:base] << I18n.t('too_many_answers',
                            scope: 'activerecord.errors.messages.answer')
  end
end
