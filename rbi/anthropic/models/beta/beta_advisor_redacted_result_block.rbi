# typed: strong

module Anthropic
  module Models
    BetaAdvisorRedactedResultBlock = Beta::BetaAdvisorRedactedResultBlock

    module Beta
      class BetaAdvisorRedactedResultBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaAdvisorRedactedResultBlock,
              Anthropic::Internal::AnyHash
            )
          end

        # Opaque blob containing the advisor's output. Round-trip verbatim; do not inspect
        # or modify.
        sig { returns(String) }
        attr_accessor :encrypted_content

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(encrypted_content: String, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # Opaque blob containing the advisor's output. Round-trip verbatim; do not inspect
          # or modify.
          encrypted_content:,
          type: :advisor_redacted_result
        )
        end

        sig { override.returns({ encrypted_content: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
