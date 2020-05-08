require_relative 'config/environment'

class App < Sinatra::Base
  
  get '/reversename/:name' do
    user_name = params[:name]
    "#{user_name.reverse}"
  end

  get '/square/:number' do
    @number = params[:number].to_i
    @sqrnumber = @number * @number
    "Squared number = #{@sqrnumber}"
  end
  
  get '/say/:number/:phrase' do
    times = params[:number].to_i
    phrase = params[:phrase]
    "#{phrase * times}"
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    word1 = params[:word1]
    word2 = params[:word2]
    word3 = params[:word3]
    word4 = params[:word4]
    word5 = params[:word5]
    "#{word1} #{word2} #{word3} #{word4} #{word5}."
  end

  get '/:operation/:number1/:number2' do
    operation = params[:operation]
    operator = nil
    if operation == 'add'
      operator = :+
    elsif operation == 'subtract'
      operator = :-
    elsif operation == 'multiply'
      operator = :*
    elsif operation == 'divide'
      operator = :/
    end
    number1 = params[:number1].to_i
    number2 = params[:number2].to_i
    result = number1.public_send(operator, number2)
    "#{result}"
  end

end