class MessagesController < ApplicationController

  def index
    render json: data
  end

  def create
    Message.create(message_params)
    render json: data
  end

  private

  def data
    Message.select(:name, :text).as_json
  end

  def message_params
    params.permit(:text, :name)
  end

end
