# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, "モデルに関するテスト", type: :model do

  context "空白のバリデーションチェック" do
	  it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
	    post = Post.new(title: 'hoge', body: '', category: '')
	    expect(post).to be_invalid
	    expect(post.errors[:post]).to be_invalid("can't be blank")
	  end
	  it "bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
	    post = Post.new(title: '', body: 'body', category: '')
	    expect(post).to be_invalid
	    expect(post.errors[:body]).to be_invalid("can't be blank")
	  end
	  it "categoryが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
	    post = Post.new(title: '', body: '', category: 'hoge')
	    expect(post).to be_invalid
	    expect(post.errors[:category]).to be_invalid("can't be blank")
	  end
	end
end