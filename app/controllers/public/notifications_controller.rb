class Public::NotificationsController < ApplicationController
   before_action :authenticate_poster!
  def index
    @notifications = current_poster.passive_notifications
   @notifications.where(checked: false).each do |notification|
   notification.update(checked: true)
   end
  end
end
