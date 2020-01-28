module ExceptionHandler
  extend ActiveSupport::Concern

  class CustomError < StandardError
    delegate_missing_to :@config
    delegate :message, to: :@config

    def initialize(**options)
      @config = options.is_a?(Hash) ? OpenStruct.new(options) : options
    end
  end

  included do
    rescue_from ExceptionHandler::CustomError do |exception|
      render json: { error: exception.message }, status: exception.code
    end
  end
end
