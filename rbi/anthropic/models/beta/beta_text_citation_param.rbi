# typed: strong

module Anthropic
  module Models
    BetaTextCitationParam = Beta::BetaTextCitationParam

    module Beta
      module BetaTextCitationParam
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCitationCharLocationParam,
              Anthropic::Beta::BetaCitationPageLocationParam,
              Anthropic::Beta::BetaCitationContentBlockLocationParam,
              Anthropic::Beta::BetaCitationWebSearchResultLocationParam,
              Anthropic::Beta::BetaCitationSearchResultLocationParam
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaTextCitationParam::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CHAR_LOCATION =
            T.let(
              :char_location,
              Anthropic::Beta::BetaTextCitationParam::Type::TaggedSymbol
            )
          PAGE_LOCATION =
            T.let(
              :page_location,
              Anthropic::Beta::BetaTextCitationParam::Type::TaggedSymbol
            )
          CONTENT_BLOCK_LOCATION =
            T.let(
              :content_block_location,
              Anthropic::Beta::BetaTextCitationParam::Type::TaggedSymbol
            )
          WEB_SEARCH_RESULT_LOCATION =
            T.let(
              :web_search_result_location,
              Anthropic::Beta::BetaTextCitationParam::Type::TaggedSymbol
            )
          SEARCH_RESULT_LOCATION =
            T.let(
              :search_result_location,
              Anthropic::Beta::BetaTextCitationParam::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaTextCitationParam::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaTextCitationParam::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: T.any(Symbol, String),
            cited_text: String,
            document_index: Integer,
            document_title: T.nilable(String),
            end_char_index: Integer,
            start_char_index: Integer,
            end_page_number: Integer,
            start_page_number: Integer,
            end_block_index: Integer,
            start_block_index: Integer,
            encrypted_index: String,
            title: T.nilable(String),
            url: String,
            search_result_index: Integer,
            source: String
          ).returns(Anthropic::Beta::BetaTextCitationParam::Variants)
        end
        def self.new(
          type:,
          # The full text of the cited block range, concatenated.
          #
          # Always equals the contents of `content[start_block_index:end_block_index]`
          # joined together. The text block is the minimal citable unit; this field is never
          # a substring of a single block. Not counted toward output tokens, and not counted
          # toward input tokens when sent back in subsequent turns.
          cited_text:,
          document_index: nil,
          document_title: nil,
          end_char_index: nil,
          start_char_index: nil,
          end_page_number: nil,
          start_page_number: nil,
          # Exclusive 0-based end index of the cited block range in the source's `content`
          # array.
          #
          # Always greater than `start_block_index`; a single-block citation has
          # `end_block_index = start_block_index + 1`.
          end_block_index: nil,
          # 0-based index of the first cited block in the source's `content` array.
          start_block_index: nil,
          encrypted_index: nil,
          title: nil,
          url: nil,
          # 0-based index of the cited search result among all `search_result` content
          # blocks in the request, in the order they appear across messages and tool
          # results.
          #
          # Counted separately from `document_index`; server-side web search results are not
          # included in this count.
          search_result_index: nil,
          source: nil
        )
        end
      end
    end
  end
end
