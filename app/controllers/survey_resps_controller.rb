class SurveyRespsController < ApplicationController

  def index
    if params[:question]
      @resps = SurveyResp.where(question: params[:question])
    else
      @resps = SurveyResp.all
    end
    @emails = Email.all
  end
end
