get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/login' do
  @user = User.find_by_username(params[:username])
    if @user
      if @user.password == params[:password]
        session[:user_id] = @user.id
        redirect ('/')
      else
        redirect ('/')
      end
    else
      redirect ('/')
    end
end

post '/sign_up' do
  @user = User.create(username: params[:username], password: params[:password], email: params[:email])
  session[:user_id] = @user.id
  if session[:user_id]
   redirect ('/')
 else
   User.find_by_name('idontexist')
 end
end






get '/clear' do
  session.clear
  redirect ('/')
end
