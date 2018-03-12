class User < ActiveRecord::Base
	has_secure_password

	validates :password, :presence => true, :on => :create
	
	 # Validate that :email is email adress
	@email_regex = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/

	validates :email,
           :presence => true,
           :format => { :with => @email_regex}
end
