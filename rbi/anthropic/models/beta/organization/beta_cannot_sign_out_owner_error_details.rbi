# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaCannotSignOutOwnerErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaCannotSignOutOwnerErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # The member is an owner or has owner permissions, and this API key or token
          # cannot sign them out. In a Claude Enterprise organization, an API key with the
          # `write:members` scope can.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :cannot_sign_out_owner)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
