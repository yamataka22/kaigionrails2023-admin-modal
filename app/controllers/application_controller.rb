class ApplicationController < ActionController::Base
  before_action :set_turbo_path

  private

  def set_turbo_path
    @turbo_path ||= request.fullpath if turbo_frame_request? && request.get?
  end
end
