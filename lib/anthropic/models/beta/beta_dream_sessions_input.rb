# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaDreamSessionsInput < Anthropic::Internal::Type::BaseModel
        # @!attribute session_ids
        #   The IDs of the sessions whose transcripts the dream reads (`sesn_...`).
        #
        #   Give 1 to 100 IDs, with no duplicates. Each session must be in the same
        #   workspace as the dream. Responses list the IDs in sorted order.
        #
        #   The
        #   [limits table in the Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#limits)
        #   lists all the limits on a dream.
        #
        #   @return [Array<String>]
        required :session_ids, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute type
        #
        #   @return [Symbol, :sessions]
        required :type, const: :sessions

        # @!method initialize(session_ids:, type: :sessions)
        #   The sessions that a dream reads, given as an entry in `inputs`.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaDreamSessionsInput} for more details.
        #
        #   @param session_ids [Array<String>] The IDs of the sessions whose transcripts the dream reads (`sesn_...`).
        #
        #   @param type [Symbol, :sessions]
      end
    end

    BetaDreamSessionsInput = Beta::BetaDreamSessionsInput
  end
end
