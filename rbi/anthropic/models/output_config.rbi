# typed: strong

module Anthropic
  module Models
    class OutputConfig < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::OutputConfig, Anthropic::Internal::AnyHash)
        end

      # All possible effort levels.
      sig { returns(T.nilable(Anthropic::OutputConfig::Effort::OrSymbol)) }
      attr_accessor :effort

      # A schema to specify Claude's output format in responses. See
      # [structured outputs](https://platform.claude.com/docs/en/build-with-claude/structured-outputs)
      sig { returns(T.nilable(Anthropic::JSONOutputFormat)) }
      attr_reader :format_

      sig do
        params(format_: T.nilable(Anthropic::JSONOutputFormat::OrHash)).void
      end
      attr_writer :format_

      sig do
        params(
          effort: T.nilable(Anthropic::OutputConfig::Effort::OrSymbol),
          format_: T.nilable(Anthropic::JSONOutputFormat::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # All possible effort levels.
        effort: nil,
        # A schema to specify Claude's output format in responses. See
        # [structured outputs](https://platform.claude.com/docs/en/build-with-claude/structured-outputs)
        format_: nil
      )
      end

      sig do
        override.returns(
          {
            effort: T.nilable(Anthropic::OutputConfig::Effort::OrSymbol),
            format_: T.nilable(Anthropic::JSONOutputFormat)
          }
        )
      end
      def to_hash
      end

      # All possible effort levels.
      module Effort
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::OutputConfig::Effort) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOW = T.let(:low, Anthropic::OutputConfig::Effort::TaggedSymbol)
        MEDIUM = T.let(:medium, Anthropic::OutputConfig::Effort::TaggedSymbol)
        HIGH = T.let(:high, Anthropic::OutputConfig::Effort::TaggedSymbol)
        MAX = T.let(:max, Anthropic::OutputConfig::Effort::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Anthropic::OutputConfig::Effort::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
