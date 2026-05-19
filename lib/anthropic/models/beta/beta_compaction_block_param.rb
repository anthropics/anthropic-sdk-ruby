# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCompactionBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :compaction]
        required :type, const: :compaction

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute content
        #   Summary of previously compacted content, or null if compaction failed
        #
        #   @return [String, nil]
        optional :content, String, nil?: true

        # @!attribute encrypted_content
        #   Opaque metadata from prior compaction, to be round-tripped verbatim
        #
        #   @return [String, nil]
        optional :encrypted_content, String, nil?: true

        # @!method initialize(cache_control: nil, content: nil, encrypted_content: nil, type: :compaction)
        #   A compaction block containing summary of previous context.
        #
        #   Users should round-trip these blocks from responses to subsequent requests to
        #   maintain context across compaction boundaries.
        #
        #   When content is None, the block represents a failed compaction. The server
        #   treats these as no-ops. Empty string content is not allowed.
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param content [String, nil] Summary of previously compacted content, or null if compaction failed
        #
        #   @param encrypted_content [String, nil] Opaque metadata from prior compaction, to be round-tripped verbatim
        #
        #   @param type [Symbol, :compaction]
      end
    end

    BetaCompactionBlockParam = Beta::BetaCompactionBlockParam
  end
end
