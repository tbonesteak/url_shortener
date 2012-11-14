class UrlsController < ApplicationController
  def create
    @url = Url.new(params[:url])
    respond_to do |format|
      if @url.save
        logger.info('------saved------------')
        logger.info 'I saved'
        format.html { redirect_to @url }
      else
        logger.info('-------nooosave--------')
        logger.info 'nooo i didnt save'
        flash[:error] = 'It didnt work'
      end
    end
  end

  def show_original_page
    logger.info('-----showoriginalpage-------------')
    logger.info params
    @url = Url.find_by_short_url(params[:short_url])
    respond_to do |format|
      format.html { redirect_to @url.original_url }
    end
  end

  def new
    @url = Url.new
    @url.original_url ||= "http://"
  end

  def show
    logger.info('-----showww-------------')
    logger.info params
    @url = Url.find(params[:id])
    respond_to { |format| format.html }
  end
end