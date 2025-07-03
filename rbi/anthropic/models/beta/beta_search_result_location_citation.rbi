# typed: strong

module Anthropic
  module Models
    BetaSearchResultLocationCitation = Beta::BetaSearchResultLocationCitation

    module Beta
      class BetaSearchResultLocationCitation < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaSearchResultLocationCitation,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :cited_text

        sig { returns(Integer) }
        attr_accessor :end_block_index

        sig { returns(Integer) }
        attr_accessor :search_result_index

        sig { returns(String) }
        attr_accessor :source

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
          cited_text:,
          end_block_index:,
          search_result_index:,
          source:,
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
end
