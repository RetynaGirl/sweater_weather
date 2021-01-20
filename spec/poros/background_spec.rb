require 'rails_helper'

describe Background do
  it 'exists' do
    background = Background.new({
                                  image_location: 'denver, co',
                                  image_url: 'https://images.unsplash.com/photo-1584289537662-27851fd5ab5b?crop=entropy&cs=srgb&fm=jpg&ixid=MXwxOTk5ODR8MHwxfHNlYXJjaHwxfHxkZW52ZXIsY298ZW58MXwwfHw&ixlib=rb-1.2.1&q=85',
                                  image_credit_source: 'https://unsplash.com/@alexblock',
                                  image_credit_author: 'alexblock',
                                  logo: 'https://unsplash.com/assets/core/logo-black-df2168ed0c378fa5506b1816e75eb379d06cfcd0af01e07a2eb813ae9b5d7405.svg'
                                })

    expect(background).to be_a Background
    expect(background.image_credit_author).to eq 'alexblock'
  end
end
