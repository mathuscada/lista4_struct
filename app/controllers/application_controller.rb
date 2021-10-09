class ApplicationController < ActionController::API
    def authentication_failure
        render json: { message: "Não conseguimos efetuar seu login como admin!"}, status: :unauthorized
    end
end
