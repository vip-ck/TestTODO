require 'rails_helper'

RSpec.describe AboutController, type: :controller do
  describe 'GET index' do
    it 'возвращает успешный ответ' do
      get :index
      expect(response.code).to eq('200')
    end
  end
end