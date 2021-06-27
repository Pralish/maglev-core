# frozen_string_literal: true

module Maglev
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

    helper_method :services, :use_engine_webpacker?

    private

    def services
      @services ||= ::Maglev.services(
        context: ServiceContext.new(
          rendering_mode: rendering_mode,
          controller: self
        )
      )
    end

    def model_scopes(name)
      services.get_model_scopes.call[name]
    end

    def rendering_mode
      :live
    end

    def use_engine_webpacker?
      true
    end
  end
end