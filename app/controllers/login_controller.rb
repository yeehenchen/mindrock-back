class LoginController < ApplicationController
  skip_before_action :verify_authenticity_token

  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze

  def login

    @user = User.find_or_create_by(open_id: wechat_user.fetch("openid"))

    render json: {
      userId: @user.id
    }
  end

  def wechat_params
    {
      appid: ENV["appId"],
      secret: ENV["appSecret"],
      js_code: params[:code],
      grant_type: "authorization_code"
    }
  end

  def wechat_user
    @wechat_response ||= RestClient.post(URL, wechat_params)
    @wechat_user ||= JSON.parse(@wechat_response.body)
  end
end
