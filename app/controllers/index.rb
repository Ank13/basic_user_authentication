get '/' do
  erb :index
end

post '/create' do
  name = params[:name]
  email = params[:email]
  password = params[:password]
  @user = User.create(name: name, email: email, password: BCrypt::Password.create(password))
  @name = @user.name
  session[:user_id] = @user.id
  erb :secret
end

post '/login' do 
    @user = User.find_by_email(params[:email])
    if BCrypt::Password.new(@user.password) == params[:password]
      session[:user_id] = @user.id
      @name = @user.name
      erb :secret
    else
      redirect '/'
    end
end

get '/secret' do
  if session[:user_id] 
      authentication = User.find(session[:user_id])
      @name = authentication.name
      erb :secret
  else
    redirect '/'
  end
end

get '/logout' do 
  session.clear
  redirect '/'
end

# Non-encrypted login:
  # authentication = User.authenticate(params[:email], params[:password]) 
  # if authentication.nil?
  #   redirect '/'
  # else
  #   @name = authentication.name
  #   session[:user_id] = authentication.id
  #   erb :secret
  # end
