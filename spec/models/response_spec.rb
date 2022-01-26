# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Response, "モデルに関するテスト", type: :model do

  context "空白のバリデーションチェック" do
	  it "responseが空白の場合にバリデーションチェックされ保存できない" do
	    response = Response.new(post_id: '', admin_id: '', response:'hoge')
	    expect(response).to be_invalid
	  end
	end

end