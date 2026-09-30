# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsUser < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Tagged user identifier (e.g. `user_...`)
          #
          #   @return [String]
          required :id, String

          # @!attribute email_address
          #   Email address of the user
          #
          #   @return [String]
          required :email_address, String

          # @!attribute type
          #   Object type. Always `user`.
          #
          #   @return [Symbol, :user]
          required :type, const: :user

          # @!method initialize(id:, email_address:, type: :user)
          #   A user in the organization, identified by tagged id and email address.
          #
          #   @param id [String] Tagged user identifier (e.g. `user_...`)
          #
          #   @param email_address [String] Email address of the user
          #
          #   @param type [Symbol, :user] Object type. Always `user`.
        end
      end
    end
  end
end
