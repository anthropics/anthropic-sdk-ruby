# typed: strong

module Anthropic
  module Models
    module MessageParam
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::UserMessageParam,
            Anthropic::AssistantMessageParam,
            Anthropic::SystemMessageParam
          )
        end

      module Role
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::MessageParam::Role) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        USER = T.let(:user, Anthropic::MessageParam::Role::TaggedSymbol)
        ASSISTANT =
          T.let(:assistant, Anthropic::MessageParam::Role::TaggedSymbol)
        SYSTEM = T.let(:system, Anthropic::MessageParam::Role::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Anthropic::MessageParam::Role::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      sig { override.returns(T::Array[Anthropic::MessageParam::Variants]) }
      def self.variants
      end

      # Creates a new instance of the variant class whose `role` matches the given
      # value, passing the remaining arguments to its constructor.
      sig do
        params(
          role: Anthropic::MessageParam::Role::OrSymbol,
          content:
            T.any(
              Anthropic::MessageContentParam::Variants,
              Anthropic::SystemMessageParam::Content::Variants
            )
        ).returns(Anthropic::MessageParam::Variants)
      end
      def self.new(role:, content:)
      end
    end
  end
end
