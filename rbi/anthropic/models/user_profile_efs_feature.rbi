# typed: strong

module Anthropic
  module Models
    class UserProfileEfsFeature < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::UserProfileEfsFeature, Anthropic::Internal::AnyHash)
        end

      # `active` when Anthropic has approved the entity the profile represents to use
      # the feature, otherwise `inactive`. `active` does not mean that the feature is
      # set up or switched on, which is a separate step.
      sig { returns(Anthropic::UserProfileEfsFeature::Status::TaggedSymbol) }
      attr_accessor :status

      # One feature of Enterprise Frontier Safeguards.
      sig do
        params(
          status: Anthropic::UserProfileEfsFeature::Status::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # `active` when Anthropic has approved the entity the profile represents to use
        # the feature, otherwise `inactive`. `active` does not mean that the feature is
        # set up or switched on, which is a separate step.
        status:
      )
      end

      sig do
        override.returns(
          { status: Anthropic::UserProfileEfsFeature::Status::TaggedSymbol }
        )
      end
      def to_hash
      end

      # `active` when Anthropic has approved the entity the profile represents to use
      # the feature, otherwise `inactive`. `active` does not mean that the feature is
      # set up or switched on, which is a separate step.
      module Status
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::UserProfileEfsFeature::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(:active, Anthropic::UserProfileEfsFeature::Status::TaggedSymbol)
        INACTIVE =
          T.let(
            :inactive,
            Anthropic::UserProfileEfsFeature::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::UserProfileEfsFeature::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
