# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionThread < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this thread.
          sig { returns(String) }
          attr_accessor :id

          # Resolved agent definition for this thread. Snapshot of the agent at thread
          # creation time.
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Agent::Variants
            )
          end
          attr_accessor :agent

          # When the thread was archived. Null if not archived.
          sig { returns(T.nilable(Time)) }
          attr_accessor :archived_at

          # When the thread was created.
          sig { returns(Time) }
          attr_accessor :created_at

          # Parent thread that spawned this thread. Null for the primary thread.
          sig { returns(T.nilable(String)) }
          attr_accessor :parent_thread_id

          # The session this thread belongs to.
          sig { returns(String) }
          attr_accessor :session_id

          # Timing statistics for this thread. Null until the thread's first status
          # transition.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStats
              )
            )
          end
          attr_reader :stats

          sig do
            params(
              stats:
                T.nilable(
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStats::OrHash
                )
            ).void
          end
          attr_writer :stats

          # Current execution status of the thread.
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatus::TaggedSymbol
            )
          end
          attr_accessor :status

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # When the thread was last updated.
          sig { returns(Time) }
          attr_accessor :updated_at

          # Cumulative token usage for this thread. Null until the thread's first idle
          # transition.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadUsage
              )
            )
          end
          attr_reader :usage

          sig do
            params(
              usage:
                T.nilable(
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadUsage::OrHash
                )
            ).void
          end
          attr_writer :usage

          # An execution thread within a `session`. Each session has one primary thread plus
          # zero or more child threads spawned by the coordinator.
          sig do
            params(
              id: String,
              agent:
                T.any(
                  Anthropic::Beta::BetaManagedAgentsSessionThreadAgent::OrHash,
                  Anthropic::Beta::BetaManagedAgentsAdvisor::OrHash
                ),
              archived_at: T.nilable(Time),
              created_at: Time,
              parent_thread_id: T.nilable(String),
              session_id: String,
              stats:
                T.nilable(
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStats::OrHash
                ),
              status:
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatus::OrSymbol,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Type::OrSymbol,
              updated_at: Time,
              usage:
                T.nilable(
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadUsage::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this thread.
            id:,
            # Resolved agent definition for this thread. Snapshot of the agent at thread
            # creation time.
            agent:,
            # When the thread was archived. Null if not archived.
            archived_at:,
            # When the thread was created.
            created_at:,
            # Parent thread that spawned this thread. Null for the primary thread.
            parent_thread_id:,
            # The session this thread belongs to.
            session_id:,
            # Timing statistics for this thread. Null until the thread's first status
            # transition.
            stats:,
            # Current execution status of the thread.
            status:,
            type:,
            # When the thread was last updated.
            updated_at:,
            # Cumulative token usage for this thread. Null until the thread's first idle
            # transition.
            usage:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                agent:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Agent::Variants,
                archived_at: T.nilable(Time),
                created_at: Time,
                parent_thread_id: T.nilable(String),
                session_id: String,
                stats:
                  T.nilable(
                    Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStats
                  ),
                status:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatus::TaggedSymbol,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Type::TaggedSymbol,
                updated_at: Time,
                usage:
                  T.nilable(
                    Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadUsage
                  )
              }
            )
          end
          def to_hash
          end

          # Resolved agent definition for this thread. Snapshot of the agent at thread
          # creation time.
          module Agent
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::BetaManagedAgentsSessionThreadAgent,
                  Anthropic::Beta::BetaManagedAgentsAdvisor
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Agent::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              AGENT =
                T.let(
                  :agent,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Agent::Type::TaggedSymbol
                )
              ADVISOR =
                T.let(
                  :advisor,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Agent::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Agent::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Agent::Variants
                ]
              )
            end
            def self.variants
            end

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            sig do
              params(
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Agent::Type::OrSymbol,
                model:
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsModelConfig::OrHash,
                    String
                  ),
                id: String,
                description: T.nilable(String),
                mcp_servers:
                  T::Array[
                    Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition::OrHash
                  ],
                name: String,
                skills:
                  T::Array[
                    T.any(
                      Anthropic::Beta::BetaManagedAgentsAnthropicSkill::OrHash,
                      Anthropic::Beta::BetaManagedAgentsCustomSkill::OrHash
                    )
                  ],
                system_: T.nilable(String),
                tools:
                  T::Array[
                    T.any(
                      Anthropic::Beta::BetaManagedAgentsAgentToolset20260401::OrHash,
                      Anthropic::Beta::BetaManagedAgentsMCPToolset::OrHash,
                      Anthropic::Beta::BetaManagedAgentsCustomTool::OrHash
                    )
                  ],
                version: Integer
              ).returns(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Agent::Variants
              )
            end
            def self.new(
              type:,
              # Model identifier and configuration.
              model:,
              id: nil,
              description: nil,
              mcp_servers: nil,
              name: nil,
              skills: nil,
              system_: nil,
              tools: nil,
              version: nil
            )
            end
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SESSION_THREAD =
              T.let(
                :session_thread,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
