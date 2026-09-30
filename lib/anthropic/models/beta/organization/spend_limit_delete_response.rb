# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::SpendLimits#delete
        class SpendLimitDeleteResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #
          #   @return [Symbol, :spend_limit_deleted]
          required :type, const: :spend_limit_deleted

          # @!method initialize(id:, type: :spend_limit_deleted)
          #   @param id [String]
          #   @param type [Symbol, :spend_limit_deleted]
        end
      end
    end
  end
end
