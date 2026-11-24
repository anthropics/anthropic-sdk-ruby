# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class DataControlRetrieveParams < Anthropic::Internal::Type::BaseModel
                extend Anthropic::Internal::Type::RequestParameters::Converter
                include Anthropic::Internal::Type::RequestParameters

                OrHash =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::DataControlRetrieveParams,
                      Anthropic::Internal::AnyHash
                    )
                  end

                # The Google Cloud project's number, such as `123456789012`, not its project ID.
                sig { returns(String) }
                attr_accessor :project_number

                # This endpoint is in beta: requests must send
                # `google-managed-data-controls-2026-09-01` in this header.
                sig do
                  returns(
                    T.nilable(
                      T::Array[
                        T.any(Anthropic::AnthropicBeta::OrSymbol, String)
                      ]
                    )
                  )
                end
                attr_reader :betas

                sig do
                  params(
                    betas:
                      T::Array[
                        T.any(Anthropic::AnthropicBeta::OrSymbol, String)
                      ]
                  ).void
                end
                attr_writer :betas

                sig do
                  params(
                    project_number: String,
                    betas:
                      T::Array[
                        T.any(Anthropic::AnthropicBeta::OrSymbol, String)
                      ],
                    request_options: Anthropic::RequestOptions::OrHash
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The Google Cloud project's number, such as `123456789012`, not its project ID.
                  project_number:,
                  # This endpoint is in beta: requests must send
                  # `google-managed-data-controls-2026-09-01` in this header.
                  betas: nil,
                  request_options: {}
                )
                end

                sig do
                  override.returns(
                    {
                      project_number: String,
                      betas:
                        T::Array[
                          T.any(Anthropic::AnthropicBeta::OrSymbol, String)
                        ],
                      request_options: Anthropic::RequestOptions
                    }
                  )
                end
                def to_hash
                end
              end
            end
          end
        end
      end
    end
  end
end
