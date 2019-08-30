module Mutations
  class LogIn < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    type Types::UserType

    def resolve(email: nil, password: nil)
      # TODO: Login User
    end
  end
end
