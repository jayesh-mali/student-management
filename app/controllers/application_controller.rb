class ApplicationController < ActionController::API
    include ExceptionHandler
    include Pundit

    before_action :authenticate_request
    attr_reader :current_user    
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    
    private

    def authenticate_request
        @current_user = AuthorizeApiRequest.call(request.headers).result
        render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end

    def user_not_authorized
        render :json => {:errors => ["You are not authorized to perform this action."]}, :status => :forbidden
    end
  
end
