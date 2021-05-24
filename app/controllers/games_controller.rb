require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10).join(" ")
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    @answer_comp = URI.open(url).read
    if params[:word].include(@letters)
      "Sorry, but #{params[:word]} doesn't seem to be buildable from #{@letters}"
    elsif @answer_comp.key(found) == false
      "Sorry, but #{params[:word]} doesn't seem to be a valid English word..."
    else
      "Congratulations! #{params[:word]} is a valid English word!"
    end
  end
end


