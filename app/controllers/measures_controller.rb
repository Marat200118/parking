class MeasuresController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    Measure.create!(
      device:   params[:device],
      angle:    params[:angle].to_i,
      distance: params[:distance].to_i,
      available: ActiveModel::Type::Boolean.new.cast(params[:available])
    )

    head :no_content
  end
end
