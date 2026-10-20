# typed: strong

module Anthropic
  module Models
    class UserProfileEfsProgram < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::UserProfileEfsProgram, Anthropic::Internal::AnyHash)
        end

      # The program's features, keyed by feature: `data_retention_exemption` (use of
      # models that normally require data retention, without the data being retained),
      # `cmek` (customer-managed encryption keys) and `storage` (customer-owned
      # storage). Every feature that the caller's organization may read has a key,
      # whether or not it is approved; a missing key does not mean that the feature is
      # inactive. Anthropic may add features; ignore a key you do not recognize.
      sig { returns(T::Hash[Symbol, Anthropic::UserProfileEfsFeature]) }
      attr_accessor :features

      # Anthropic's decision on the entity the profile represents: `pending` while it is
      # awaited, `active` once Anthropic has approved the entity for the program, or
      # `rejected` once Anthropic has declined or has removed the entity from the
      # program. `active` does not mean that any one feature is approved: read the
      # feature you need in `features`.
      sig { returns(Anthropic::UserProfileProgramStatus::TaggedSymbol) }
      attr_accessor :status

      # A user profile's standing in Enterprise Frontier Safeguards, a program under
      # which Anthropic approves the entity the profile represents and may approve any
      # of the program's features.
      sig do
        params(
          features: T::Hash[Symbol, Anthropic::UserProfileEfsFeature::OrHash],
          status: Anthropic::UserProfileProgramStatus::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The program's features, keyed by feature: `data_retention_exemption` (use of
        # models that normally require data retention, without the data being retained),
        # `cmek` (customer-managed encryption keys) and `storage` (customer-owned
        # storage). Every feature that the caller's organization may read has a key,
        # whether or not it is approved; a missing key does not mean that the feature is
        # inactive. Anthropic may add features; ignore a key you do not recognize.
        features:,
        # Anthropic's decision on the entity the profile represents: `pending` while it is
        # awaited, `active` once Anthropic has approved the entity for the program, or
        # `rejected` once Anthropic has declined or has removed the entity from the
        # program. `active` does not mean that any one feature is approved: read the
        # feature you need in `features`.
        status:
      )
      end

      sig do
        override.returns(
          {
            features: T::Hash[Symbol, Anthropic::UserProfileEfsFeature],
            status: Anthropic::UserProfileProgramStatus::TaggedSymbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
