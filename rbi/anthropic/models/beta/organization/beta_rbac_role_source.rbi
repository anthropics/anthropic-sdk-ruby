# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaRBACRoleSource
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaRBACRoleSourceBuiltIn,
                Anthropic::Beta::Organization::BetaRBACRoleSourceCustom
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaRBACRoleSource::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            BUILT_IN =
              T.let(
                :built_in,
                Anthropic::Beta::Organization::BetaRBACRoleSource::Type::TaggedSymbol
              )
            CUSTOM =
              T.let(
                :custom,
                Anthropic::Beta::Organization::BetaRBACRoleSource::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaRBACRoleSource::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaRBACRoleSource::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type:
                Anthropic::Beta::Organization::BetaRBACRoleSource::Type::OrSymbol
            ).returns(
              Anthropic::Beta::Organization::BetaRBACRoleSource::Variants
            )
          end
          def self.new(type:)
          end
        end
      end
    end
  end
end
