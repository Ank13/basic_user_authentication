
class User < ActiveRecord::Base
  include BCrypt



  def create
  end



end



  # Non-encrypted authentication:
  # def self.authenticate(email, password)  
  #   if User.find_by_email(email).nil?
  #     return nil
  #   else  
  #     user = User.find_by_email(email) 
  #   end 

  #   if user.password == password
  #     return user
  #   else
  #     return nil
  #   end
  # end
