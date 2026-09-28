# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Plugins
          class VersionCreateParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Plugins::VersionCreateParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # ID of the Plugin (prefixed `plugin_`).
            sig { returns(String) }
            attr_accessor :plugin_id

            # The version's files: one part per file, the part's filename being the file's
            # path within the Plugin (for example `skills/review-pr/SKILL.md`), or a single
            # `.zip` or `.plugin` archive holding them all. On the wire each part is named
            # `files[]`, and a part named plain `files` is not read; with cURL,
            # `-F 'files[]=@SKILL.md;filename=skills/review-pr/SKILL.md'`. The files must
            # include the manifest, `.claude-plugin/plugin.json`.
            sig { returns(T::Array[Anthropic::Internal::FileInput]) }
            attr_accessor :files

            # Release notes stored with the version and shown in its version history in
            # claude.ai; up to 5,000 characters.
            sig { returns(T.nilable(String)) }
            attr_reader :release_notes

            sig { params(release_notes: String).void }
            attr_writer :release_notes

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
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              ).void
            end
            attr_writer :betas

            sig do
              params(
                plugin_id: String,
                files: T::Array[Anthropic::Internal::FileInput],
                release_notes: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # ID of the Plugin (prefixed `plugin_`).
              plugin_id:,
              # The version's files: one part per file, the part's filename being the file's
              # path within the Plugin (for example `skills/review-pr/SKILL.md`), or a single
              # `.zip` or `.plugin` archive holding them all. On the wire each part is named
              # `files[]`, and a part named plain `files` is not read; with cURL,
              # `-F 'files[]=@SKILL.md;filename=skills/review-pr/SKILL.md'`. The files must
              # include the manifest, `.claude-plugin/plugin.json`.
              files:,
              # Release notes stored with the version and shown in its version history in
              # claude.ai; up to 5,000 characters.
              release_notes: nil,
              # This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
              # header.
              betas: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  plugin_id: String,
                  files: T::Array[Anthropic::Internal::FileInput],
                  release_notes: String,
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
end
