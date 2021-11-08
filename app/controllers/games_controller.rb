require 'json'
require 'open-uri'
class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { [*'A'..'Z'].sample }
  end

  def score
    @answer = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    @score = JSON.parse(open(url).read)
    # split_letters = @answer.upcase.split('')
    # letters = params['letters'].split('')
    if !@score['found']
      @return_phrase = "I\'m sorry but #{@answer} is not in ENGLISH!"
    elsif params[:letters].include?(@answer)
      @return_phrase = "You should have used only #{letters.join('')} and #{@answer} does not cut it! Try again!"
    else
      @return_phrase = 'You Rock!'
    end
  end
end
