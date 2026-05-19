# typed: strong

module Anthropic
  module Models
    module Beta
      module Environments
        class BetaSelfHostedWorkUpdateRequest < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Environments::BetaSelfHostedWorkUpdateRequest,
                Anthropic::Internal::AnyHash
              )
            end

          # Metadata patch. Set a key to a string to upsert it, or to null to delete it.
          # Omit the field to preserve existing metadata.
          sig { returns(T::Hash[Symbol, T.nilable(String)]) }
          attr_accessor :metadata

          # Request to update work item metadata.
          sig do
            params(metadata: T::Hash[Symbol, T.nilable(String)]).returns(
              T.attached_class
            )
          end
          def self.new(
            # Metadata patch. Set a key to a string to upsert it, or to null to delete it.
            # Omit the field to preserve existing metadata.
            metadata:
          )
          end

          sig do
            override.returns({ metadata: T::Hash[Symbol, T.nilable(String)] })
          end
          def to_hash
          end
        end
      end
    end
  end
end
