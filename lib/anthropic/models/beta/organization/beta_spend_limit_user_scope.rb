# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSpendLimitUserScope < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #   Scope type. Always `user` for this scope.
          #
          #   @return [Symbol, :user]
          required :type, const: :user

          # @!attribute user_id
          #   Tagged ID of the member the spend limit applies to.
          #
          #   @return [String]
          required :user_id, String

          # @!method initialize(user_id:, type: :user)
          #   Scope selecting a single member of the organization.
          #
          #   @param user_id [String] Tagged ID of the member the spend limit applies to.
          #
          #   @param type [Symbol, :user] Scope type. Always `user` for this scope.
        end
      end
    end
  end
end
