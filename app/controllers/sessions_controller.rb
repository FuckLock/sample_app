class SessionsController < ApplicationController
	def new
	end 

	def create 
		#params[:session][:email].downcase取出的密码转化为小写
		#在通过User.find_by_email传入这个email找到这个对象
		user = User.find_by_email(params[:session][:email].downcase)
		#判断这两个都为true则返回的是true
		#authenticate这个方法会通过这个输入的密码，在调用user对象自动取数据库
		#中寻找判断密码是否正确，如果正确则返回true，否则返回false
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else
			flash.now[:error] = 'Invalid email/password combination' # Not quite right!
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
	
end
