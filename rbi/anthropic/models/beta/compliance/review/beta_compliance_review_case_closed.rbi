# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewCaseClosed < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseClosed,
                  Anthropic::Internal::AnyHash
                )
              end

            # Why the case closed. It doesn't change afterwards.
            sig do
              returns(
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason
              )
            end
            attr_reader :reason

            sig do
              params(
                reason:
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason::OrHash
              ).void
            end
            attr_writer :reason

            sig { returns(Symbol) }
            attr_accessor :type

            # Anthropic has stopped waiting for a response. A closed case stays closed.
            sig do
              params(
                reason:
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason::OrHash,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Why the case closed. It doesn't change afterwards.
              reason:,
              type: :closed
            )
            end

            sig do
              override.returns(
                {
                  reason:
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason,
                  type: Symbol
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
