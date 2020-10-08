require 'open-uri'

class GamesController < ApplicationController
  # The new action will be used to display a new random grid and a form.
  # The form will be submitted (with POST) to the score action.
  VOWS = %w(A E I O U)
  CONS = %w(B C D F G H J K L M N P Q R S T V W X Y Z)

  def new
    @letters = Array.new(4) { VOWS.sample }
    @letters += Array.new(6) { CONS.sample }
    @letters.shuffle!
  end

  def score
    @letters = params[:letters].split
    @word = (params[:word] || '').upcase
    @included = included?(@word, @letters)
    @english_word = english_word?(@word)
  end

  private

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end

  def included?(word, letters)
    # checks if the letters in the user's word are the same or less than in the letters given
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end
end
