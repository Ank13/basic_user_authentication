
class User < ActiveRecord::Base
  include BCrypt

  def self.authenticate(email, password)  
    if User.find_by_email(email).nil?
      return nil
    else  
      user = User.find_by_email(email) 
    end 

    if user.password == password
      return user
    else
      return nil
    end
  end

  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end


end

# if email and password correspond to a valid user, return that user
    # otherwise, return nil
