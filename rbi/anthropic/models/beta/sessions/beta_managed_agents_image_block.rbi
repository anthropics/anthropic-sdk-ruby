# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsImageBlock < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock,
                Anthropic::Internal::AnyHash
              )
            end

          # Union type for image source variants.
          sig do
            returns(
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsBase64ImageSource,
                Anthropic::Beta::Sessions::BetaManagedAgentsURLImageSource,
                Anthropic::Beta::Sessions::BetaManagedAgentsFileImageSource
              )
            )
          end
          attr_accessor :source

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Image content specified directly as base64 data or as a reference via a URL.
          sig do
            params(
              source:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsBase64ImageSource::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsURLImageSource::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileImageSource::OrHash
                ),
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Union type for image source variants.
            source:,
            type:
          )
          end

          sig do
            override.returns(
              {
                source:
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsBase64ImageSource,
                    Anthropic::Beta::Sessions::BetaManagedAgentsURLImageSource,
                    Anthropic::Beta::Sessions::BetaManagedAgentsFileImageSource
                  ),
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock::Type::OrSymbol
              }
            )
          end
          def to_hash
          end

          # Union type for image source variants.
          module Source
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsBase64ImageSource,
                  Anthropic::Beta::Sessions::BetaManagedAgentsURLImageSource,
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileImageSource
                )
              end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock::Source::Variants
                ]
              )
            end
            def self.variants
            end
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            IMAGE =
              T.let(
                :image,
                Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock::Type::TaggedSymbol
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
