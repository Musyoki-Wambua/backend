class User < ApplicationRecord

    has_one :profile

    has_secure_password
    
    validates :email, {
        uniqueness: true,
        presence: true
    }

end
