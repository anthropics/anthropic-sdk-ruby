# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsWebFetchURLSourceShorthand =
      Beta::BetaManagedAgentsWebFetchURLSourceShorthand

    module Beta
      # String form of a url_sources value that has no field other than its type: "all"
      # means {"type": "all"} and "none" means {"type": "none"}.
      module BetaManagedAgentsWebFetchURLSourceShorthand
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceShorthand
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ALL =
          T.let(
            :all,
            Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceShorthand::TaggedSymbol
          )
        NONE =
          T.let(
            :none,
            Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceShorthand::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceShorthand::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
