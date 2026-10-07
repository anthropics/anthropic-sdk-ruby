# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsWebFetchURLSourceToolFilter =
      Beta::BetaManagedAgentsWebFetchURLSourceToolFilter

    module Beta
      # Which tools' results contribute URLs that may be fetched.
      module BetaManagedAgentsWebFetchURLSourceToolFilter
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceAll,
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceNone,
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceOnly,
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceExcept
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilter::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ALL =
            T.let(
              :all,
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilter::Type::TaggedSymbol
            )
          NONE =
            T.let(
              :none,
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilter::Type::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilter::Type::TaggedSymbol
            )
          EXCEPT =
            T.let(
              :except,
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilter::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilter::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilter::Variants
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
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilter::Type::OrSymbol,
            tools:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolReference::OrHash
              ]
          ).returns(
            Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilter::Variants
          )
        end
        def self.new(
          type:,
          # The tools whose results contribute. Between 1 and 128 entries, each with a
          # different name. An empty list is rejected; use "none" to allow no tool's
          # results.
          tools: nil
        )
        end
      end
    end
  end
end
