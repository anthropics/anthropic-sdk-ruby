# typed: strong

module Anthropic
  module Models
    class UserProfileCyberRequirements < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::UserProfileCyberRequirements,
            Anthropic::Internal::AnyHash
          )
        end

      # Whether Anthropic must be able to retain the request's inference data.
      sig { returns(T::Boolean) }
      attr_accessor :data_retention

      # Whether Anthropic personnel must be allowed to review the data retained from the
      # request.
      sig { returns(T::Boolean) }
      attr_accessor :human_review

      # What a request that names the profile must allow to get the relaxed safeguards
      # of the profile's `active` tiers. A field reads `true` when at least one of those
      # tiers has the requirement and Anthropic has not waived it on that tier for the
      # profile. A request that does not meet a requirement is still served, without the
      # relaxed safeguards of the tiers that have it. The values differ between profiles
      # and can change, so read them rather than assuming them.
      sig do
        params(data_retention: T::Boolean, human_review: T::Boolean).returns(
          T.attached_class
        )
      end
      def self.new(
        # Whether Anthropic must be able to retain the request's inference data.
        data_retention:,
        # Whether Anthropic personnel must be allowed to review the data retained from the
        # request.
        human_review:
      )
      end

      sig do
        override.returns(
          { data_retention: T::Boolean, human_review: T::Boolean }
        )
      end
      def to_hash
      end
    end
  end
end
