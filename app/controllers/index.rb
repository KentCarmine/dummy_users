enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/user/new' do
  erb :new_user
end

post '/user/new' do
  @user = User.create(email: params[:email], password: params[:password], name: params[:name])
  redirect to '/'
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.authenticate(params[:email], params[:password])
  session[:logged_in] = true unless user.nil?
  redirect to "/secret_page"
end

get '/secret_page' do
  if(session[:logged_in] == true)
    erb :secret_page
  else
    erb :not_logged_in
  end
end

get '/logout' do
  session[:logged_in] = false
  erb :index
end