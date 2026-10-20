# frozen_string_literal: true

module Anthropic
  module Models
    module UserProfiles
      class UserProfileEnrollEndUserAction < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :enroll_end_user]
        required :type, const: :enroll_end_user

        # @!method initialize(type: :enroll_end_user)
        #   The end-user that the profile represents enrolls in a program.
        #
        #   @param type [Symbol, :enroll_end_user]
      end
    end

    UserProfileEnrollEndUserAction = UserProfiles::UserProfileEnrollEndUserAction
  end
end
