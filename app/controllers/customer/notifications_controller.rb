class Customer::NotificationsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @notifications = current_customer.passive_notifications.page(params[:page]).per(8)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    redirect_to notifications_path
  end

  def destroy_all
    @notifications = current_customer.passive_notifications
    @notifications.destroy_all
    redirect_to notifications_path
  end
end
