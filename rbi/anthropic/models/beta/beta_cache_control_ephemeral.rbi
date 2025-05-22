# typed: strong

module Anthropic
  module Models
    BetaCacheControlEphemeral = Beta::BetaCacheControlEphemeral

    module Beta
      class BetaCacheControlEphemeral < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCacheControlEphemeral,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The time-to-live for the cache control breakpoint.
        #
        # This may be one the following values:
        #
        # - `5m`: 5 minutes
        # - `1h`: 1 hour
        #
        # Defaults to `5m`.
        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::TTL::OrSymbol)
          )
        end
        attr_reader :ttl

        sig do
          params(
            ttl: Anthropic::Beta::BetaCacheControlEphemeral::TTL::OrSymbol
          ).void
        end
        attr_writer :ttl

        sig do
          params(
            ttl: Anthropic::Beta::BetaCacheControlEphemeral::TTL::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The time-to-live for the cache control breakpoint.
          #
          # This may be one the following values:
          #
          # - `5m`: 5 minutes
          # - `1h`: 1 hour
          #
          # Defaults to `5m`.
          ttl: nil,
          type: :ephemeral
        )
        end

        sig do
          override.returns(
            {
              type: Symbol,
              ttl: Anthropic::Beta::BetaCacheControlEphemeral::TTL::OrSymbol
            }
          )
        end
        def to_hash
        end

        # The time-to-live for the cache control breakpoint.
        #
        # This may be one the following values:
        #
        # - `5m`: 5 minutes
        # - `1h`: 1 hour
        #
        # Defaults to `5m`.
        module TTL
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaCacheControlEphemeral::TTL)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TTL_5M =
            T.let(
              :"5m",
              Anthropic::Beta::BetaCacheControlEphemeral::TTL::TaggedSymbol
            )
          TTL_1H =
            T.let(
              :"1h",
              Anthropic::Beta::BetaCacheControlEphemeral::TTL::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaCacheControlEphemeral::TTL::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
