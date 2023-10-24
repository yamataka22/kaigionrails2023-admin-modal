module ApplicationHelper
  def turbo_frame_request?
    request.headers["Turbo-Frame"].present?
  end

  def render_turbo_stream_flash_messages
    turbo_stream.update "flash", partial: "flash"
  end
end
