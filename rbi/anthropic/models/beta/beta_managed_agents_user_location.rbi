# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsUserLocation = Beta::BetaManagedAgentsUserLocation

    module Beta
      class BetaManagedAgentsUserLocation < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsUserLocation,
              Anthropic::Internal::AnyHash
            )
          end

        # Location precision. Only "approximate" is supported.
        sig { returns(Symbol) }
        attr_accessor :type

        # City name.
        sig { returns(T.nilable(String)) }
        attr_accessor :city

        # Two-letter ISO 3166-1 country code, uppercase.
        sig { returns(T.nilable(String)) }
        attr_accessor :country

        # Region or state name.
        sig { returns(T.nilable(String)) }
        attr_accessor :region

        # IANA timezone identifier, e.g. "America/Los_Angeles".
        sig { returns(T.nilable(String)) }
        attr_accessor :timezone

        # Approximate user location for search result localization.
        sig do
          params(
            city: T.nilable(String),
            country: T.nilable(String),
            region: T.nilable(String),
            timezone: T.nilable(String),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # City name.
          city: nil,
          # Two-letter ISO 3166-1 country code, uppercase.
          country: nil,
          # Region or state name.
          region: nil,
          # IANA timezone identifier, e.g. "America/Los_Angeles".
          timezone: nil,
          # Location precision. Only "approximate" is supported.
          type: :approximate
        )
        end

        sig do
          override.returns(
            {
              type: Symbol,
              city: T.nilable(String),
              country: T.nilable(String),
              region: T.nilable(String),
              timezone: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
