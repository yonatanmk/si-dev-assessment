class PagesController < ApplicationController
  def home
  end

  def sms
    raise "Action sms in the UsersController is not implemented! received params #{params.to_json}"
  end
end
