# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsWebFetchURLSourceUserInput =
      Beta::BetaManagedAgentsWebFetchURLSourceUserInput

    module Beta
      # Whether URLs in the text of user messages may be fetched.
      module BetaManagedAgentsWebFetchURLSourceUserInput
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceAll,
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceNone
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceUserInput::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ALL =
            T.let(
              :all,
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceUserInput::Type::TaggedSymbol
            )
          NONE =
            T.let(
              :none,
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceUserInput::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceUserInput::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceUserInput::Variants
            ]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceUserInput::Type::OrSymbol
          ).returns(
            Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceUserInput::Variants
          )
        end
        def self.new(type:)
        end
      end
    end
  end
end
