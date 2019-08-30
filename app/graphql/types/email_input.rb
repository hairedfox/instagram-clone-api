module Types
  class EmailInput < BaseInputObject
    graphql_name 'EMAIL'

    argument :email, String, required: true
  end
end
