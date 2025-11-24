# typed: strong

module Anthropic
  module Models
    BetaToolComputerUse20241022 = Beta::BetaToolComputerUse20241022

    module Beta
      class BetaToolComputerUse20241022 < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolComputerUse20241022,
              Anthropic::Internal::AnyHash
            )
          end

        # The height of the display in pixels.
        sig { returns(Integer) }
        attr_accessor :display_height_px

        # The width of the display in pixels.
        sig { returns(Integer) }
        attr_accessor :display_width_px

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
                Anthropic::Beta::BetaToolComputerUse20241022::AllowedCaller::OrSymbol
              ]
            )
          )
        end
        attr_reader :allowed_callers

        sig do
          params(
            allowed_callers:
              T::Array[
                Anthropic::Beta::BetaToolComputerUse20241022::AllowedCaller::OrSymbol
              ]
          ).void
        end
        attr_writer :allowed_callers

        # Create a cache control breakpoint at this content block.
        sig { returns(T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash)
          ).void
        end
        attr_writer :cache_control

        # If true, tool will not be included in initial system prompt. Only loaded when
        # returned via tool_reference from tool search.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :defer_loading

        sig { params(defer_loading: T::Boolean).void }
        attr_writer :defer_loading

        # The X11 display number (e.g. 0, 1) for the display.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :display_number

        sig { returns(T.nilable(T::Array[T::Hash[Symbol, T.anything]])) }
        attr_reader :input_examples

        sig do
          params(input_examples: T::Array[T::Hash[Symbol, T.anything]]).void
        end
        attr_writer :input_examples

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :strict

        sig { params(strict: T::Boolean).void }
        attr_writer :strict

        sig do
          params(
            display_height_px: Integer,
            display_width_px: Integer,
            allowed_callers:
              T::Array[
                Anthropic::Beta::BetaToolComputerUse20241022::AllowedCaller::OrSymbol
              ],
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            defer_loading: T::Boolean,
            display_number: T.nilable(Integer),
            input_examples: T::Array[T::Hash[Symbol, T.anything]],
            strict: T::Boolean,
            name: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The height of the display in pixels.
          display_height_px:,
          # The width of the display in pixels.
          display_width_px:,
          allowed_callers: nil,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          # If true, tool will not be included in initial system prompt. Only loaded when
          # returned via tool_reference from tool search.
          defer_loading: nil,
          # The X11 display number (e.g. 0, 1) for the display.
          display_number: nil,
          input_examples: nil,
          strict: nil,
          # Name of the tool.
          #
          # This is how the tool will be called by the model and in `tool_use` blocks.
          name: :computer,
          type: :computer_20241022
        )
        end

        sig do
          override.returns(
            {
              display_height_px: Integer,
              display_width_px: Integer,
              name: Symbol,
              type: Symbol,
              allowed_callers:
                T::Array[
                  Anthropic::Beta::BetaToolComputerUse20241022::AllowedCaller::OrSymbol
                ],
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              defer_loading: T::Boolean,
              display_number: T.nilable(Integer),
              input_examples: T::Array[T::Hash[Symbol, T.anything]],
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
                Anthropic::Beta::BetaToolComputerUse20241022::AllowedCaller
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DIRECT =
            T.let(
              :direct,
              Anthropic::Beta::BetaToolComputerUse20241022::AllowedCaller::TaggedSymbol
            )
          CODE_EXECUTION_20250825 =
            T.let(
              :code_execution_20250825,
              Anthropic::Beta::BetaToolComputerUse20241022::AllowedCaller::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaToolComputerUse20241022::AllowedCaller::TaggedSymbol
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
