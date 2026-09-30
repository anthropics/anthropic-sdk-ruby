# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsLinesOfCode < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsLinesOfCode,
                Anthropic::Internal::AnyHash
              )
            end

          # Lines of code added
          sig { returns(Integer) }
          attr_accessor :added_count

          # Lines of code removed
          sig { returns(Integer) }
          attr_accessor :removed_count

          # Lines of code added and removed via Claude Code.
          sig do
            params(added_count: Integer, removed_count: Integer).returns(
              T.attached_class
            )
          end
          def self.new(
            # Lines of code added
            added_count:,
            # Lines of code removed
            removed_count:
          )
          end

          sig do
            override.returns({ added_count: Integer, removed_count: Integer })
          end
          def to_hash
          end
        end
      end
    end
  end
end
