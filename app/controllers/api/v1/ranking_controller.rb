class Api::V1::RankingController < ApplicationController
  def actual
    @ranking = Ranking::ListUpdatedRanking.call(params:)
  end

  def ranking_by_date
    @ranking = Ranking::ListUpdatedRanking.call(params:)
  end

  def record
    @kilometer = Kilometer.where('user_id = ?', params[:user_id]).order('created_at DESC').limit(1)[0]
    return json_response({ error: 'Not found' }) unless @kilometer

    @kilometer.update_column(:amount, @kilometer.amount + params[:amount])
  end

  def create
    new_kilometer = Kilometer.new(groups_params)
    return unless new_kilometer.save
  end

  private

  def ranking_params
    params.require(:amount, :start_date, :finish_date, :user_id).permit(:page, :year, :month)
  end
end
