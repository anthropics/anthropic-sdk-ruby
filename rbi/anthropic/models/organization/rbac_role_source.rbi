# typed: strong

module Anthropic
  module Models
    module Organization
      module RBACRoleSource
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Organization::RBACRoleSourceBuiltIn,
              Anthropic::Organization::RBACRoleSourceCustom
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Organization::RBACRoleSource::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BUILT_IN =
            T.let(
              :built_in,
              Anthropic::Organization::RBACRoleSource::Type::TaggedSymbol
            )
          CUSTOM =
            T.let(
              :custom,
              Anthropic::Organization::RBACRoleSource::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Organization::RBACRoleSource::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::Organization::RBACRoleSource::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: Anthropic::Organization::RBACRoleSource::Type::OrSymbol
          ).returns(Anthropic::Organization::RBACRoleSource::Variants)
        end
        def self.new(type:)
        end
      end
    end
  end
end
