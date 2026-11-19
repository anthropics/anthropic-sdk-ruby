# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          class BetaSettingsDocumentLimitExceededErrorDetails < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::ClaudeCode::BetaSettingsDocumentLimitExceededErrorDetails,
                  Anthropic::Internal::AnyHash
                )
              end

            sig { returns(Symbol) }
            attr_accessor :error_code

            # The organization has reached its limit of settings documents, counting unused
            # ones. An owner can remove unused documents in claude.ai. Deleting a group's
            # settings or clearing the default settings also frees a document, if nothing else
            # uses it. None of these works once the organization has also reached its settings
            # history limit.
            sig { params(error_code: Symbol).returns(T.attached_class) }
            def self.new(error_code: :settings_document_limit_exceeded)
            end

            sig { override.returns({ error_code: Symbol }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
