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
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDeleteSessionResource::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsDeleteSessionResource::Type }

          # @!method initialize(id:, type:)
          #   Confirmation of resource deletion.
          #
          #   @param id [String]
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDeleteSessionResource::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsDeleteSessionResource#type
          module Type
            extend Anthropic::Internal::Type::Enum

            SESSION_RESOURCE_DELETED = :session_resource_deleted

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
