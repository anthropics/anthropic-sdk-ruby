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

          sig { returns(Symbol) }
          attr_accessor :type

          # Base64-encoded image data.
          sig do
            params(data: String, media_type: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # Base64-encoded image data.
            data:,
            # MIME type of the image (e.g., "image/png", "image/jpeg", "image/gif",
            # "image/webp").
            media_type:,
            type: :base64
          )
          end

          sig do
            override.returns({ data: String, media_type: String, type: Symbol })
          end
          def to_hash
          end
        end
      end
    end
  end
end
