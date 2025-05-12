# typed: strong

module Anthropic
  module Models
    class CitationCharLocation < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::CitationCharLocation, Anthropic::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :cited_text

      sig { returns(Integer) }
      attr_accessor :document_index

      sig { returns(T.nilable(String)) }
      attr_accessor :document_title

      sig { returns(Integer) }
      attr_accessor :end_char_index

      sig { returns(Integer) }
      attr_accessor :start_char_index

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          cited_text: String,
          document_index: Integer,
          document_title: T.nilable(String),
          end_char_index: Integer,
          start_char_index: Integer,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        cited_text:,
        document_index:,
        document_title:,
        end_char_index:,
        start_char_index:,
        type: :char_location
      )
      end

      sig do
        override.returns(
          {
            cited_text: String,
            document_index: Integer,
            document_title: T.nilable(String),
            end_char_index: Integer,
            start_char_index: Integer,
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
