# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsUserLocation < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #   Location precision. Only "approximate" is supported.
        #
        #   @return [Symbol, :approximate]
        required :type, const: :approximate

        # @!attribute city
        #   City name.
        #
        #   @return [String, nil]
        optional :city, String, nil?: true

        # @!attribute country
        #   Two-letter ISO 3166-1 country code, uppercase.
        #
        #   @return [String, nil]
        optional :country, String, nil?: true

        # @!attribute region
        #   Region or state name.
        #
        #   @return [String, nil]
        optional :region, String, nil?: true

        # @!attribute timezone
        #   IANA timezone identifier, e.g. "America/Los_Angeles".
        #
        #   @return [String, nil]
        optional :timezone, String, nil?: true

        # @!method initialize(city: nil, country: nil, region: nil, timezone: nil, type: :approximate)
        #   Approximate user location for search result localization.
        #
        #   @param city [String, nil] City name.
        #
        #   @param country [String, nil] Two-letter ISO 3166-1 country code, uppercase.
        #
        #   @param region [String, nil] Region or state name.
        #
        #   @param timezone [String, nil] IANA timezone identifier, e.g. "America/Los_Angeles".
        #
        #   @param type [Symbol, :approximate] Location precision. Only "approximate" is supported.
      end
    end

    BetaManagedAgentsUserLocation = Beta::BetaManagedAgentsUserLocation
  end
end
