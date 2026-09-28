# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginOwnerOrganization < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #   The Plugin lives in a plugin marketplace the organization owns.
          #
          #   @return [Symbol, :organization]
          required :type, const: :organization

          # @!method initialize(type: :organization)
          #   @param type [Symbol, :organization] The Plugin lives in a plugin marketplace the organization owns.
        end
      end

      BetaPluginOwnerOrganization = Organization::BetaPluginOwnerOrganization
    end
  end
end
