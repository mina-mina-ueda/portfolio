# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, "モデルに関するテスト", type: :model do

  context "空白のバリデーションチェック" do
	  it "titleが空白の場合にバリデーションチェックされ保存できない" do
      event = Event.new(title: nil, body: '', period: '')
	    expect(event).to be_invalid
	  end
	  it "bodyが空白の場合にバリデーションチェックされ保存できない" do
      event = Event.new(title: '', body: nil, period: '')
	    expect(event).to be_invalid
	  end
	  it "categoryが空白の場合にバリデーションチェックされ保存できない" do
	  	event = Event.new(title: '', body: '', period: nil)
	    expect(event).to be_invalid
	  end
	end
end