# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaGrantRequiredErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaGrantRequiredErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # Anthropic has not approved External Storage for the organization, for the
          # Workspace or, for storage bound to a user profile, for that user profile.
          # Contact your Anthropic account team.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :grant_required)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
