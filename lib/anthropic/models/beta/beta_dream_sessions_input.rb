# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaDreamSessionsInput < Anthropic::Internal::Type::BaseModel
        # @!attribute session_ids
        #
        #   @return [Array<String>]
        required :session_ids, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaDreamSessionsInput::Type]
        required :type, enum: -> { Anthropic::Beta::BetaDreamSessionsInput::Type }

        # @!method initialize(session_ids:, type:)
        #   Input session transcripts the dream reads.
        #
        #   @param session_ids [Array<String>]
        #   @param type [Symbol, Anthropic::Models::Beta::BetaDreamSessionsInput::Type]

        # @see Anthropic::Models::Beta::BetaDreamSessionsInput#type
        module Type
          extend Anthropic::Internal::Type::Enum

          SESSIONS = :sessions

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaDreamSessionsInput = Beta::BetaDreamSessionsInput
  end
end
