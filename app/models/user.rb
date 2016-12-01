class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if !admin
      if nausea > happiness
        'sad'
      elsif nausea < happiness
        'happy'
      end
    else
      nil
    end
  end
end
