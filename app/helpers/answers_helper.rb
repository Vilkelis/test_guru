# frozen_string_literal: true

# Answers controller helper
module AnswersHelper
  # title for Edit or New form of answer
  def answer_header(answer)
    action = answer.new_record? ? 'Create New' : 'Edit'
    "#{action} Answer for Question \"#{answer.question.body}\""
  end
end
