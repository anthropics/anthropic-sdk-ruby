# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCompactionBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #   Summary of compacted content, or null if compaction failed
        #
        #   @return [String, nil]
        required :content, String, nil?: true

        # @!attribute encrypted_content
        #   Opaque metadata from prior compaction, to be round-tripped verbatim
        #
        #   @return [String, nil]
        required :encrypted_content, String, nil?: true

        # @!attribute type
        #
        #   @return [Symbol, :compaction]
        required :type, const: :compaction

        # @!method initialize(content:, encrypted_content:, type: :compaction)
        #   A compaction block returned when autocompact is triggered.
        #
        #   When content is None, it indicates the compaction failed to produce a valid
        #   summary (e.g., malformed output from the model). Clients may round-trip
        #   compaction blocks with null content; the server treats them as no-ops.
        #
        #   @param content [String, nil] Summary of compacted content, or null if compaction failed
        #
        #   @param encrypted_content [String, nil] Opaque metadata from prior compaction, to be round-tripped verbatim
        #
        #   @param type [Symbol, :compaction]
      end
    end

    BetaCompactionBlock = Beta::BetaCompactionBlock
  end
end
