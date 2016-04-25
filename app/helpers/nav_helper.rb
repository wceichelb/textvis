module NavHelper
  # def response_emails_enum
  #   list = []
  #   Response.all.each do |resp|
  #     list << resp.email
  #   end
  #   list.uniq
  # end

  def resp_type_enum
    list = []
    SurveyResp.all.each do |resp|
      list << resp.question
    end
    list.uniq
  end
end

