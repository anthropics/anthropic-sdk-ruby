# typed: strong

module Anthropic
  module Models
    BetaRefusalStopDetails = Beta::BetaRefusalStopDetails

    module Beta
      class BetaRefusalStopDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaRefusalStopDetails,
              Anthropic::Internal::AnyHash
            )
          end

        # The policy category that triggered the refusal.
        #
        # `null` when the refusal doesn't map to a named category.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaRefusalStopDetails::Category::TaggedSymbol
            )
          )
        end
        attr_accessor :category

        # Human-readable explanation of the refusal.
        #
        # This text is not guaranteed to be stable. `null` when no explanation is
        # available for the category.
        sig { returns(T.nilable(String)) }
        attr_accessor :explanation

        sig { returns(Symbol) }
        attr_accessor :type

        # Structured information about a refusal.
        sig do
          params(
            category:
              T.nilable(
                Anthropic::Beta::BetaRefusalStopDetails::Category::OrSymbol
              ),
            explanation: T.nilable(String),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The policy category that triggered the refusal.
          #
          # `null` when the refusal doesn't map to a named category.
          category:,
          # Human-readable explanation of the refusal.
          #
          # This text is not guaranteed to be stable. `null` when no explanation is
          # available for the category.
          explanation:,
          type: :refusal
        )
        end

        sig do
          override.returns(
            {
              category:
                T.nilable(
                  Anthropic::Beta::BetaRefusalStopDetails::Category::TaggedSymbol
                ),
              explanation: T.nilable(String),
              type: Symbol
            }
          )
        end
        def to_hash
        end

        # The policy category that triggered the refusal.
        #
        # `null` when the refusal doesn't map to a named category.
        module Category
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaRefusalStopDetails::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CYBER =
            T.let(
              :cyber,
              Anthropic::Beta::BetaRefusalStopDetails::Category::TaggedSymbol
            )
          BIO =
            T.let(
              :bio,
              Anthropic::Beta::BetaRefusalStopDetails::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaRefusalStopDetails::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
