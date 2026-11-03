# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAPIKeyScopeMissingErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAPIKeyScopeMissingErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # The API key lacks the scope the request needs: `read:claude_tag` for a read,
          # `write:claude_tag` for a change.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :api_key_scope_missing)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
