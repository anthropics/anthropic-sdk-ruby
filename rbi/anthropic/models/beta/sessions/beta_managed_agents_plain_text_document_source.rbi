# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsPlainTextDocumentSource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource,
                Anthropic::Internal::AnyHash
              )
            end

          # The plain text content.
          sig { returns(String) }
          attr_accessor :data

          # MIME type of the text content. Must be "text/plain".
          sig { returns(Symbol) }
          attr_accessor :media_type

          sig { returns(Symbol) }
          attr_accessor :type

          # Plain text document content.
          sig do
            params(data: String, media_type: Symbol, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # The plain text content.
            data:,
            # MIME type of the text content. Must be "text/plain".
            media_type: :"text/plain",
            type: :text
          )
          end

          sig do
            override.returns({ data: String, media_type: Symbol, type: Symbol })
          end
          def to_hash
          end
        end
      end
    end
  end
end
