# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaOrganizationRateLimitModelGroup < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaOrganizationRateLimitModelGroup,
                Anthropic::Internal::AnyHash
              )
            end

          # Opaque identifier of the rate-limit group (for example,
          # `rlg_01VPTCmyiu5ZLsWkcxYG2pY8`). It is the same in every organization and never
          # changes, unlike the entry's own identifier, which differs per organization.
          sig { returns(String) }
          attr_accessor :id

          # Human-readable name of the model group (for example, `Claude Sonnet 4.x`). For
          # display only; it may change.
          sig { returns(String) }
          attr_accessor :display_name

          # Always `model_group`: a family of models.
          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(id: String, display_name: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # Opaque identifier of the rate-limit group (for example,
            # `rlg_01VPTCmyiu5ZLsWkcxYG2pY8`). It is the same in every organization and never
            # changes, unlike the entry's own identifier, which differs per organization.
            id:,
            # Human-readable name of the model group (for example, `Claude Sonnet 4.x`). For
            # display only; it may change.
            display_name:,
            # Always `model_group`: a family of models.
            type: :model_group
          )
          end

          sig do
            override.returns({ id: String, display_name: String, type: Symbol })
          end
          def to_hash
          end
        end
      end
    end
  end
end
