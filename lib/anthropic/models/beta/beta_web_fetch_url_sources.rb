# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebFetchURLSources < Anthropic::Internal::Type::BaseModel
        # @!attribute client_tool_results
        #   Which client tools' results contribute fetchable URLs: "all", "none", or an only
        #   or except list of client tool names from tools[].
        #
        #   @return [Anthropic::Models::Beta::BetaWebFetchURLSourceAll, Anthropic::Models::Beta::BetaWebFetchURLSourceNone, Anthropic::Models::Beta::BetaWebFetchURLSourceOnly, Anthropic::Models::Beta::BetaWebFetchURLSourceExcept, nil]
        optional :client_tool_results, union: -> { Anthropic::Beta::BetaWebFetchURLSources::ClientToolResults }

        # @!attribute server_tool_results
        #   Which server tools' results contribute fetchable URLs: "all", "none", or an only
        #   or except list of server tool names from tools[]; only web_search and web_fetch
        #   results ever contribute.
        #
        #   @return [Anthropic::Models::Beta::BetaWebFetchURLSourceAll, Anthropic::Models::Beta::BetaWebFetchURLSourceNone, Anthropic::Models::Beta::BetaWebFetchURLSourceOnly, Anthropic::Models::Beta::BetaWebFetchURLSourceExcept, nil]
        optional :server_tool_results, union: -> { Anthropic::Beta::BetaWebFetchURLSources::ServerToolResults }

        # @!attribute user_input
        #   Whether URLs in user messages are fetchable: "all" or "none".
        #
        #   @return [Anthropic::Models::Beta::BetaWebFetchURLSourceAll, Anthropic::Models::Beta::BetaWebFetchURLSourceNone, nil]
        optional :user_input, union: -> { Anthropic::Beta::BetaWebFetchURLSources::UserInput }

        # @!method initialize(client_tool_results: nil, server_tool_results: nil, user_input: nil)
        #   Which sources contribute to the set of URLs web fetch may fetch.
        #
        #   Each key is a tagged variant: `user_input` is `all` or `none`; the two tool
        #   filters are `all`, `none`, `only` (only the named tools' results) or `except`
        #   (every result but the named tools'). A named tool must be declared in this
        #   request's `tools[]`.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaWebFetchURLSources} for more details.
        #
        #   @param client_tool_results [Anthropic::Models::Beta::BetaWebFetchURLSourceAll, Anthropic::Models::Beta::BetaWebFetchURLSourceNone, Anthropic::Models::Beta::BetaWebFetchURLSourceOnly, Anthropic::Models::Beta::BetaWebFetchURLSourceExcept] Which client tools' results contribute fetchable URLs: "all", "none", or an only
        #
        #   @param server_tool_results [Anthropic::Models::Beta::BetaWebFetchURLSourceAll, Anthropic::Models::Beta::BetaWebFetchURLSourceNone, Anthropic::Models::Beta::BetaWebFetchURLSourceOnly, Anthropic::Models::Beta::BetaWebFetchURLSourceExcept] Which server tools' results contribute fetchable URLs: "all", "none", or an only
        #
        #   @param user_input [Anthropic::Models::Beta::BetaWebFetchURLSourceAll, Anthropic::Models::Beta::BetaWebFetchURLSourceNone] Whether URLs in user messages are fetchable: "all" or "none".

        # Which client tools' results contribute fetchable URLs: "all", "none", or an only
        # or except list of client tool names from tools[].
        #
        # @see Anthropic::Models::Beta::BetaWebFetchURLSources#client_tool_results
        module ClientToolResults
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # The ``url_sources`` variant under which a source contributes in
          # full: every result of the tool filter's source, or all user input.
          variant :all, -> { Anthropic::Beta::BetaWebFetchURLSourceAll }

          # The ``url_sources`` variant under which a source contributes nothing:
          # no result of the tool filter's source, or no user input.
          variant :none, -> { Anthropic::Beta::BetaWebFetchURLSourceNone }

          # The tool filter variant under which only the named tools' results
          # contribute.
          variant :only, -> { Anthropic::Beta::BetaWebFetchURLSourceOnly }

          # The tool filter variant under which every result but the named
          # tools' contributes.
          variant :except, -> { Anthropic::Beta::BetaWebFetchURLSourceExcept }

          module Type
            extend Anthropic::Internal::Type::Enum

            ALL = :all
            NONE = :none
            ONLY = :only
            EXCEPT = :except

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaWebFetchURLSourceAll, Anthropic::Models::Beta::BetaWebFetchURLSourceNone, Anthropic::Models::Beta::BetaWebFetchURLSourceOnly, Anthropic::Models::Beta::BetaWebFetchURLSourceExcept)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Array<Anthropic::Models::Beta::BetaWebFetchURLSourceToolReference>] :tools
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaWebFetchURLSourceAll, Anthropic::Models::Beta::BetaWebFetchURLSourceNone, Anthropic::Models::Beta::BetaWebFetchURLSourceOnly, Anthropic::Models::Beta::BetaWebFetchURLSourceExcept]
          def self.new(type:, **args)
            case type.to_sym
            when :all
              Anthropic::Beta::BetaWebFetchURLSourceAll.new(**args)
            when :none
              Anthropic::Beta::BetaWebFetchURLSourceNone.new(**args)
            when :only
              Anthropic::Beta::BetaWebFetchURLSourceOnly.new(**args)
            when :except
              Anthropic::Beta::BetaWebFetchURLSourceExcept.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end

        # Which server tools' results contribute fetchable URLs: "all", "none", or an only
        # or except list of server tool names from tools[]; only web_search and web_fetch
        # results ever contribute.
        #
        # @see Anthropic::Models::Beta::BetaWebFetchURLSources#server_tool_results
        module ServerToolResults
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # The ``url_sources`` variant under which a source contributes in
          # full: every result of the tool filter's source, or all user input.
          variant :all, -> { Anthropic::Beta::BetaWebFetchURLSourceAll }

          # The ``url_sources`` variant under which a source contributes nothing:
          # no result of the tool filter's source, or no user input.
          variant :none, -> { Anthropic::Beta::BetaWebFetchURLSourceNone }

          # The tool filter variant under which only the named tools' results
          # contribute.
          variant :only, -> { Anthropic::Beta::BetaWebFetchURLSourceOnly }

          # The tool filter variant under which every result but the named
          # tools' contributes.
          variant :except, -> { Anthropic::Beta::BetaWebFetchURLSourceExcept }

          module Type
            extend Anthropic::Internal::Type::Enum

            ALL = :all
            NONE = :none
            ONLY = :only
            EXCEPT = :except

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaWebFetchURLSourceAll, Anthropic::Models::Beta::BetaWebFetchURLSourceNone, Anthropic::Models::Beta::BetaWebFetchURLSourceOnly, Anthropic::Models::Beta::BetaWebFetchURLSourceExcept)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Array<Anthropic::Models::Beta::BetaWebFetchURLSourceToolReference>] :tools
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaWebFetchURLSourceAll, Anthropic::Models::Beta::BetaWebFetchURLSourceNone, Anthropic::Models::Beta::BetaWebFetchURLSourceOnly, Anthropic::Models::Beta::BetaWebFetchURLSourceExcept]
          def self.new(type:, **args)
            case type.to_sym
            when :all
              Anthropic::Beta::BetaWebFetchURLSourceAll.new(**args)
            when :none
              Anthropic::Beta::BetaWebFetchURLSourceNone.new(**args)
            when :only
              Anthropic::Beta::BetaWebFetchURLSourceOnly.new(**args)
            when :except
              Anthropic::Beta::BetaWebFetchURLSourceExcept.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end

        # Whether URLs in user messages are fetchable: "all" or "none".
        #
        # @see Anthropic::Models::Beta::BetaWebFetchURLSources#user_input
        module UserInput
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # The ``url_sources`` variant under which a source contributes in
          # full: every result of the tool filter's source, or all user input.
          variant :all, -> { Anthropic::Beta::BetaWebFetchURLSourceAll }

          # The ``url_sources`` variant under which a source contributes nothing:
          # no result of the tool filter's source, or no user input.
          variant :none, -> { Anthropic::Beta::BetaWebFetchURLSourceNone }

          module Type
            extend Anthropic::Internal::Type::Enum

            ALL = :all
            NONE = :none

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaWebFetchURLSourceAll, Anthropic::Models::Beta::BetaWebFetchURLSourceNone)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaWebFetchURLSourceAll, Anthropic::Models::Beta::BetaWebFetchURLSourceNone]
          def self.new(type:, **args)
            case type.to_sym
            when :all
              Anthropic::Beta::BetaWebFetchURLSourceAll.new(**args)
            when :none
              Anthropic::Beta::BetaWebFetchURLSourceNone.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end

    BetaWebFetchURLSources = Beta::BetaWebFetchURLSources
  end
end
