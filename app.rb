require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/random/new") do

  erb(:random_calc)
end

get("/random/results") do
  @min = params.fetch("users_minimum").to_f
  @max = params.fetch("users_maximum").to_f

  @result = rand(@min..@max)

  erb(:random_results)
end



get("/payment/new") do

  erb(:payment_calc)
end

get("/payment/results") do
  @the_years = params.fetch("users_years").to_f
  @the_apr = params.fetch("users_apr").to_f
  @the_principal = params.fetch("users_principal").to_f

  month_payment = (@the_apr / 100.0) /12
  total_bills = @the_years * 12

  @the_result = @the_principal * (month_payment * (1 + month_payment) ** total_bills) / ((1 + month_payment) ** total_bills - 1)
  @the_result = @the_result.round(2)

  erb(:payment_results)
end


get("/square_root/new") do

  erb(:root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = Math.sqrt(@the_num)

  erb(:square_results)
end

get("/square/new") do

  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result =@the_num ** 2

  erb(:square_results)
end
