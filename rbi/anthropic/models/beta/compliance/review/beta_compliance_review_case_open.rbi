# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewCaseOpen < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseOpen,
                  Anthropic::Internal::AnyHash
                )
              end

            sig { returns(Symbol) }
            attr_accessor :type

            # Anthropic is waiting for a response to the case.
            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :open)
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
