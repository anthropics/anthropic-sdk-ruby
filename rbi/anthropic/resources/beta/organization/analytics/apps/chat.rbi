# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Analytics
          class Apps
            class Chat
              sig do
                returns(
                  Anthropic::Resources::Beta::Organization::Analytics::Apps::Chat::Projects
                )
              end
              attr_reader :projects

              # @api private
              sig do
                params(client: Anthropic::Client).returns(T.attached_class)
              end
              def self.new(client:)
              end
            end
          end
        end
      end
    end
  end
end
