# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventPost, "モデルに関するテスト", type: :model do

  context "空白のバリデーションチェック" do
	  it "titleが空白の場合にバリデーションチェックされ保存できない" do
    event = EventPost.new(body: 'hoge')
	    expect(event).to be_invalid
	  end
  end
end