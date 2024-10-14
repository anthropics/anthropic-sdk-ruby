# frozen_string_literal: true

YARD::Logger.class_eval do
  log = instance_method(:log)
  define_method(:log) do |severity, message|
    return if message.start_with?("@param tag has unknown parameter name")
    log.bind(self).call(severity, message)
  end
end
