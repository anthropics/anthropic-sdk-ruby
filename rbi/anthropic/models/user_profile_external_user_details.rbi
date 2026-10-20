# typed: strong

module Anthropic
  module Models
    class UserProfileExternalUserDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::UserProfileExternalUserDetails,
            Anthropic::Internal::AnyHash
          )
        end

      # The status of the entity's account on the platform: `active`, `suspended` or
      # `blocked`. `null` until the platform supplies one.
      sig do
        returns(
          T.nilable(
            Anthropic::UserProfileExternalUserAccountStatus::TaggedSymbol
          )
        )
      end
      attr_accessor :account_status

      # The country the platform associates with the entity, as an ISO 3166-1 alpha-2
      # code. `null` until the platform supplies one.
      sig { returns(T.nilable(String)) }
      attr_accessor :country

      # The platform-computed hash of the entity's email address. `null` until the
      # platform supplies one.
      sig { returns(T.nilable(String)) }
      attr_accessor :email_hash

      # What kind of entity the profile represents: `individual`, `business`,
      # `non_profit` or `government`. `null` until the platform supplies one.
      sig do
        returns(
          T.nilable(Anthropic::UserProfileExternalUserEntityType::TaggedSymbol)
        )
      end
      attr_accessor :entity_type

      # The platform-computed hash of the entity's name. `null` until the platform
      # supplies one.
      sig { returns(T.nilable(String)) }
      attr_accessor :name_hash

      # When the entity opened its account with the platform, as stated by the platform,
      # in RFC 3339 format (UTC). `null` until the platform supplies one.
      sig { returns(T.nilable(Time)) }
      attr_accessor :onboarded_at

      # The platform's own reference for the entity. `null` until the platform supplies
      # one.
      sig { returns(T.nilable(String)) }
      attr_accessor :reference_id

      # Details about the entity this profile represents, as the platform states them.
      # Anthropic does not verify them. Every field is present, `null` until the
      # platform supplies a value.
      sig do
        params(
          account_status:
            T.nilable(
              Anthropic::UserProfileExternalUserAccountStatus::OrSymbol
            ),
          country: T.nilable(String),
          email_hash: T.nilable(String),
          entity_type:
            T.nilable(Anthropic::UserProfileExternalUserEntityType::OrSymbol),
          name_hash: T.nilable(String),
          onboarded_at: T.nilable(Time),
          reference_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The status of the entity's account on the platform: `active`, `suspended` or
        # `blocked`. `null` until the platform supplies one.
        account_status:,
        # The country the platform associates with the entity, as an ISO 3166-1 alpha-2
        # code. `null` until the platform supplies one.
        country:,
        # The platform-computed hash of the entity's email address. `null` until the
        # platform supplies one.
        email_hash:,
        # What kind of entity the profile represents: `individual`, `business`,
        # `non_profit` or `government`. `null` until the platform supplies one.
        entity_type:,
        # The platform-computed hash of the entity's name. `null` until the platform
        # supplies one.
        name_hash:,
        # When the entity opened its account with the platform, as stated by the platform,
        # in RFC 3339 format (UTC). `null` until the platform supplies one.
        onboarded_at:,
        # The platform's own reference for the entity. `null` until the platform supplies
        # one.
        reference_id:
      )
      end

      sig do
        override.returns(
          {
            account_status:
              T.nilable(
                Anthropic::UserProfileExternalUserAccountStatus::TaggedSymbol
              ),
            country: T.nilable(String),
            email_hash: T.nilable(String),
            entity_type:
              T.nilable(
                Anthropic::UserProfileExternalUserEntityType::TaggedSymbol
              ),
            name_hash: T.nilable(String),
            onboarded_at: T.nilable(Time),
            reference_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
