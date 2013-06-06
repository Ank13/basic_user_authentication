
class User < ActiveRecord::Base
  include BCrypt

  def self.create_user(name, email, password)
    User.create(name: name, email: email, password: BCrypt::Password.create(password))
  end

  def self.authenticate?(entered_password, email)
    if User.find_by_email(email).nil?
      return nil
    else  
      user = User.find_by_email(email) 
    end 
    BCrypt::Password.new(user.password) == entered_password
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



    # if User.find(user_object.id).nil?
    #     return nil
    #   else  
    #     user = User.find_by_email(email) 
    # end 
