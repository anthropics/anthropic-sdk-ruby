# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCompactionBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #   Summary of previously compacted content, or null if compaction failed
        #
        #   @return [String, nil]
        required :content, String, nil?: true

        # @!attribute type
        #
        #   @return [Symbol, :compaction]
        required :type, const: :compaction

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(content:, cache_control: nil, type: :compaction)
        #   A compaction block containing summary of previous context.
        #
        #   Users should round-trip these blocks from responses to subsequent requests to
        #   maintain context across compaction boundaries.
        #
        #   When content is None, the block represents a failed compaction. The server
        #   treats these as no-ops. Empty string content is not allowed.
        #
        #   @param content [String, nil] Summary of previously compacted content, or null if compaction failed
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param type [Symbol, :compaction]
      end
    end

    BetaCompactionBlockParam = Beta::BetaCompactionBlockParam
  end
end
