# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaBundleOnCallErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaBundleOnCallErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # This Bundle's instructions are managed in claude.ai and can't be changed through
          # the API.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :bundle_on_call)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
