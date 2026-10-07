# typed: strong

module Anthropic
  module Models
    BetaToolUseCaller = Beta::BetaToolUseCaller

    module Beta
      # Which party invoked the tool call: the model directly, or a server tool on its
      # behalf.
      module BetaToolUseCaller
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaDirectCaller,
              Anthropic::Beta::BetaServerToolCaller,
              Anthropic::Beta::BetaServerToolCaller20260120
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaToolUseCaller::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DIRECT =
            T.let(
              :direct,
              Anthropic::Beta::BetaToolUseCaller::Type::TaggedSymbol
            )
          CODE_EXECUTION_20250825 =
            T.let(
              :code_execution_20250825,
              Anthropic::Beta::BetaToolUseCaller::Type::TaggedSymbol
            )
          CODE_EXECUTION_20260120 =
            T.let(
              :code_execution_20260120,
              Anthropic::Beta::BetaToolUseCaller::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaToolUseCaller::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaToolUseCaller::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: Anthropic::Beta::BetaToolUseCaller::Type::OrSymbol,
            tool_id: String
          ).returns(Anthropic::Beta::BetaToolUseCaller::Variants)
        end
        def self.new(type:, tool_id: nil)
        end
      end
    end
  end
end
