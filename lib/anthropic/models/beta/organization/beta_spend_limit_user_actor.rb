# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSpendLimitUserActor < Anthropic::Internal::Type::BaseModel
          # @!attribute deleted
          #   True only when the underlying account has been deleted.
          #
          #   @return [Boolean]
          required :deleted, Anthropic::Internal::Type::Boolean

          # @!attribute email_address
          #   The user's email address. Null when the account is unavailable or has been
          #   deleted.
          #
          #   @return [String, nil]
          required :email_address, String, nil?: true

          # @!attribute name
          #   The user's current display name. Null when the account is unavailable, has been
          #   deleted, or has no name set.
          #
          #   @return [String, nil]
          required :name, String, nil?: true

          # @!attribute type
          #   Actor type. Always `user_actor`.
          #
          #   @return [Symbol, :user_actor]
          required :type, const: :user_actor

          # @!attribute user_id
          #   Tagged ID of the user.
          #
          #   @return [String]
          required :user_id, String

          # @!method initialize(deleted:, email_address:, name:, user_id:, type: :user_actor)
          #   A user within the organization. `name` and `email_address` are null when the
          #   underlying account is unavailable or has been deleted; `deleted` is true only
          #   for deleted accounts.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaSpendLimitUserActor} for more
          #   details.
          #
          #   @param deleted [Boolean] True only when the underlying account has been deleted.
          #
          #   @param email_address [String, nil] The user's email address. Null when the account is unavailable or has been delet
          #
          #   @param name [String, nil] The user's current display name. Null when the account is unavailable, has been
          #
          #   @param user_id [String] Tagged ID of the user.
          #
          #   @param type [Symbol, :user_actor] Actor type. Always `user_actor`.
        end
      end
    end
  end
end
