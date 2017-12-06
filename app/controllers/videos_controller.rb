class VideosController < ApplicationController
	before_action :authenticate_user!

  def stream
     @streams = Stream.all
    @stream     = current_user.stream || current_user.create_stream
    gon.opentok = opentok_data(@stream)
    @presription = Presription.new
    @history = History.new
  end

  def show_presription
    @presriptions = Presription.where(user_email: current_user.email)
  end

  def watch
    @stream = User.find(params[:id]).stream
    gon.opentok = opentok_data(@stream)
  end

  def call
    @appointment = Appointment.find(params[:id])
    @presription = Presription.new
    @history = History.new
  end
  
  private

  def opentok_data(stream)
    token = OpenTokClient.generate_token(stream.opentok_session_id)
    { sessionId: stream.opentok_session_id, apiKey: Figaro.env.opentok_api_key, token: token }
  end
end
