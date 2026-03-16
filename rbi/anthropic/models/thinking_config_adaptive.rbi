# typed: strong

module Anthropic
  module Models
    class ThinkingConfigAdaptive < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ThinkingConfigAdaptive, Anthropic::Internal::AnyHash)
        end

      sig { returns(Symbol) }
      attr_accessor :type

      # Controls how thinking content appears in the response. When set to `summarized`,
      # thinking is returned normally. When set to `omitted`, thinking content is
      # redacted but a signature is returned for multi-turn continuity. Defaults to
      # `summarized`.
      sig do
        returns(T.nilable(Anthropic::ThinkingConfigAdaptive::Display::OrSymbol))
      end
      attr_accessor :display_

      sig do
        params(
          display_:
            T.nilable(Anthropic::ThinkingConfigAdaptive::Display::OrSymbol),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Controls how thinking content appears in the response. When set to `summarized`,
        # thinking is returned normally. When set to `omitted`, thinking content is
        # redacted but a signature is returned for multi-turn continuity. Defaults to
        # `summarized`.
        display_: nil,
        type: :adaptive
      )
      end

      sig do
        override.returns(
          {
            type: Symbol,
            display_:
              T.nilable(Anthropic::ThinkingConfigAdaptive::Display::OrSymbol)
          }
        )
      end
      def to_hash
      end

      # Controls how thinking content appears in the response. When set to `summarized`,
      # thinking is returned normally. When set to `omitted`, thinking content is
      # redacted but a signature is returned for multi-turn continuity. Defaults to
      # `summarized`.
      module Display
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::ThinkingConfigAdaptive::Display)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SUMMARIZED =
          T.let(
            :summarized,
            Anthropic::ThinkingConfigAdaptive::Display::TaggedSymbol
          )
        OMITTED =
          T.let(
            :omitted,
            Anthropic::ThinkingConfigAdaptive::Display::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::ThinkingConfigAdaptive::Display::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
