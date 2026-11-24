# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewEnforcementAction < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewEnforcementAction,
                  Anthropic::Internal::AnyHash
                )
              end

            # The kind of action. New values can appear, so accept a value that you don't
            # know.
            sig { returns(String) }
            attr_accessor :type

            # An action that Anthropic took on the flagged traffic.
            sig { params(type: String).returns(T.attached_class) }
            def self.new(
              # The kind of action. New values can appear, so accept a value that you don't
              # know.
              type:
            )
            end

            sig { override.returns({ type: String }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
