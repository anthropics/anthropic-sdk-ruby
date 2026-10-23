# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          class SlackWorkspaceListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::ClaudeTag::SlackWorkspaceListParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # When `true`, `settings` holds what applies in each workspace once the
            # organization's Slack defaults are taken into account, and every member of
            # `sources` names the level a value comes from. When `false` or left out,
            # `settings` holds what each workspace itself stores.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :include_inherited

            sig { params(include_inherited: T::Boolean).void }
            attr_writer :include_inherited

            # Number of items to return per page, between 1 and 100. Defaults to 20.
            sig { returns(T.nilable(Integer)) }
            attr_reader :limit

            sig { params(limit: Integer).void }
            attr_writer :limit

            # Opaque cursor from a previous response's `next_page`.
            sig { returns(T.nilable(String)) }
            attr_reader :page

            sig { params(page: String).void }
            attr_writer :page

            # Slack's identifier for one workspace, as in the workspace object's
            # `slack.workspace_id`, not its `id`. With it `data` holds that workspace alone,
            # or nothing when it is not set up.
            sig { returns(T.nilable(String)) }
            attr_reader :slack_workspace_id

            sig { params(slack_workspace_id: String).void }
            attr_writer :slack_workspace_id

            # This endpoint is in beta: requests must send
            # `experimental-claude-tag-2026-10-21` in this header.
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
                include_inherited: T::Boolean,
                limit: Integer,
                page: String,
                slack_workspace_id: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # When `true`, `settings` holds what applies in each workspace once the
              # organization's Slack defaults are taken into account, and every member of
              # `sources` names the level a value comes from. When `false` or left out,
              # `settings` holds what each workspace itself stores.
              include_inherited: nil,
              # Number of items to return per page, between 1 and 100. Defaults to 20.
              limit: nil,
              # Opaque cursor from a previous response's `next_page`.
              page: nil,
              # Slack's identifier for one workspace, as in the workspace object's
              # `slack.workspace_id`, not its `id`. With it `data` holds that workspace alone,
              # or nothing when it is not set up.
              slack_workspace_id: nil,
              # This endpoint is in beta: requests must send
              # `experimental-claude-tag-2026-10-21` in this header.
              betas: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  include_inherited: T::Boolean,
                  limit: Integer,
                  page: String,
                  slack_workspace_id: String,
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
