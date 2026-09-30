# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Analytics
          class Apps
            sig do
              returns(
                Anthropic::Resources::Beta::Organization::Analytics::Apps::Chat
              )
            end
            attr_reader :chat

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
