# frozen_string_literal: true

# Questions controller helper
module QuestionsHelper
  # title for Edit or New form of question
  def question_header(question)
    action = question.new_record? ? 'Create New' : 'Edit'
    "#{action} \"#{@question.test.title}\" Question"
  end
end
