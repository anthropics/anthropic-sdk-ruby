# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsBase64ImageSource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsBase64ImageSource,
                Anthropic::Internal::AnyHash
              )
            end

          # Base64-encoded image data.
          sig { returns(String) }
          attr_accessor :data

          # MIME type of the image (e.g., "image/png", "image/jpeg", "image/gif",
          # "image/webp").
          sig { returns(String) }
          attr_accessor :media_type

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsBase64ImageSource::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Base64-encoded image data.
          sig do
            params(
              data: String,
              media_type: String,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsBase64ImageSource::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Base64-encoded image data.
            data:,
            # MIME type of the image (e.g., "image/png", "image/jpeg", "image/gif",
            # "image/webp").
            media_type:,
            type:
          )
          end

          sig do
            override.returns(
              {
                data: String,
                media_type: String,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsBase64ImageSource::Type::OrSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsBase64ImageSource::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            BASE64 =
              T.let(
                :base64,
                Anthropic::Beta::Sessions::BetaManagedAgentsBase64ImageSource::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsBase64ImageSource::Type::TaggedSymbol
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
