# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsTextBlock < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock,
                Anthropic::Internal::AnyHash
              )
            end

          # The text content.
          sig { returns(String) }
          attr_accessor :text

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Regular text content.
          sig do
            params(
              text: String,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The text content.
            text:,
            type:
          )
          end

          sig do
            override.returns(
              {
                text: String,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::Type::OrSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TEXT =
              T.let(
                :text,
                Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::Type::TaggedSymbol
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
end
