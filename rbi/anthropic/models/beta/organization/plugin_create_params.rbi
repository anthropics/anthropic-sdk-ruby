# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class PluginCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::PluginCreateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # The version's files: one part per file, the part's filename being the file's
          # path within the Plugin (for example `skills/review-pr/SKILL.md`), or a single
          # `.zip` or `.plugin` archive holding them all. On the wire each part is named
          # `files[]`, and a part named plain `files` is not read; with cURL,
          # `-F 'files[]=@SKILL.md;filename=skills/review-pr/SKILL.md'`. The files must
          # include the manifest, `.claude-plugin/plugin.json`.
          sig { returns(T::Array[Anthropic::Internal::FileInput]) }
          attr_accessor :files

          # ID of the organization-owned plugin marketplace to create the Plugin in
          # (prefixed `marketplace_`). It must be a `manual` marketplace, one whose Plugins
          # are uploaded rather than synchronized from a repository. When omitted, the
          # Plugin is created in the organization's library marketplace, an
          # organization-owned `manual` marketplace created on first use.
          sig { returns(T.nilable(String)) }
          attr_reader :marketplace_id

          sig { params(marketplace_id: String).void }
          attr_writer :marketplace_id

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
              betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
            ).void
          end
          attr_writer :betas

          sig do
            params(
              files: T::Array[Anthropic::Internal::FileInput],
              marketplace_id: String,
              release_notes: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The version's files: one part per file, the part's filename being the file's
            # path within the Plugin (for example `skills/review-pr/SKILL.md`), or a single
            # `.zip` or `.plugin` archive holding them all. On the wire each part is named
            # `files[]`, and a part named plain `files` is not read; with cURL,
            # `-F 'files[]=@SKILL.md;filename=skills/review-pr/SKILL.md'`. The files must
            # include the manifest, `.claude-plugin/plugin.json`.
            files:,
            # ID of the organization-owned plugin marketplace to create the Plugin in
            # (prefixed `marketplace_`). It must be a `manual` marketplace, one whose Plugins
            # are uploaded rather than synchronized from a repository. When omitted, the
            # Plugin is created in the organization's library marketplace, an
            # organization-owned `manual` marketplace created on first use.
            marketplace_id: nil,
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
                files: T::Array[Anthropic::Internal::FileInput],
                marketplace_id: String,
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
