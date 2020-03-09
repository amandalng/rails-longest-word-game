require 'open-uri'

class GamesControllerController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    @word_array = params[:word].upcase.split("")
    @letters_array = params[:letters].split("")

    # recognize when the word cannot be built out of the original grid

    @grid_validity = true
    @word_array.each do |letter|
      if @letters_array.include?(letter) == false
        @grid_validity = false
      else
        @letters_array.delete_at(@letters_array.index(letter))
      end
    end

    # recognize when the word is valid according to the grid, but not a valid English word (lewagon dictionary)

    @english_validity = true
    word_check_serialized = open("https://wagon-dictionary.herokuapp.com/#{params[:word]}").read
    word_check = JSON.parse(word_check_serialized)
    if word_check['found'] == false
      @english_validity = false
    end

    # recognize when the word is valid according to grid and English dictionary
  end
end
