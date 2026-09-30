# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsUserActor < Anthropic::Internal::Type::BaseModel
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
          #   The user's email address, including for users who are no longer members of the
          #   organization or its associated organizations. Null when the account has been
          #   deleted (check `deleted`) and for system-minted service accounts, which have no
          #   person's mailbox behind them (check `name`).
          #
          #   @return [String, nil]
          required :email_address, String, nil?: true

          # @!attribute name
          #   The user's full name. Null when the user has not set a name. Returns
          #   `"Deleted User"` when the account itself has been deleted, or when the user is
          #   no longer a member of the organization or its associated organizations and the
          #   organization has chosen to hide the names of removed users. Otherwise, the name
          #   stays populated for removed users. Rows for system-minted service accounts
          #   render the service name (for example, `"Claude Security"` for usage by
          #   Anthropic's security-patching service) or null.
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
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsUserActor} for more
          #   details.
          #
          #   @param deleted [Boolean] True when the account has been deleted, or when the user is no longer a member o
          #
          #   @param email_address [String, nil] The user's email address, including for users who are no longer members of the o
          #
          #   @param name [String, nil] The user's full name. Null when the user has not set a name. Returns `"Deleted U
          #
          #   @param user_id [String] Tagged user ID.
          #
          #   @param type [Symbol, :user_actor] Actor type. Always `"user_actor"`.
        end
      end
    end
  end
end
