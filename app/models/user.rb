class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
     message: "I pity the fool that don't use a valid email"}

  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  def self.authenticate(email, password)
    # Login authentication
     user = User.find_by_email(email)

    if password == user.password
      return user
    else
      nil
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
    end
  end

end

