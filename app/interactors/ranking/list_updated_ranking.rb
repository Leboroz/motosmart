class Ranking::ListUpdatedRanking
  include Interactor

  def call
    context.ranking = query || null
  rescue StandardError => e
    handle_errors(e.message)
  end

  private

  def query
    offset = 0
    offset = context.params[:page].to_i - 1 * 10 if context.params[:page]
    offset = 0 if offset.negative? || offset > Kilometer.count
    Kilometer.where('start_date <= CURRENT_DATE AND finish_date >= CURRENT_DATE').offset(offset).limit(10).order('amount ASC')
  end

  def handle_errors(message)
    context.message = { errors: message }
    context.status = 422
  end
end
