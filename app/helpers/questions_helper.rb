# frozen_string_literal: true

# Questions controller helper
module QuestionsHelper
  # title for Edit or New form of question
  def question_header(question)
    i18n_form_header(question)
  end
end
