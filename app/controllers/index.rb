enable :sessions

get '/' do
  # Look in app/views/index.erb
  if session[:valid]
    redirect to "/page_of_secrets"
  else
  erb :index
end
end


post '/signup' do
  @new_user = User.create(params[:user])
  erb :secret
end

#Check login
post '/login' do

  @email = params[:email]
  @password = params[:password]

  @returning_user = User.authenticate(@email, @password)

  if @returning_user
    session[:valid] = true
    redirect to('/page_of_secrets')
  else
    # tell the imposter to go away...
    redirect to('/')
  end

end

get '/logout' do
  session[:valid] = false
  redirect to "/"
end


#Create  a secret page
get '/page_of_secrets' do
  erb :secret
end