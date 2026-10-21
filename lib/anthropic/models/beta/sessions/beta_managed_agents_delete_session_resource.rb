# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        # @see Anthropic::Resources::Beta::Sessions::Resources#delete
        class BetaManagedAgentsDeleteSessionResource < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #
          #   @return [Symbol, :session_resource_deleted]
          required :type, const: :session_resource_deleted

          # @!method initialize(id:, type: :session_resource_deleted)
          #   Confirmation of resource deletion.
          #
          #   @param id [String]
          #   @param type [Symbol, :session_resource_deleted]
        end
      end
    end
  end
end
