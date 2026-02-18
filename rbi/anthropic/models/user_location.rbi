# typed: strong

module Anthropic
  module Models
    class UserLocation < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::UserLocation, Anthropic::Internal::AnyHash)
        end

      sig { returns(Symbol) }
      attr_accessor :type

      # The city of the user.
      sig { returns(T.nilable(String)) }
      attr_accessor :city

      # The two letter
      # [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the
      # user.
      sig { returns(T.nilable(String)) }
      attr_accessor :country

      # The region of the user.
      sig { returns(T.nilable(String)) }
      attr_accessor :region

      # The [IANA timezone](https://nodatime.org/TimeZones) of the user.
      sig { returns(T.nilable(String)) }
      attr_accessor :timezone

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
        # The city of the user.
        city: nil,
        # The two letter
        # [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the
        # user.
        country: nil,
        # The region of the user.
        region: nil,
        # The [IANA timezone](https://nodatime.org/TimeZones) of the user.
        timezone: nil,
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
