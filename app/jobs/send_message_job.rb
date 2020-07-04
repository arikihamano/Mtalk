class SendMessageJob < ApplicationJob
  queue_as :default

  require "pry"

  def perform(message)
    mine = ApplicationController.render_with_signed_in_user(
      message.user,
      partial: 'messages/mine',
      locals: { message: message }
    )

    theirs = ApplicationController.render_with_signed_in_user(
      message.user,
      partial: 'messages/theirs',
      locals: { message: message }
    )

    ActionCable.server.broadcast "room_channel_#{message.room_id}", mine: mine, theirs: theirs, message: message
  end
end

