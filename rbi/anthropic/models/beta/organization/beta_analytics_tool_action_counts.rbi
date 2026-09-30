# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsToolActionCounts < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts,
                Anthropic::Internal::AnyHash
              )
            end

          # Number of tool proposals accepted
          sig { returns(Integer) }
          attr_accessor :accepted_count

          # Number of tool proposals rejected
          sig { returns(Integer) }
          attr_accessor :rejected_count

          # Accepted/rejected counts for a single Claude Code tool type.
          sig do
            params(accepted_count: Integer, rejected_count: Integer).returns(
              T.attached_class
            )
          end
          def self.new(
            # Number of tool proposals accepted
            accepted_count:,
            # Number of tool proposals rejected
            rejected_count:
          )
          end

          sig do
            override.returns(
              { accepted_count: Integer, rejected_count: Integer }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
