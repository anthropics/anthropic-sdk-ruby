# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsWebFetchURLSourceOnly =
      Beta::BetaManagedAgentsWebFetchURLSourceOnly

    module Beta
      class BetaManagedAgentsWebFetchURLSourceOnly < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceOnly,
              Anthropic::Internal::AnyHash
            )
          end

        # The tools whose results contribute. Between 1 and 128 entries, each with a
        # different name. An empty list is rejected; use "none" to allow no tool's
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

        # Only the named tools' results contribute URLs that may be fetched.
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
          # The tools whose results contribute. Between 1 and 128 entries, each with a
          # different name. An empty list is rejected; use "none" to allow no tool's
          # results.
          tools:,
          type: :only
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
