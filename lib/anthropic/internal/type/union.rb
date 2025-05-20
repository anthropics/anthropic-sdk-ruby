# frozen_string_literal: true

module Anthropic
  module Internal
    module Type
      # @api private
      #
      # @example
      #   # `raw_message_stream_event` is a `Anthropic::RawMessageStreamEvent`
      #   case raw_message_stream_event
      #   when Anthropic::RawMessageStartEvent
      #     puts(raw_message_stream_event.message)
      #   when Anthropic::RawMessageDeltaEvent
      #     puts(raw_message_stream_event.delta)
      #   when Anthropic::RawMessageStopEvent
      #     puts(raw_message_stream_event.type)
      #   else
      #     puts(raw_message_stream_event)
      #   end
      #
      # @example
      #   case raw_message_stream_event
      #   in {type: :message_start, message: message}
      #     puts(message)
      #   in {type: :message_delta, delta: delta, usage: usage}
      #     puts(delta)
      #   in {type: :message_stop}
      #     # ...
      #   else
      #     puts(raw_message_stream_event)
      #   end
      module Union
        include Anthropic::Internal::Type::Converter
        include Anthropic::Internal::Util::SorbetRuntimeSupport

        # @api private
        #
        # All of the specified variant info for this union.
        #
        # @return [Array<Array(Symbol, Proc)>]
        private def known_variants = (@known_variants ||= [])

        # @api private
        #
        # @return [Array<Array(Symbol, Object)>]
        protected def derefed_variants
          known_variants.map { |key, variant_fn| [key, variant_fn.call] }
        end

        # All of the specified variants for this union.
        #
        # @return [Array<Object>]
        def variants = derefed_variants.map(&:last)

        # @api private
        #
        # @param property [Symbol]
        private def discriminator(property)
          case property
          in Symbol
            @discriminator = property
          end
        end

        # @api private
        #
        # @param key [Symbol, Hash{Symbol=>Object}, Proc, Anthropic::Internal::Type::Converter, Class]
        #
        # @param spec [Hash{Symbol=>Object}, Proc, Anthropic::Internal::Type::Converter, Class] .
        #
        #   @option spec [NilClass, TrueClass, FalseClass, Integer, Float, Symbol] :const
        #
        #   @option spec [Proc] :enum
        #
        #   @option spec [Proc] :union
        #
        #   @option spec [Boolean] :"nil?"
        private def variant(key, spec = nil)
          variant_info =
            case key
            in Symbol
              [key, Anthropic::Internal::Type::Converter.type_info(spec)]
            in Proc | Anthropic::Internal::Type::Converter | Class | Hash
              [nil, Anthropic::Internal::Type::Converter.type_info(key)]
            end

          known_variants << variant_info
        end

        # @api private
        #
        # @param value [Object]
        #
        # @return [Anthropic::Internal::Type::Converter, Class, nil]
        private def resolve_variant(value)
          case [@discriminator, value]
          in [_, Anthropic::Internal::Type::BaseModel]
            value.class
          in [Symbol, Hash]
            key = value.fetch(@discriminator) do
              value.fetch(@discriminator.to_s, Anthropic::Internal::OMIT)
            end

            return nil if key == Anthropic::Internal::OMIT

            key = key.to_sym if key.is_a?(String)
            known_variants.find { |k,| k == key }&.last&.call
          else
            nil
          end
        end

        # rubocop:disable Style/HashEachMethods
        # rubocop:disable Style/CaseEquality

        # @api public
        #
        # @param other [Object]
        #
        # @return [Boolean]
        def ===(other)
          known_variants.any? do |_, variant_fn|
            variant_fn.call === other
          end
        end

        # @api public
        #
        # @param other [Object]
        #
        # @return [Boolean]
        def ==(other)
          Anthropic::Internal::Type::Union === other && other.derefed_variants == derefed_variants
        end

        # @api public
        #
        # @return [Integer]
        def hash = variants.hash

        # @api private
        #
        # @param value [Object]
        #
        # @param state [Hash{Symbol=>Object}] .
        #
        #   @option state [Boolean, :strong] :strictness
        #
        #   @option state [Hash{Symbol=>Object}] :exactness
        #
        #   @option state [Integer] :branched
        #
        # @return [Object]
        def coerce(value, state:)
          if (target = resolve_variant(value))
            return Anthropic::Internal::Type::Converter.coerce(target, value, state: state)
          end

          strictness = state.fetch(:strictness)
          exactness = state.fetch(:exactness)
          state[:strictness] = strictness == :strong ? true : strictness

          alternatives = []
          known_variants.each do |_, variant_fn|
            target = variant_fn.call
            exact = state[:exactness] = {yes: 0, no: 0, maybe: 0}
            state[:branched] += 1

            coerced = Anthropic::Internal::Type::Converter.coerce(target, value, state: state)
            yes, no, maybe = exact.values
            if (no + maybe).zero? || (!strictness && yes.positive?)
              exact.each { exactness[_1] += _2 }
              state[:exactness] = exactness
              return coerced
            elsif maybe.positive?
              alternatives << [[-yes, -maybe, no], exact, coerced]
            end
          end

          case alternatives.sort_by(&:first)
          in []
            exactness[:no] += 1
            if strictness == :strong
              message = "no possible conversion of #{value.class} into a variant of #{target.inspect}"
              raise ArgumentError.new(message)
            end
            value
          in [[_, exact, coerced], *]
            exact.each { exactness[_1] += _2 }
            coerced
          end
            .tap { state[:exactness] = exactness }
        ensure
          state[:strictness] = strictness
        end

        # @api private
        #
        # @param value [Object]
        #
        # @param state [Hash{Symbol=>Object}] .
        #
        #   @option state [Boolean] :can_retry
        #
        # @return [Object]
        def dump(value, state:)
          if (target = resolve_variant(value))
            return Anthropic::Internal::Type::Converter.dump(target, value, state: state)
          end

          known_variants.each do
            target = _2.call
            return Anthropic::Internal::Type::Converter.dump(target, value, state: state) if target === value
          end

          super
        end

        # @api private
        #
        # @return [Object]
        def to_sorbet_type
          case (v = variants)
          in []
            T.noreturn
          else
            T.any(*v.map { Anthropic::Internal::Util::SorbetRuntimeSupport.to_sorbet_type(_1) })
          end
        end

        # rubocop:enable Style/CaseEquality
        # rubocop:enable Style/HashEachMethods

        # @api private
        #
        # @param depth [Integer]
        #
        # @return [String]
        def inspect(depth: 0)
          if depth.positive?
            return is_a?(Module) ? super() : self.class.name
          end

          members = variants.map { Anthropic::Internal::Type::Converter.inspect(_1, depth: depth.succ) }
          prefix = is_a?(Module) ? name : self.class.name

          "#{prefix}[#{members.join(' | ')}]"
        end
      end
    end
  end
end
