# typed: strong

module Anthropic
  module Models
    OrganizationRateLimitTokenCountGroup =
      Organization::OrganizationRateLimitTokenCountGroup

    module Organization
      class OrganizationRateLimitTokenCountGroup < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::OrganizationRateLimitTokenCountGroup,
              Anthropic::Internal::AnyHash
            )
          end

        # Opaque identifier of the rate-limit group (for example,
        # `rlg_01VPTCmyiu5ZLsWkcxYG2pY8`). It is the same in every organization and never
        # changes, unlike the entry's own identifier, which differs per organization.
        sig { returns(String) }
        attr_accessor :id

        # Always `token_count`: the Token Count API.
        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(id: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # Opaque identifier of the rate-limit group (for example,
          # `rlg_01VPTCmyiu5ZLsWkcxYG2pY8`). It is the same in every organization and never
          # changes, unlike the entry's own identifier, which differs per organization.
          id:,
          # Always `token_count`: the Token Count API.
          type: :token_count
        )
        end

        sig { override.returns({ id: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
