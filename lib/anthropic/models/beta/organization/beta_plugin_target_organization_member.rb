# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginTargetOrganizationMember < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #   One member of the organization.
          #
          #   @return [Symbol, :organization_member]
          required :type, const: :organization_member

          # @!attribute user_id
          #   The member's User ID.
          #
          #   @return [String]
          required :user_id, String

          # @!method initialize(user_id:, type: :organization_member)
          #   @param user_id [String] The member's User ID.
          #
          #   @param type [Symbol, :organization_member] One member of the organization.
        end
      end
    end
  end
end
