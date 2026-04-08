# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Sessions#delete
      class BetaManagedAgentsDeletedSession < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeletedSession::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsDeletedSession::Type }

        # @!method initialize(id:, type:)
        #   Confirmation that a `session` has been permanently deleted.
        #
        #   @param id [String]
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeletedSession::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsDeletedSession#type
        module Type
          extend Anthropic::Internal::Type::Enum

          SESSION_DELETED = :session_deleted

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsDeletedSession = Beta::BetaManagedAgentsDeletedSession
  end
end
