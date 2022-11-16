# frozen_string_literal: true

require "hanami/routes"

module Benchmark
  class Routes < Hanami::Routes
    root { "" }

    get "/user/:id" do
      params[:id]
    end

    post "/user" do
      ""
    end
  end
end

