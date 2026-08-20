# frozen_string_literal: true

module Anthropic
  module Models
    module TextCitation
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :char_location, -> { Anthropic::CitationCharLocation }

      variant :page_location, -> { Anthropic::CitationPageLocation }

      variant :content_block_location, -> { Anthropic::CitationContentBlockLocation }

      variant :web_search_result_location, -> { Anthropic::CitationsWebSearchResultLocation }

      variant :search_result_location, -> { Anthropic::CitationsSearchResultLocation }

      module Type
        extend Anthropic::Internal::Type::Enum

        CHAR_LOCATION = :char_location
        PAGE_LOCATION = :page_location
        CONTENT_BLOCK_LOCATION = :content_block_location
        WEB_SEARCH_RESULT_LOCATION = :web_search_result_location
        SEARCH_RESULT_LOCATION = :search_result_location

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @!method self.variants
      #   @return [Array(Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation, Anthropic::Models::CitationsWebSearchResultLocation, Anthropic::Models::CitationsSearchResultLocation)]

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::TextCitation} for more details.
      #
      # @param type [Symbol, String]
      #
      # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
      #
      #   @option args [String] :cited_text The full text of the cited block range, concatenated.
      #
      #   @option args [Integer] :document_index
      #
      #   @option args [String, nil] :document_title
      #
      #   @option args [Integer] :end_char_index
      #
      #   @option args [String, nil] :file_id
      #
      #   @option args [Integer] :start_char_index
      #
      #   @option args [Integer] :end_page_number
      #
      #   @option args [Integer] :start_page_number
      #
      #   @option args [Integer] :end_block_index Exclusive 0-based end index of the cited block range in the source's `content` a
      #
      #   @option args [Integer] :start_block_index 0-based index of the first cited block in the source's `content` array.
      #
      #   @option args [String] :encrypted_index
      #
      #   @option args [String, nil] :title
      #
      #   @option args [String] :url
      #
      #   @option args [Integer] :search_result_index 0-based index of the cited search result among all `search_result` content block
      #
      #   @option args [String] :source
      #
      # @raise [ArgumentError]
      # @return [Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation, Anthropic::Models::CitationsWebSearchResultLocation, Anthropic::Models::CitationsSearchResultLocation]
      def self.new(type:, **args)
        case type.to_sym
        when :char_location
          Anthropic::CitationCharLocation.new(**args)
        when :page_location
          Anthropic::CitationPageLocation.new(**args)
        when :content_block_location
          Anthropic::CitationContentBlockLocation.new(**args)
        when :web_search_result_location
          Anthropic::CitationsWebSearchResultLocation.new(**args)
        when :search_result_location
          Anthropic::CitationsSearchResultLocation.new(**args)
        else
          raise ArgumentError, "unknown type: #{type}"
        end
      end
    end
  end
end
