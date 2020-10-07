class GamesController < ApplicationController
  # The new action will be used to display a new random grid and a form.
  # The form will be submitted (with POST) to the score action.
  VOWS = %w(A E I O U)
  CONS = %w(B C D F G H J K L M N P Q R S T V W X Y Z)

  def new
    @letters = Array.new(5) { VOWS.sample }
    @letters += Array.new(5) { CONS.sample }
    @letters.shuffle!
  end

  def score
  end

end
