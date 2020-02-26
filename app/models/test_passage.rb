# frozen_string_literal: true

# Test passage
class TestPassage < ApplicationRecord
  PASSED_SUCCESSFULLY_LIMIT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  before_validation :before_validation_set_next_question

  scope :success_completed_by_user,
        ->(user) { where(user: user, success_completed: true) }

  # Returns array of test_ids that completed successfully
  # by the user and after the test_passage (passed by parameters)
  scope :success_completed_after_passage,
        lambda { |user_id, test_passage_id|
          where(user_id: user_id, success_completed: true)
            .where('id > ?', test_passage_id).distinct
        }

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
    # If test compleeted we give badges only for success tests
    return unless completed?

    # Give badges whose rules are right on this passage
    BadgesService.new(self).badges.each do |badge|
      UserBadge.new(badge: badge, user: user, test_passage: self)
    end
  end

  def completed?
    current_question.nil?
  end

  def success_percent
    ((correct_questions.to_f / test.questions.count) * 100.0).round
  end

  def percent_finished
    ((current_question_number.to_f / test.questions.count) * 100.0).round
  end

  def success?
    success_percent >= PASSED_SUCCESSFULLY_LIMIT
  end

  def current_question_number
    test.questions.where('id <= :id', id: current_question.id).count
  end

  private

  def before_validation_set_next_question
    self.current_question = next_question
    self.success_completed = completed? && success?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).find_by('id > :id', id: current_question.id)
    end
  end
end
