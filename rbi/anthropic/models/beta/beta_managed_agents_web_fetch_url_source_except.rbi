# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsWebFetchURLSourceExcept =
      Beta::BetaManagedAgentsWebFetchURLSourceExcept

    module Beta
      class BetaManagedAgentsWebFetchURLSourceExcept < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceExcept,
              Anthropic::Internal::AnyHash
            )
          end

        # The tools whose results do not contribute. Between 1 and 128 entries, each with
        # a different name. An empty list is rejected; use "all" to leave out no tool's
        # results.
        sig do
          returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolReference
            ]
          )
        end
        attr_accessor :tools

        sig { returns(Symbol) }
        attr_accessor :type

        # Every tool's results contribute URLs that may be fetched, except the named
        # tools' results.
        sig do
          params(
            tools:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolReference::OrHash
              ],
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The tools whose results do not contribute. Between 1 and 128 entries, each with
          # a different name. An empty list is rejected; use "all" to leave out no tool's
          # results.
          tools:,
          type: :except
        )
        end

        sig do
          override.returns(
            {
              tools:
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolReference
                ],
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
