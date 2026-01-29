# typed: strong

module Anthropic
  module Models
    class OutputConfig < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::OutputConfig, Anthropic::Internal::AnyHash)
        end

      # A schema to specify Claude's output format in responses. See
      # [structured outputs](https://platform.claude.com/docs/en/build-with-claude/structured-outputs)
      sig { returns(T.nilable(Anthropic::JSONOutputFormat)) }
      attr_reader :format_

      sig do
        params(format_: T.nilable(Anthropic::JSONOutputFormat::OrHash)).void
      end
      attr_writer :format_

      sig do
        params(format_: T.nilable(Anthropic::JSONOutputFormat::OrHash)).returns(
          T.attached_class
        )
      end
      def self.new(
        # A schema to specify Claude's output format in responses. See
        # [structured outputs](https://platform.claude.com/docs/en/build-with-claude/structured-outputs)
        format_: nil
      )
      end

      sig do
        override.returns({ format_: T.nilable(Anthropic::JSONOutputFormat) })
      end
      def to_hash
      end
    end
  end
end
