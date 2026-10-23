# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsFederatedActorGCPProvider < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsFederatedActorGCPProvider,
                Anthropic::Internal::AnyHash
              )
            end

          # The Google Cloud project the organization is bound to.
          sig { returns(String) }
          attr_accessor :project_number

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(project_number: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # The Google Cloud project the organization is bound to.
            project_number:,
            type: :gcp
          )
          end

          sig { override.returns({ project_number: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
