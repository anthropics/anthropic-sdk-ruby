# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewStoredCopyUnavailable < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewStoredCopyUnavailable,
                  Anthropic::Internal::AnyHash
                )
              end

            sig { returns(Symbol) }
            attr_accessor :type

            # A copy of the message was stored and can't be returned.
            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :stored_copy_unavailable)
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
