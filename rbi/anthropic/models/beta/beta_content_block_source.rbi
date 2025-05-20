# typed: strong

module Anthropic
  module Models
    BetaContentBlockSource = Beta::BetaContentBlockSource

    module Beta
      class BetaContentBlockSource < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaContentBlockSource,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(Anthropic::Beta::BetaContentBlockSource::Content::Variants)
        end
        attr_accessor :content

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            content: Anthropic::Beta::BetaContentBlockSource::Content::Variants,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(content:, type: :content)
        end

        sig do
          override.returns(
            {
              content:
                Anthropic::Beta::BetaContentBlockSource::Content::Variants,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        module Content
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                T::Array[
                  Anthropic::Beta::BetaContentBlockSourceContent::Variants
                ]
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaContentBlockSource::Content::Variants
              ]
            )
          end
          def self.variants
          end

          BetaContentBlockSourceContentArray =
            T.let(
              Anthropic::Internal::Type::ArrayOf[
                union: Anthropic::Beta::BetaContentBlockSourceContent
              ],
              Anthropic::Internal::Type::Converter
            )
        end
      end
    end
  end
end
