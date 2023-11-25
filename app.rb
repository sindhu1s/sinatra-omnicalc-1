require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  erb(:hello)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num **2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:squareroot_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = Math.sqrt(@the_num)

  erb(:squareroot_results)
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_f
  @principal = params.fetch("user_pv").to_f
  @r = @apr/1200  
  @n= @years*12
  @payment = ((@r*@principal)/((1-(1+@r)**(-@n)))).round (2)
  erb(:payment_results)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  @min = params.fetch("min_input").to_f
  @max = params.fetch("max_input").to_f
  @random  = (rand@min..@max)
  erb(:random_results)

end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  "
  erb(:hello)
end
