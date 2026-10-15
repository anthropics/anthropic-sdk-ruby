# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class TelemetryDestinations
          class Workspaces
            # List the workspaces on a destination's workspace list, newest entry first.
            #
            # A destination whose `workspaces.type` is `all` doesn't have a list, so its page
            # is empty. The list includes archived workspaces.
            #
            # See the
            # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#choose-workspaces-for-a-destination)
            # to learn more about choosing the workspaces of a destination.
            sig do
              params(
                destination_id: String,
                limit: Integer,
                page: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::PageCursor[
                  Anthropic::Beta::Organization::TelemetryDestinations::BetaTelemetryDestinationWorkspace
                ]
              )
            end
            def list(
              # Path param: ID of the destination (`tdst_...`).
              destination_id,
              # Query param: Number of entries to return per page, between 1 and 1,000. Defaults
              # to 20.
              limit: nil,
              # Query param: Opaque cursor from a previous response's `next_page`. Leave it out
              # to get the first page.
              page: nil,
              # Header param: This endpoint is in beta: requests must send
              # `telemetry-destinations-2026-08-11` in this header.
              betas: nil,
              request_options: {}
            )
            end

            # Add one workspace to a destination's workspace list.
            #
            # Under `include` the workspace's spans start going to the destination. Under
            # `exclude` they stop. A list holds at most 1,000 workspaces.
            #
            # Adding a workspace that is already on the list changes nothing and returns the
            # existing entry. An archived workspace that isn't on the list yet can't be added.
            # A destination whose `workspaces.type` is `all` doesn't have a list, so the API
            # returns 400. To change which workspaces such a destination covers, update its
            # `workspaces`.
            #
            # See the
            # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#choose-workspaces-for-a-destination)
            # to learn more about choosing the workspaces of a destination.
            sig do
              params(
                workspace_id: String,
                destination_id: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::TelemetryDestinations::BetaTelemetryDestinationWorkspace
              )
            end
            def add(
              # Path param: ID of the workspace to add (`wrkspc_...`).
              workspace_id,
              # Path param: ID of the destination (`tdst_...`).
              destination_id:,
              # Header param: This endpoint is in beta: requests must send
              # `telemetry-destinations-2026-08-11` in this header.
              betas: nil,
              request_options: {}
            )
            end

            # Remove one workspace from a destination's workspace list.
            #
            # Under `include` the workspace's spans stop going to the destination. Under
            # `exclude` they start. An archived workspace can be removed too.
            #
            # The API returns 404 when the workspace isn't on the list. A destination whose
            # `workspaces.type` is `all` doesn't have a list, so the API returns 400.
            #
            # See the
            # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#choose-workspaces-for-a-destination)
            # to learn more about choosing the workspaces of a destination.
            sig do
              params(
                workspace_id: String,
                destination_id: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::TelemetryDestinations::BetaDeletedTelemetryDestinationWorkspace
              )
            end
            def remove(
              # Path param: ID of the workspace to remove (`wrkspc_...`).
              workspace_id,
              # Path param: ID of the destination (`tdst_...`).
              destination_id:,
              # Header param: This endpoint is in beta: requests must send
              # `telemetry-destinations-2026-08-11` in this header.
              betas: nil,
              request_options: {}
            )
            end

            # @api private
            sig { params(client: Anthropic::Client).returns(T.attached_class) }
            def self.new(client:)
            end
          end
        end
      end
    end
  end
end
