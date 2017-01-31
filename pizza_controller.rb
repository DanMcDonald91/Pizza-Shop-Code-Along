require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza')

# get all the pizzas(index)
get '/pizzas' do
  @pizzas = Pizza.all()
  erb (:index)
  end


# new pizza form
get '/pizzas/new' do
  erb (:new)
  end


# send form using post (create)
post '/pizzas' do
  @pizza = Pizza.new(params)
  @pizza.save
  erb(:create)
  end

# get a pizza by id (show)
get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  erb (:show)
  end

  #Delete a pizza by id(destroy)
  post '/pizzas/:id/delete' do
    Pizza.destroy(params[:id])
    redirect to('/pizzas')

  end

#request edit pizza form (edit)
get '/pizzas/:id/edit' do
  @pizza = Pizza.find(params[:id])
  erb(:edit)
end

#actually update the pizza by id (edit)
post '/pizzas/:id' do
  @pizza = Pizza.update(params)
  redirect to ("/pizzas/#{params[:id]}")

end




