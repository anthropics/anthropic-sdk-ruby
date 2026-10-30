# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class SpendLimitOrganizationScope < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :organization]
        required :type, const: :organization

        # @!method initialize(type: :organization)
        #   @param type [Symbol, :organization]
      end
    end
  end
end
