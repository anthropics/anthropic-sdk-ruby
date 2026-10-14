# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestination < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestination,
                Anthropic::Internal::AnyHash
              )
            end

          # The unique ID of the destination (`tdst_...`).
          sig { returns(String) }
          attr_accessor :id

          # Time the destination was created.
          sig { returns(Time) }
          attr_accessor :created_at

          # The most recent delivery results for this destination.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaTelemetryDestinationDeliveryHealth
            )
          end
          attr_reader :delivery_health

          sig do
            params(
              delivery_health:
                Anthropic::Beta::Organization::BetaTelemetryDestinationDeliveryHealth::OrHash
            ).void
          end
          attr_writer :delivery_health

          # Human-readable name for the destination. Null when none was set.
          sig { returns(T.nilable(String)) }
          attr_accessor :display_name

          # The base URL of the destination's OTLP/HTTP endpoint, exactly as registered.
          #
          # The API appends the per-signal path, such as `/v1/traces`, on delivery, unless
          # `traces.endpoint_url` is set.
          sig { returns(String) }
          attr_accessor :endpoint_url

          # Names of the registered request headers. Header values are write-only and are
          # never returned.
          sig { returns(T::Array[String]) }
          attr_accessor :header_names

          # Whether the destination receives deliveries.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaTelemetryDestinationState::Variants
            )
          end
          attr_accessor :state

          # The destination's settings for the traces it receives.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaTelemetryDestinationTraces
            )
          end
          attr_reader :traces

          sig do
            params(
              traces:
                Anthropic::Beta::Organization::BetaTelemetryDestinationTraces::OrHash
            ).void
          end
          attr_writer :traces

          sig { returns(Symbol) }
          attr_accessor :type

          # Time of the last change to the destination's configuration or state. Changes to
          # `delivery_health` don't change it.
          #
          # An update that sets a header value always changes it, even when the value is the
          # same as before. Adding or removing a single workspace on the destination's list
          # doesn't change it. An update that changes the list does.
          sig { returns(Time) }
          attr_accessor :updated_at

          # Which of the organization's workspaces the destination covers.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspaces::Variants
            )
          end
          attr_accessor :workspaces

          # An OpenTelemetry destination: an OTLP/HTTP endpoint, the request headers sent
          # with every delivery to it, what the exported spans contain, and which workspaces
          # it covers. A destination belongs to an organization. A workspace's spans go to
          # every enabled destination that covers it.
          sig do
            params(
              id: String,
              created_at: Time,
              delivery_health:
                Anthropic::Beta::Organization::BetaTelemetryDestinationDeliveryHealth::OrHash,
              display_name: T.nilable(String),
              endpoint_url: String,
              header_names: T::Array[String],
              state:
                T.any(
                  Anthropic::Beta::Organization::BetaTelemetryDestinationStateEnabled::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationStateDisabled::OrHash
                ),
              traces:
                Anthropic::Beta::Organization::BetaTelemetryDestinationTraces::OrHash,
              updated_at: Time,
              workspaces:
                T.any(
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesAll::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesInclude::OrHash,
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspacesExclude::OrHash
                ),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The unique ID of the destination (`tdst_...`).
            id:,
            # Time the destination was created.
            created_at:,
            # The most recent delivery results for this destination.
            delivery_health:,
            # Human-readable name for the destination. Null when none was set.
            display_name:,
            # The base URL of the destination's OTLP/HTTP endpoint, exactly as registered.
            #
            # The API appends the per-signal path, such as `/v1/traces`, on delivery, unless
            # `traces.endpoint_url` is set.
            endpoint_url:,
            # Names of the registered request headers. Header values are write-only and are
            # never returned.
            header_names:,
            # Whether the destination receives deliveries.
            state:,
            # The destination's settings for the traces it receives.
            traces:,
            # Time of the last change to the destination's configuration or state. Changes to
            # `delivery_health` don't change it.
            #
            # An update that sets a header value always changes it, even when the value is the
            # same as before. Adding or removing a single workspace on the destination's list
            # doesn't change it. An update that changes the list does.
            updated_at:,
            # Which of the organization's workspaces the destination covers.
            workspaces:,
            type: :telemetry_destination
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: Time,
                delivery_health:
                  Anthropic::Beta::Organization::BetaTelemetryDestinationDeliveryHealth,
                display_name: T.nilable(String),
                endpoint_url: String,
                header_names: T::Array[String],
                state:
                  Anthropic::Beta::Organization::BetaTelemetryDestinationState::Variants,
                traces:
                  Anthropic::Beta::Organization::BetaTelemetryDestinationTraces,
                type: Symbol,
                updated_at: Time,
                workspaces:
                  Anthropic::Beta::Organization::BetaTelemetryDestinationWorkspaces::Variants
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
