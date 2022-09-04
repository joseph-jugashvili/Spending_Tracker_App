# frozen_string_literal: true

module InputHelper
  def console_input(question = nil)
    puts question if question
    gets.chomp
  end
end
