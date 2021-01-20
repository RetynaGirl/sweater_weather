require 'rails_helper'

describe Api::V1::UsersController, type: :controller do
  it 'user registration' do
    content = {
      email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'password'
    }

    post :create, params: content

    output = JSON.parse(response.body, symbolize_names: true)

    expect(output[:data]).to be_a Hash
    expect(output[:data][:type]).to eq 'users'
    expect(output[:data][:id]).to be_a String
    expect(output[:data][:attributes]).to be_a Hash
    expect(output[:data][:attributes][:email]).to be_a String
    expect(output[:data][:attributes][:api_key]).to be_a String

    expect(output[:data][:attributes][:password_digest]).to eq nil
  end

  it 'duplicate email registration' do
    content = {
      email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'password'
    }

    post :create, params: content
    post :create, params: content

    output = JSON.parse(response.body, symbolize_names: true)

    expect(output[:data]).to eq nil
    expect(output[:error]).to eq 'Email has already been taken'
  end

  # literally should never happen, but anyway
  it 'duplicate api key registration' do
    allow(SecureRandom).to receive(:urlsafe_base64).and_return('abcde', 'abcde', 'defgh')

    content = {
      email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'password'
    }

    content2 = {
      email: 'thing@example.com',
      password: 'password',
      password_confirmation: 'password'
    }

    post :create, params: content
    post :create, params: content2

    output = JSON.parse(response.body, symbolize_names: true)

    expect(output[:data]).to be_a Hash
    expect(output[:data][:type]).to eq 'users'
    expect(output[:data][:id]).to be_a String
    expect(output[:data][:attributes]).to be_a Hash
    expect(output[:data][:attributes][:email]).to be_a String
    expect(output[:data][:attributes][:api_key]).to be_a String

    expect(output[:data][:attributes][:password_digest]).to eq nil
    expect(output[:error]).to eq nil
  end
end
