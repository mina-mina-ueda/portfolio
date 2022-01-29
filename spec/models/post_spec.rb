# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, "モデルに関するテスト", type: :model do

  context "空白のバリデーションチェック" do
	  it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
	    post = Post.new(title: nil, body: '', category: '')
	    expect(post).to be_invalid
	    expect(post.errors[:title]).to include("を入力してください")
	  end

	  it "bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
	    post = Post.new(title: '', body: nil, category: '')
	    expect(post).to be_invalid
	    expect(post.errors[:body]).to include("を入力してください")
	  end

	  it "categoryが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
	    post = Post.new(title: '', body: '', category: nil)
	    expect(post).to be_invalid
	    expect(post.errors[:category]).to include("を入力してください")
	  end
	end
end