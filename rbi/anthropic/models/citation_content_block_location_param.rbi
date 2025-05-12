# typed: strong

module Anthropic
  module Models
    class CitationContentBlockLocationParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::CitationContentBlockLocationParam,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :cited_text

      sig { returns(Integer) }
      attr_accessor :document_index

      sig { returns(T.nilable(String)) }
      attr_accessor :document_title

      sig { returns(Integer) }
      attr_accessor :end_block_index

      sig { returns(Integer) }
      attr_accessor :start_block_index

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          cited_text: String,
          document_index: Integer,
          document_title: T.nilable(String),
          end_block_index: Integer,
          start_block_index: Integer,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        cited_text:,
        document_index:,
        document_title:,
        end_block_index:,
        start_block_index:,
        type: :content_block_location
      )
      end

      sig do
        override.returns(
          {
            cited_text: String,
            document_index: Integer,
            document_title: T.nilable(String),
            end_block_index: Integer,
            start_block_index: Integer,
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
