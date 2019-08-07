module Mutations
  class CreateUser < BaseMutation
    class SignUpData < Types::BaseInputObject
      argument :email, Types::EmailInput, required: false
    end

    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :auth_provider, SignUpData, required: false

    type Types::UserType

    def resolve(first_name: nil, last_name: nil, auth_provider: nil)
      User.create!(
        first_name: first_name,
        last_name: last_name,
        email: auth_provider&.[](:email)&.[](:email)
      )
    rescue => e
      Rails.logger.debug("Error occurred: #{e}: #{e.message}")
    end
  end
end
