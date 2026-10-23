# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsReportUserActor < Anthropic::Internal::Type::BaseModel
          # @!attribute deleted
          #   True when the account has been deleted, or when the user is no longer a member
          #   of the organization or its associated organizations (for example, their
          #   membership was removed or they were deprovisioned via your identity provider).
          #   `email_address` stays populated for removed users and is null when the account
          #   has been deleted. `name` follows the rules described on that field. The
          #   `user_id` is still populated for reconciliation.
          #
          #   @return [Boolean]
          required :deleted, Anthropic::Internal::Type::Boolean

          # @!attribute email_address
          #   The user's current email address, including for users who are no longer members
          #   of the organization. Null when the account has been deleted and for
          #   system-minted service accounts.
          #
          #   @return [String, nil]
          required :email_address, String, nil?: true

          # @!attribute name
          #   The user's current full name. Null when the user has not set one.
          #   `"Deleted User"` when the account has been deleted, or when the user is no
          #   longer a member and the organization hides removed users' names.
          #
          #   @return [String, nil]
          required :name, String, nil?: true

          # @!attribute type
          #   Actor type. Always `"user_actor"`.
          #
          #   @return [Symbol, :user_actor]
          required :type, const: :user_actor

          # @!attribute user_id
          #   Tagged user ID.
          #
          #   @return [String]
          required :user_id, String

          # @!method initialize(deleted:, email_address:, name:, user_id:, type: :user_actor)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsReportUserActor} for more
          #   details.
          #
          #   @param deleted [Boolean] True when the account has been deleted, or when the user is no longer a member o
          #
          #   @param email_address [String, nil] The user's current email address, including for users who are no longer members
          #
          #   @param name [String, nil] The user's current full name. Null when the user has not set one. `"Deleted User
          #
          #   @param user_id [String] Tagged user ID.
          #
          #   @param type [Symbol, :user_actor] Actor type. Always `"user_actor"`.
        end
      end
    end
  end
end
