require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get('/square/new') do
  erb(:square)
end

get('/square/results') do
  @number = params[:square].to_f
  @square = @number * @number
  erb(:square_results)
end

get('/square_root/new') do
  erb(:sqrt)
end

get('/square_root/results') do
  @number = params[:user_number].to_f
  @square_root = Math.sqrt(@number)
  erb(:sqrt_results)
end

get('/payment/new') do
  erb(:payment)
end

get('/payment/results') do
  # Extract and convert input parameters
  @apr = params[:user_apr].to_f
  @years = params[:user_years].to_i
  @principle = params[:user_pv].to_f
  @monthly_rate = (@apr / 100) / 12

  @num_months = @years * 12

  @numerator = @monthly_rate * @principle
  @denominator = 1 - (1 + @monthly_rate)**-@num_months
  @monthly_payment = @numerator / @denominator

  erb(:payment_results)
end

get('/random/new') do
  erb(:random)
end

get('/random/results') do
  @min = params[:user_min].to_f
  @max = params[:user_max].to_f
  @num = rand(@min..@max)
  erb(:random_results)
end
