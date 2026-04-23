# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        # The updated session resource.
        module ResourceUpdateResponse
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource,
                Anthropic::Beta::Sessions::BetaManagedAgentsFileResource,
                Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Models::Beta::Sessions::ResourceUpdateResponse::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
