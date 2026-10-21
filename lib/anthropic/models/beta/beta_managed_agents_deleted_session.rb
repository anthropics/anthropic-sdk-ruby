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
        #   @return [Symbol, :session_deleted]
        required :type, const: :session_deleted

        # @!method initialize(id:, type: :session_deleted)
        #   Confirmation that a `session` has been permanently deleted.
        #
        #   @param id [String]
        #   @param type [Symbol, :session_deleted]
      end
    end

    BetaManagedAgentsDeletedSession = Beta::BetaManagedAgentsDeletedSession
  end
end
