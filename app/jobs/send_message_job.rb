class SendMessageJob < ApplicationJob
  queue_as :default

  require "pry"

  def perform(message)

    html = ApplicationController.render_with_signed_in_user(
      message.user,
      partial: 'messages/theirs',
      locals: { message: message }
    )

    ActionCable.server.broadcast "room_channel_#{message.room_id}", html: html, message: message
  end
end

