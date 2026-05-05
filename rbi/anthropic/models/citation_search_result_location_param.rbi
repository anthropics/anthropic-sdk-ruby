# typed: strong

module Anthropic
  module Models
    class CitationSearchResultLocationParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::CitationSearchResultLocationParam,
            Anthropic::Internal::AnyHash
          )
        end

      # The full text of the cited block range, concatenated.
      #
      # Always equals the contents of `content[start_block_index:end_block_index]`
      # joined together. The text block is the minimal citable unit; this field is never
      # a substring of a single block. Not counted toward output tokens, and not counted
      # toward input tokens when sent back in subsequent turns.
      sig { returns(String) }
      attr_accessor :cited_text

      # Exclusive 0-based end index of the cited block range in the source's `content`
      # array.
      #
      # Always greater than `start_block_index`; a single-block citation has
      # `end_block_index = start_block_index + 1`.
      sig { returns(Integer) }
      attr_accessor :end_block_index

      # 0-based index of the cited search result among all `search_result` content
      # blocks in the request, in the order they appear across messages and tool
      # results.
      #
      # Counted separately from `document_index`; server-side web search results are not
      # included in this count.
      sig { returns(Integer) }
      attr_accessor :search_result_index

      sig { returns(String) }
      attr_accessor :source

      # 0-based index of the first cited block in the source's `content` array.
      sig { returns(Integer) }
      attr_accessor :start_block_index

      sig { returns(T.nilable(String)) }
      attr_accessor :title

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          cited_text: String,
          end_block_index: Integer,
          search_result_index: Integer,
          source: String,
          start_block_index: Integer,
          title: T.nilable(String),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The full text of the cited block range, concatenated.
        #
        # Always equals the contents of `content[start_block_index:end_block_index]`
        # joined together. The text block is the minimal citable unit; this field is never
        # a substring of a single block. Not counted toward output tokens, and not counted
        # toward input tokens when sent back in subsequent turns.
        cited_text:,
        # Exclusive 0-based end index of the cited block range in the source's `content`
        # array.
        #
        # Always greater than `start_block_index`; a single-block citation has
        # `end_block_index = start_block_index + 1`.
        end_block_index:,
        # 0-based index of the cited search result among all `search_result` content
        # blocks in the request, in the order they appear across messages and tool
        # results.
        #
        # Counted separately from `document_index`; server-side web search results are not
        # included in this count.
        search_result_index:,
        source:,
        # 0-based index of the first cited block in the source's `content` array.
        start_block_index:,
        title:,
        type: :search_result_location
      )
      end

      sig do
        override.returns(
          {
            cited_text: String,
            end_block_index: Integer,
            search_result_index: Integer,
            source: String,
            start_block_index: Integer,
            title: T.nilable(String),
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
