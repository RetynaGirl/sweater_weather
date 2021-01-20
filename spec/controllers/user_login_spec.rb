require 'rails_helper'

describe Api::V1::SessionsController, type: :controller do
  it 'user logs in' do
    user = User.create({
                         email: 'whatever@example.com',
                         password: 'password',
                         password_confirmation: 'password',
                         api_key: 'abcdefghij'
                       })

    login_content = {
      email: 'whatever@example.com',
      password: 'password'
    }

    post :create, params: login_content

    output = JSON.parse(response.body, symbolize_names: true)

    expect(output[:data]).to be_a Hash
    expect(output[:data][:type]).to eq 'users'
    expect(output[:data][:id]).to be_a String
    expect(output[:data][:attributes]).to be_a Hash
    expect(output[:data][:attributes][:email]).to be_a String
    expect(output[:data][:attributes][:api_key]).to be_a String

    expect(output[:data][:attributes][:password_digest]).to eq nil
  end

  it 'bad email' do
    login_content = {
      email: 'whatever@example.com',
      password: 'password'
    }

    post :create, params: login_content

    output = JSON.parse(response.body, symbolize_names: true)

    expect(output[:data]).to eq nil
    expect(output[:error]).to eq 'Bad credentials'
    expect(response.status).to eq 400
  end

  it 'bad password' do
    user = User.create({
                         email: 'whatever@example.com',
                         password: 'password',
                         password_confirmation: 'password',
                         api_key: 'abcdefghij'
                       })

    login_content = {
      email: 'whatever@example.com',
      password: 'not my password'
    }

    post :create, params: login_content

    output = JSON.parse(response.body, symbolize_names: true)

    expect(output[:data]).to eq nil
    expect(output[:error]).to eq 'Bad credentials'
    expect(response.status).to eq 400

  end
end
