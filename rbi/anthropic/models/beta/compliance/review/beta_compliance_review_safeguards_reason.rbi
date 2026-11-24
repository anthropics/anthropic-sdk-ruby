# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewSafeguardsReason < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewSafeguardsReason,
                  Anthropic::Internal::AnyHash
                )
              end

            sig { returns(Symbol) }
            attr_accessor :type

            # Anthropic flagged the item for your organization to review.
            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :safeguards_review)
            end

            sig { override.returns({ type: Symbol }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
