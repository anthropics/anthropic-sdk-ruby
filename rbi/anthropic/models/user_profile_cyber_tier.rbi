# typed: strong

module Anthropic
  module Models
    class UserProfileCyberTier < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::UserProfileCyberTier, Anthropic::Internal::AnyHash)
        end

      # `active` when the tier applies to the profile, otherwise `inactive`. The
      # response does not say why a tier is `inactive`: it can be in review, declined,
      # withdrawn, never applied for, or approved but not applied to this profile.
      sig { returns(Anthropic::UserProfileCyberTier::Status::TaggedSymbol) }
      attr_accessor :status

      # One tier of the Cyber Verification Program.
      sig do
        params(
          status: Anthropic::UserProfileCyberTier::Status::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # `active` when the tier applies to the profile, otherwise `inactive`. The
        # response does not say why a tier is `inactive`: it can be in review, declined,
        # withdrawn, never applied for, or approved but not applied to this profile.
        status:
      )
      end

      sig do
        override.returns(
          { status: Anthropic::UserProfileCyberTier::Status::TaggedSymbol }
        )
      end
      def to_hash
      end

      # `active` when the tier applies to the profile, otherwise `inactive`. The
      # response does not say why a tier is `inactive`: it can be in review, declined,
      # withdrawn, never applied for, or approved but not applied to this profile.
      module Status
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::UserProfileCyberTier::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(:active, Anthropic::UserProfileCyberTier::Status::TaggedSymbol)
        INACTIVE =
          T.let(
            :inactive,
            Anthropic::UserProfileCyberTier::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::UserProfileCyberTier::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
