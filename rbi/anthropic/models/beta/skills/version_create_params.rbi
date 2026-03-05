# typed: strong

module Anthropic
  module Models
    module Beta
      module Skills
        class VersionCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Skills::VersionCreateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          sig { returns(String) }
          attr_accessor :skill_id

          # Files to upload for the skill.
          #
          # All files must be in the same top-level directory and must include a SKILL.md
          # file at the root of that directory.
          sig { returns(T.nilable(T::Array[Anthropic::Internal::FileInput])) }
          attr_accessor :files

          # Optional header to specify the beta version(s) you want to use.
          sig do
            returns(
              T.nilable(
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
              )
            )
          end
          attr_reader :betas

          sig do
            params(
              betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
            ).void
          end
          attr_writer :betas

          sig do
            params(
              skill_id: String,
              files: T.nilable(T::Array[Anthropic::Internal::FileInput]),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for the skill.
            #
            # The format and length of IDs may change over time.
            skill_id:,
            # Files to upload for the skill.
            #
            # All files must be in the same top-level directory and must include a SKILL.md
            # file at the root of that directory.
            files: nil,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                skill_id: String,
                files: T.nilable(T::Array[Anthropic::Internal::FileInput]),
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
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
