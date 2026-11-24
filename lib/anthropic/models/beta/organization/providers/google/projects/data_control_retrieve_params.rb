# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              # @see Anthropic::Resources::Beta::Organization::Providers::Google::Projects::DataControls#retrieve
              class DataControlRetrieveParams < Anthropic::Internal::Type::BaseModel
                extend Anthropic::Internal::Type::RequestParameters::Converter
                include Anthropic::Internal::Type::RequestParameters

                # @!attribute project_number
                #   The Google Cloud project's number, such as `123456789012`, not its project ID.
                #
                #   @return [String]
                required :project_number, String

                # @!attribute betas
                #   This endpoint is in beta: requests must send
                #   `google-managed-data-controls-2026-09-01` in this header.
                #
                #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
                optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

                # @!method initialize(project_number:, betas: nil, request_options: {})
                #   Some parameter documentations has been truncated, see
                #   {Anthropic::Models::Beta::Organization::Providers::Google::Projects::DataControlRetrieveParams}
                #   for more details.
                #
                #   @param project_number [String] The Google Cloud project's number, such as `123456789012`, not its project ID.
                #
                #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send
                #
                #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
              end
            end
          end
        end
      end
    end
  end
end
