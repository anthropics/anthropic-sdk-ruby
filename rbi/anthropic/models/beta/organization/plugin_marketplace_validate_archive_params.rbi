# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class PluginMarketplaceValidateArchiveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::PluginMarketplaceValidateArchiveParams,
                Anthropic::Internal::AnyHash
              )
            end

          # A .zip of the marketplace directory (its contents at the root, or wrapped in one
          # folder as a Git host's download produces), sent as a file part with a filename;
          # DEFLATE- or STORE-compressed, at most 32 MB. A part sent without a filename, a
          # second archive part, or any other form field is a 400; a larger archive is
          # a 413.
          sig { returns(Anthropic::Internal::FileInput) }
          attr_accessor :archive

          # This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
          # header.
          sig do
            returns(
              T.nilable(
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              )
            )
          end
          attr_reader :betas

          sig do
            params(
              betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
            ).void
          end
          attr_writer :betas

          sig do
            params(
              archive: Anthropic::Internal::FileInput,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # A .zip of the marketplace directory (its contents at the root, or wrapped in one
            # folder as a Git host's download produces), sent as a file part with a filename;
            # DEFLATE- or STORE-compressed, at most 32 MB. A part sent without a filename, a
            # second archive part, or any other form field is a 400; a larger archive is
            # a 413.
            archive:,
            # This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
            # header.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                archive: Anthropic::Internal::FileInput,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
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
