# typed: strong

module Anthropic
  module Models
    # Code execution tool with REPL state persistence (daemon mode + gVisor
    # checkpoint).
    module ToolUnion
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::Tool,
            Anthropic::ToolBash20250124,
            Anthropic::CodeExecutionTool20250522,
            Anthropic::CodeExecutionTool20250825,
            Anthropic::ToolUnion::CodeExecutionTool20260120,
            Anthropic::MemoryTool20250818,
            Anthropic::ToolTextEditor20250124,
            Anthropic::ToolTextEditor20250429,
            Anthropic::ToolTextEditor20250728,
            Anthropic::WebSearchTool20250305,
            Anthropic::WebFetchTool20250910,
            Anthropic::ToolUnion::WebSearchTool20260209,
            Anthropic::ToolUnion::WebFetchTool20260209,
            Anthropic::ToolSearchToolBm25_20251119,
            Anthropic::ToolSearchToolRegex20251119
          )
        end

      class CodeExecutionTool20260120 < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::ToolUnion::CodeExecutionTool20260120,
              Anthropic::Internal::AnyHash
            )
          end

        # Name of the tool.
        #
        # This is how the tool will be called by the model and in `tool_use` blocks.
        sig { returns(Symbol) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          returns(
            T.nilable(
              T::Array[
                Anthropic::ToolUnion::CodeExecutionTool20260120::AllowedCaller::OrSymbol
              ]
            )
          )
        end
        attr_reader :allowed_callers

        sig do
          params(
            allowed_callers:
              T::Array[
                Anthropic::ToolUnion::CodeExecutionTool20260120::AllowedCaller::OrSymbol
              ]
          ).void
        end
        attr_writer :allowed_callers

        # Create a cache control breakpoint at this content block.
        sig { returns(T.nilable(Anthropic::CacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash)
          ).void
        end
        attr_writer :cache_control

        # If true, tool will not be included in initial system prompt. Only loaded when
        # returned via tool_reference from tool search.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :defer_loading

        sig { params(defer_loading: T::Boolean).void }
        attr_writer :defer_loading

        # When true, guarantees schema validation on tool names and inputs
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :strict

        sig { params(strict: T::Boolean).void }
        attr_writer :strict

        # Code execution tool with REPL state persistence (daemon mode + gVisor
        # checkpoint).
        sig do
          params(
            allowed_callers:
              T::Array[
                Anthropic::ToolUnion::CodeExecutionTool20260120::AllowedCaller::OrSymbol
              ],
            cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
            defer_loading: T::Boolean,
            strict: T::Boolean,
            name: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          allowed_callers: nil,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          # If true, tool will not be included in initial system prompt. Only loaded when
          # returned via tool_reference from tool search.
          defer_loading: nil,
          # When true, guarantees schema validation on tool names and inputs
          strict: nil,
          # Name of the tool.
          #
          # This is how the tool will be called by the model and in `tool_use` blocks.
          name: :code_execution,
          type: :code_execution_20260120
        )
        end

        sig do
          override.returns(
            {
              name: Symbol,
              type: Symbol,
              allowed_callers:
                T::Array[
                  Anthropic::ToolUnion::CodeExecutionTool20260120::AllowedCaller::OrSymbol
                ],
              cache_control: T.nilable(Anthropic::CacheControlEphemeral),
              defer_loading: T::Boolean,
              strict: T::Boolean
            }
          )
        end
        def to_hash
        end

        module AllowedCaller
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::ToolUnion::CodeExecutionTool20260120::AllowedCaller
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DIRECT =
            T.let(
              :direct,
              Anthropic::ToolUnion::CodeExecutionTool20260120::AllowedCaller::TaggedSymbol
            )
          CODE_EXECUTION_20250825 =
            T.let(
              :code_execution_20250825,
              Anthropic::ToolUnion::CodeExecutionTool20260120::AllowedCaller::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::ToolUnion::CodeExecutionTool20260120::AllowedCaller::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class WebSearchTool20260209 < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::ToolUnion::WebSearchTool20260209,
              Anthropic::Internal::AnyHash
            )
          end

        # Name of the tool.
        #
        # This is how the tool will be called by the model and in `tool_use` blocks.
        sig { returns(Symbol) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          returns(
            T.nilable(
              T::Array[
                Anthropic::ToolUnion::WebSearchTool20260209::AllowedCaller::OrSymbol
              ]
            )
          )
        end
        attr_reader :allowed_callers

        sig do
          params(
            allowed_callers:
              T::Array[
                Anthropic::ToolUnion::WebSearchTool20260209::AllowedCaller::OrSymbol
              ]
          ).void
        end
        attr_writer :allowed_callers

        # If provided, only these domains will be included in results. Cannot be used
        # alongside `blocked_domains`.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :allowed_domains

        # If provided, these domains will never appear in results. Cannot be used
        # alongside `allowed_domains`.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :blocked_domains

        # Create a cache control breakpoint at this content block.
        sig { returns(T.nilable(Anthropic::CacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash)
          ).void
        end
        attr_writer :cache_control

        # If true, tool will not be included in initial system prompt. Only loaded when
        # returned via tool_reference from tool search.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :defer_loading

        sig { params(defer_loading: T::Boolean).void }
        attr_writer :defer_loading

        # Maximum number of times the tool can be used in the API request.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_uses

        # When true, guarantees schema validation on tool names and inputs
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :strict

        sig { params(strict: T::Boolean).void }
        attr_writer :strict

        # Parameters for the user's location. Used to provide more relevant search
        # results.
        sig do
          returns(
            T.nilable(Anthropic::ToolUnion::WebSearchTool20260209::UserLocation)
          )
        end
        attr_reader :user_location

        sig do
          params(
            user_location:
              T.nilable(
                Anthropic::ToolUnion::WebSearchTool20260209::UserLocation::OrHash
              )
          ).void
        end
        attr_writer :user_location

        sig do
          params(
            allowed_callers:
              T::Array[
                Anthropic::ToolUnion::WebSearchTool20260209::AllowedCaller::OrSymbol
              ],
            allowed_domains: T.nilable(T::Array[String]),
            blocked_domains: T.nilable(T::Array[String]),
            cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
            defer_loading: T::Boolean,
            max_uses: T.nilable(Integer),
            strict: T::Boolean,
            user_location:
              T.nilable(
                Anthropic::ToolUnion::WebSearchTool20260209::UserLocation::OrHash
              ),
            name: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          allowed_callers: nil,
          # If provided, only these domains will be included in results. Cannot be used
          # alongside `blocked_domains`.
          allowed_domains: nil,
          # If provided, these domains will never appear in results. Cannot be used
          # alongside `allowed_domains`.
          blocked_domains: nil,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          # If true, tool will not be included in initial system prompt. Only loaded when
          # returned via tool_reference from tool search.
          defer_loading: nil,
          # Maximum number of times the tool can be used in the API request.
          max_uses: nil,
          # When true, guarantees schema validation on tool names and inputs
          strict: nil,
          # Parameters for the user's location. Used to provide more relevant search
          # results.
          user_location: nil,
          # Name of the tool.
          #
          # This is how the tool will be called by the model and in `tool_use` blocks.
          name: :web_search,
          type: :web_search_20260209
        )
        end

        sig do
          override.returns(
            {
              name: Symbol,
              type: Symbol,
              allowed_callers:
                T::Array[
                  Anthropic::ToolUnion::WebSearchTool20260209::AllowedCaller::OrSymbol
                ],
              allowed_domains: T.nilable(T::Array[String]),
              blocked_domains: T.nilable(T::Array[String]),
              cache_control: T.nilable(Anthropic::CacheControlEphemeral),
              defer_loading: T::Boolean,
              max_uses: T.nilable(Integer),
              strict: T::Boolean,
              user_location:
                T.nilable(
                  Anthropic::ToolUnion::WebSearchTool20260209::UserLocation
                )
            }
          )
        end
        def to_hash
        end

        module AllowedCaller
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::ToolUnion::WebSearchTool20260209::AllowedCaller
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DIRECT =
            T.let(
              :direct,
              Anthropic::ToolUnion::WebSearchTool20260209::AllowedCaller::TaggedSymbol
            )
          CODE_EXECUTION_20250825 =
            T.let(
              :code_execution_20250825,
              Anthropic::ToolUnion::WebSearchTool20260209::AllowedCaller::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::ToolUnion::WebSearchTool20260209::AllowedCaller::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class UserLocation < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::ToolUnion::WebSearchTool20260209::UserLocation,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # The city of the user.
          sig { returns(T.nilable(String)) }
          attr_accessor :city

          # The two letter
          # [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the
          # user.
          sig { returns(T.nilable(String)) }
          attr_accessor :country

          # The region of the user.
          sig { returns(T.nilable(String)) }
          attr_accessor :region

          # The [IANA timezone](https://nodatime.org/TimeZones) of the user.
          sig { returns(T.nilable(String)) }
          attr_accessor :timezone

          # Parameters for the user's location. Used to provide more relevant search
          # results.
          sig do
            params(
              city: T.nilable(String),
              country: T.nilable(String),
              region: T.nilable(String),
              timezone: T.nilable(String),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The city of the user.
            city: nil,
            # The two letter
            # [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the
            # user.
            country: nil,
            # The region of the user.
            region: nil,
            # The [IANA timezone](https://nodatime.org/TimeZones) of the user.
            timezone: nil,
            type: :approximate
          )
          end

          sig do
            override.returns(
              {
                type: Symbol,
                city: T.nilable(String),
                country: T.nilable(String),
                region: T.nilable(String),
                timezone: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end
      end

      class WebFetchTool20260209 < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::ToolUnion::WebFetchTool20260209,
              Anthropic::Internal::AnyHash
            )
          end

        # Name of the tool.
        #
        # This is how the tool will be called by the model and in `tool_use` blocks.
        sig { returns(Symbol) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          returns(
            T.nilable(
              T::Array[
                Anthropic::ToolUnion::WebFetchTool20260209::AllowedCaller::OrSymbol
              ]
            )
          )
        end
        attr_reader :allowed_callers

        sig do
          params(
            allowed_callers:
              T::Array[
                Anthropic::ToolUnion::WebFetchTool20260209::AllowedCaller::OrSymbol
              ]
          ).void
        end
        attr_writer :allowed_callers

        # List of domains to allow fetching from
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :allowed_domains

        # List of domains to block fetching from
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :blocked_domains

        # Create a cache control breakpoint at this content block.
        sig { returns(T.nilable(Anthropic::CacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash)
          ).void
        end
        attr_writer :cache_control

        # Citations configuration for fetched documents. Citations are disabled by
        # default.
        sig { returns(T.nilable(Anthropic::CitationsConfigParam)) }
        attr_reader :citations

        sig do
          params(
            citations: T.nilable(Anthropic::CitationsConfigParam::OrHash)
          ).void
        end
        attr_writer :citations

        # If true, tool will not be included in initial system prompt. Only loaded when
        # returned via tool_reference from tool search.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :defer_loading

        sig { params(defer_loading: T::Boolean).void }
        attr_writer :defer_loading

        # Maximum number of tokens used by including web page text content in the context.
        # The limit is approximate and does not apply to binary content such as PDFs.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_content_tokens

        # Maximum number of times the tool can be used in the API request.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_uses

        # When true, guarantees schema validation on tool names and inputs
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :strict

        sig { params(strict: T::Boolean).void }
        attr_writer :strict

        sig do
          params(
            allowed_callers:
              T::Array[
                Anthropic::ToolUnion::WebFetchTool20260209::AllowedCaller::OrSymbol
              ],
            allowed_domains: T.nilable(T::Array[String]),
            blocked_domains: T.nilable(T::Array[String]),
            cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
            citations: T.nilable(Anthropic::CitationsConfigParam::OrHash),
            defer_loading: T::Boolean,
            max_content_tokens: T.nilable(Integer),
            max_uses: T.nilable(Integer),
            strict: T::Boolean,
            name: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          allowed_callers: nil,
          # List of domains to allow fetching from
          allowed_domains: nil,
          # List of domains to block fetching from
          blocked_domains: nil,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          # Citations configuration for fetched documents. Citations are disabled by
          # default.
          citations: nil,
          # If true, tool will not be included in initial system prompt. Only loaded when
          # returned via tool_reference from tool search.
          defer_loading: nil,
          # Maximum number of tokens used by including web page text content in the context.
          # The limit is approximate and does not apply to binary content such as PDFs.
          max_content_tokens: nil,
          # Maximum number of times the tool can be used in the API request.
          max_uses: nil,
          # When true, guarantees schema validation on tool names and inputs
          strict: nil,
          # Name of the tool.
          #
          # This is how the tool will be called by the model and in `tool_use` blocks.
          name: :web_fetch,
          type: :web_fetch_20260209
        )
        end

        sig do
          override.returns(
            {
              name: Symbol,
              type: Symbol,
              allowed_callers:
                T::Array[
                  Anthropic::ToolUnion::WebFetchTool20260209::AllowedCaller::OrSymbol
                ],
              allowed_domains: T.nilable(T::Array[String]),
              blocked_domains: T.nilable(T::Array[String]),
              cache_control: T.nilable(Anthropic::CacheControlEphemeral),
              citations: T.nilable(Anthropic::CitationsConfigParam),
              defer_loading: T::Boolean,
              max_content_tokens: T.nilable(Integer),
              max_uses: T.nilable(Integer),
              strict: T::Boolean
            }
          )
        end
        def to_hash
        end

        module AllowedCaller
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::ToolUnion::WebFetchTool20260209::AllowedCaller
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DIRECT =
            T.let(
              :direct,
              Anthropic::ToolUnion::WebFetchTool20260209::AllowedCaller::TaggedSymbol
            )
          CODE_EXECUTION_20250825 =
            T.let(
              :code_execution_20250825,
              Anthropic::ToolUnion::WebFetchTool20260209::AllowedCaller::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::ToolUnion::WebFetchTool20260209::AllowedCaller::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      sig { override.returns(T::Array[Anthropic::ToolUnion::Variants]) }
      def self.variants
      end
    end
  end
end
