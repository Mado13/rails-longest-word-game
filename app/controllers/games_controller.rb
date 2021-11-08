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
    split_letters = @answer.split('')
    letters = params['letters'].split('')
    @return_phrase = if !@score['found']
                       'The word you entered is not in ENGLISH!'
                     elsif !(split_letters - letters).empty?
                       'Youre word SUCK! its not made out of the letter i gave you!'
                     else
                       'You Rock!'
                     end
  end
end
