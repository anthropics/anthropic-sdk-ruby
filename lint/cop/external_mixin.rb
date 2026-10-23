# frozen_string_literal: true

module RuboCop
  module Cop
    module Custom
      # Checks for `include`, `extend` and `prepend` called on a constant. A module mixed into a class from
      # outside is invisible in the file that defines the class, so change the class there instead.
      #
      # @example
      #   # bad
      #   Client.prepend(Retries)
      #
      #   # good
      #   class Client
      #     prepend Retries
      #   end
      class ExternalMixin < Base
        MSG = "Change `%<receiver>s` in the file that defines it instead of calling `%<method>s` on it."
        RESTRICT_ON_SEND = [:include, :extend, :prepend].freeze

        def on_send(node)
          return unless node.receiver&.const_type?

          add_offense(node, message: format(MSG, method: node.method_name, receiver: node.receiver.source))
        end
      end
    end
  end
end
