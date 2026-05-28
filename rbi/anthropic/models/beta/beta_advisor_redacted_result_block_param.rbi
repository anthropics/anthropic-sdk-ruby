# typed: strong

module Anthropic
  module Models
    BetaAdvisorRedactedResultBlockParam =
      Beta::BetaAdvisorRedactedResultBlockParam

    module Beta
      class BetaAdvisorRedactedResultBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaAdvisorRedactedResultBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        # Opaque blob produced by a prior response; must be round-tripped verbatim.
        sig { returns(String) }
        attr_accessor :encrypted_content

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(String)) }
        attr_accessor :stop_reason

        sig do
          params(
            encrypted_content: String,
            stop_reason: T.nilable(String),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Opaque blob produced by a prior response; must be round-tripped verbatim.
          encrypted_content:,
          stop_reason: nil,
          type: :advisor_redacted_result
        )
        end

        sig do
          override.returns(
            {
              encrypted_content: String,
              type: Symbol,
              stop_reason: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
