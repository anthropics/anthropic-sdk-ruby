# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginTargetOrganization < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #   Every member of the organization.
          #
          #   @return [Symbol, :organization]
          required :type, const: :organization

          # @!method initialize(type: :organization)
          #   @param type [Symbol, :organization] Every member of the organization.
        end
      end

      BetaPluginTargetOrganization = Organization::BetaPluginTargetOrganization
    end
  end
end
