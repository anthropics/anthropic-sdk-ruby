# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        module BetaManagedAgentsSessionResource
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource,
                Anthropic::Beta::Sessions::BetaManagedAgentsFileResource
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionResource::Variants
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
