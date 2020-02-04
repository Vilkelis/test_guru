# frozen_string_literal: true

# Answers controller helper
module AnswersHelper
  # title for Edit or New form of answer
  def answer_header(answer)
    i18n_form_header(answer)
  end
end
