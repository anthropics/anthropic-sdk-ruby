# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginUserActor < Anthropic::Internal::Type::BaseModel
          # @!attribute email_address
          #   The member's email address; may be null, for example when they are no longer a
          #   member of the organization.
          #
          #   @return [String, nil]
          required :email_address, String, nil?: true

          # @!attribute type
          #   A member of the organization.
          #
          #   @return [Symbol, :user_actor]
          required :type, const: :user_actor

          # @!attribute user_id
          #   The member's User ID.
          #
          #   @return [String]
          required :user_id, String

          # @!method initialize(email_address:, user_id:, type: :user_actor)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaPluginUserActor} for more details.
          #
          #   @param email_address [String, nil] The member's email address; may be null, for example when they are no longer a m
          #
          #   @param user_id [String] The member's User ID.
          #
          #   @param type [Symbol, :user_actor] A member of the organization.
        end
      end
    end
  end
end
