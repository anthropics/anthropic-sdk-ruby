# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class TelemetryDestinations
          sig do
            returns(
              Anthropic::Resources::Beta::Organization::TelemetryDestinations::Workspaces
            )
          end
          attr_reader :workspaces

          # Register an OpenTelemetry destination for the organization.
          #
          # The destination starts in state `enabled`. An organization can have at most 10
          # destinations, including disabled ones.
          #
          # See the
          # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#add-a-destination)
          # to learn more about adding a destination.
          sig do
            params(
              endpoint_url: String,
              workspaces:
                T.any(
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams::OrHash
                ),
              display_name: T.nilable(String),
              headers: T::Hash[Symbol, String],
              traces:
                Anthropic::Beta::Organization::BetaTelemetryDestinationTracesParams::OrHash,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaTelemetryDestination)
          end
          def create(
            # Body param: The base URL of your collector's OTLP/HTTP endpoint, for example
            # `https://gateway.example.com`.
            #
            # The URL must use `https` and a hostname, not an IP address. The port, if given,
            # must be 443. The URL must not contain a query string, a fragment, or a username
            # and password. At most 2,048 characters.
            #
            # A path prefix, such as `/otlp`, is allowed. Don't include the per-signal path
            # (`/v1/traces`), because the API appends it on delivery. If your collector takes
            # traces on another path, also set `traces.endpoint_url`.
            endpoint_url:,
            # Body param: Which of the organization's workspaces the destination covers.
            workspaces:,
            # Body param: Human-readable name for the destination. Optional. 1 to 255
            # characters.
            display_name: nil,
            # Body param: Request headers that the API sends with every delivery, typically
            # your collector's authentication header (for example `authorization`).
            #
            # The API stores the values encrypted and never returns them. Reads show only
            # `header_names`.
            #
            # At most 20 headers. Names are at most 128 characters. Two names can't differ
            # only in case. Values are printable ASCII, at most 4,096 characters, and can't
            # begin or end with a space. Names and values together are at most 16,384 bytes.
            #
            # Reserved names are rejected, for example `host`, `cookie`, `user-agent`, and
            # names that start with `content-`, `proxy-`, `x-forwarded-`, or `anthropic-`. For
            # this check, `_` in a name counts as `-`.
            headers: nil,
            # Body param: The settings for the traces that the destination receives. If you
            # leave it out, every setting takes its default.
            traces: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Read a destination's configuration, state, and most recent delivery results.
          #
          # See the
          # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#delivery-and-health)
          # to learn how the API delivers spans and when it disables a destination.
          sig do
            params(
              destination_id: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaTelemetryDestination)
          end
          def retrieve(
            # ID of the destination (`tdst_...`).
            destination_id,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Change a telemetry destination's settings, its state, or which workspaces it
          # covers.
          #
          # Send at least one field. Omitted fields keep their stored values, except the
          # registered headers, which a change of the endpoint's hostname or port removes.
          # Only `display_name`, `traces`, `traces.endpoint_url`, `traces.content_mode`,
          # `traces.max_content_bytes`, and individual `headers` values accept `null`.
          #
          # If another request changes the destination while the update runs, the API
          # returns a 409 `conflict_error`. Read the destination again, then retry the
          # update.
          #
          # See the
          # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#delivery-and-health)
          # to learn more about changing a destination.
          sig do
            params(
              destination_id: String,
              display_name: T.nilable(String),
              endpoint_url: String,
              headers: T.nilable(T::Hash[Symbol, T.nilable(String)]),
              state:
                T.any(
                  Anthropic::Beta::Organization::BetaTelemetryDestinationStateEnabledParams::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationStateDisabledParams::OrHash
                ),
              traces:
                T.nilable(
                  Anthropic::Beta::Organization::BetaTelemetryDestinationTracesParams::OrHash
                ),
              workspaces:
                T.any(
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesAllParams::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesIncludeParams::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesExcludeParams::OrHash
                ),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaTelemetryDestination)
          end
          def update(
            # Path param: ID of the destination (`tdst_...`).
            destination_id,
            # Body param: New human-readable name, 1 to 255 characters. Null clears it.
            display_name: nil,
            # Body param: The new base URL of the destination's OTLP/HTTP endpoint. The same
            # rules as on create apply.
            #
            # A change of hostname or port first removes every registered header, so send the
            # headers for the new endpoint in the same request. When the destination has a
            # `traces.endpoint_url`, such a change must also set `traces.endpoint_url` to a
            # URL with the new hostname and port, or to `null`. A change of the path alone
            # keeps the headers.
            endpoint_url: nil,
            # Body param: Headers to set or remove. The API merges them into the destination's
            # headers by name.
            #
            # Names compare case-insensitively. A string value sets or replaces that header. A
            # `null` value removes it. Headers that you omit don't change. The field itself
            # can't be `null`.
            #
            # A request that sets a header value must also include `endpoint_url`. The current
            # URL is accepted.
            #
            # The resulting set must stay within the same limits as on create. When the
            # request sets a value, each stored value that it doesn't set counts as 4,096
            # bytes toward the 16,384-byte limit, because you can't read its real length. So
            # to change one header of a destination that has four or more other headers, send
            # the values of the others again in the same request.
            headers: nil,
            # Body param: Whether the destination receives deliveries after the update. The
            # field can't be `null`.
            state: nil,
            # Body param: The traces settings to change. Omitted settings keep their stored
            # values.
            #
            # `null` sets every traces setting to its create default.
            traces: nil,
            # Body param: The new workspace scope, in the same form as on create. The field
            # can't be `null`.
            #
            # The API refuses an update that changes the type or sends `workspace_ids` while
            # the destination's list has more than 750 workspaces. Remove workspaces one at a
            # time until 750 or fewer remain, then send the update again.
            workspaces: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # List the organization's destinations, newest first, optionally only those that
          # cover given workspaces.
          #
          # See the
          # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#set-up-api-tracing)
          # to learn more about destinations.
          sig do
            params(
              limit: Integer,
              page: String,
              workspace_ids: T::Array[String],
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::Organization::BetaTelemetryDestination
              ]
            )
          end
          def list(
            # Query param: Number of destinations to return per page, between 1 and 1,000.
            # Defaults to 20.
            limit: nil,
            # Query param: Opaque cursor from a previous response's `next_page`. Leave it out
            # to get the first page.
            page: nil,
            # Query param: Return only the destinations that cover at least one of these
            # workspaces (`wrkspc_...`).
            #
            # Send at most 100 IDs, as `workspace_ids[]`. A destination covers a workspace
            # when its `workspaces.type` is `all`, when its `include` list has the workspace,
            # or when its `exclude` list doesn't have it. Destinations in either state can
            # match. An ID that isn't the ID of one of the organization's workspaces doesn't
            # match any destination, not even one whose type is `all`.
            workspace_ids: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Delete a destination and its workspace list.
          #
          # The API stops sending spans to the destination. The spans of the workspaces it
          # covered still go to the other destinations that cover them. A deleted
          # destination can't be read, listed, or restored.
          #
          # See the
          # [OpenTelemetry export guide](https://platform.claude.com/docs/en/manage-claude/opentelemetry#delivery-and-health)
          # to learn more about managing a destination.
          sig do
            params(
              destination_id: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Beta::Organization::BetaDeletedTelemetryDestination
            )
          end
          def delete(
            # ID of the destination (`tdst_...`).
            destination_id,
            # Optional header to specify the beta version(s) you want to use.
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
