# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, "モデルに関するテスト", type: :model do

  context "空白のバリデーションチェック" do
	  it "titleが空白の場合にバリデーションチェックされ保存できない" do
　　  event = Event.new(title: 'hoge', body: '', period: '')
	    expect(event).to be_invalid
	  end
	  it "titleが空白の場合にバリデーションチェックされ保存できない" do
　　  event = Event.new(title: '', body: 'hoge', period: '')
	    expect(event).to be_invalid
	  end
	  it "titleが空白の場合にバリデーションチェックされ保存できない" do
　　  event = Event.new(title: '', body: '', period: 'hoge')
	    expect(event).to be_invalid
	  end
	end
end