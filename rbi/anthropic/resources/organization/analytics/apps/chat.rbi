# typed: strong

module Anthropic
  module Resources
    class Organization
      class Analytics
        class Apps
          class Chat
            sig do
              returns(
                Anthropic::Resources::Organization::Analytics::Apps::Chat::Projects
              )
            end
            attr_reader :projects

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
