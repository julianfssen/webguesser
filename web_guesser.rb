require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

def check_guess(guess, num)
    if guess > num
        "Too high."
    elsif guess < num
        "Too low."
    else
        "You got it right!"
    end
end

get '/' do
    guess = params["guess"].to_i
    message = check_guess(guess, number)
    erb :index, :locals => {:number => number, :guess => params["guess"], :message => message}
end