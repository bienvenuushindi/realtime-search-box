class SearchesController < ApplicationController
  def index
    @searches = []
    if params_exist?
      @searches = Article.search(search_params)
      SearchService.push_to_redis({ ip: request.remote_ip, value: search_params })
    end
    if turbo_frame_request?
      render partial: 'searches', locals: { searches: @searches, term: search_params }
    else
      render 'index', locals: { searches: @searches, term: '' }
    end
  end

  private

  def search_params
    params[:term].strip
  end

  def params_exist?
    params[:term].present?
  end
end
