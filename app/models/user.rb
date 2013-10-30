class User < ActiveRecord::Base
  # Remember to create a migration!

    def self.authenticate(given_email, given_password)

      user = User.where("email = ? AND password = ?", given_email, given_password).first
      # print "USER DATA:"
      # p user
      return user
    end



end
