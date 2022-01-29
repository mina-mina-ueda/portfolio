# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, "モデルに関するテスト", type: :model do

  context "空白のバリデーションチェック" do
  	it "nicknameが空白の場合にバリデーションチェックされエラーが出る" do
      customer = Customer.new(nickname: nil)
  	  expect(customer).to be_invalid
  	  expect(customer.errors[:nickname]).to include("を入力してください")
    end
    it "ageが空白の場合にバリデーションチェックされエラーが出る" do
      customer = Customer.new(age: nil)
  	  expect(customer).to be_invalid
  	  expect(customer.errors[:age]).to include("を入力してください")
    end
    it "genderが空白の場合にバリデーションチェックされエラーが出る" do
      customer = Customer.new(gender: nil)
  	  expect(customer).to be_invalid
  	  expect(customer.errors[:gender]).to include("を入力してください")
    end
    it "genderが空白の場合にバリデーションチェックされエラーが出る" do
      customer = Customer.new(work: nil)
  	  expect(customer).to be_invalid
  	  expect(customer.errors[:work]).to include("を入力してください")
    end
    it "accessが空白の場合にバリデーションチェックされエラーが出る" do
      customer = Customer.new(access: nil)
  	  expect(customer).to be_invalid
  	  expect(customer.errors[:access]).to include("を入力してください")
    end
  end
end
