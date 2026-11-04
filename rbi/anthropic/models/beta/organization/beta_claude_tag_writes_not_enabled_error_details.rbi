# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagWritesNotEnabledErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagWritesNotEnabledErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # Changes through the Claude Tag API are not enabled for the organization.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :claude_tag_writes_not_enabled)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
