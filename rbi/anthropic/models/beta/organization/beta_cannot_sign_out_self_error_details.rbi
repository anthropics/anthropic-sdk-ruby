# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaCannotSignOutSelfErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaCannotSignOutSelfErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # The member is the user the API key or token belongs to.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :cannot_sign_out_self)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
