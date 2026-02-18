# frozen_string_literal: true

module Anthropic
  module Models
    class UserLocation < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :approximate]
      required :type, const: :approximate

      # @!attribute city
      #   The city of the user.
      #
      #   @return [String, nil]
      optional :city, String, nil?: true

      # @!attribute country
      #   The two letter
      #   [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the
      #   user.
      #
      #   @return [String, nil]
      optional :country, String, nil?: true

      # @!attribute region
      #   The region of the user.
      #
      #   @return [String, nil]
      optional :region, String, nil?: true

      # @!attribute timezone
      #   The [IANA timezone](https://nodatime.org/TimeZones) of the user.
      #
      #   @return [String, nil]
      optional :timezone, String, nil?: true

      # @!method initialize(city: nil, country: nil, region: nil, timezone: nil, type: :approximate)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::UserLocation} for more details.
      #
      #   @param city [String, nil] The city of the user.
      #
      #   @param country [String, nil] The two letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha
      #
      #   @param region [String, nil] The region of the user.
      #
      #   @param timezone [String, nil] The [IANA timezone](https://nodatime.org/TimeZones) of the user.
      #
      #   @param type [Symbol, :approximate]
    end
  end
end
