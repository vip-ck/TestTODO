
RSpec.describe Events, type: :api do
  before { create(:event) }

  describe 'GET /api/events' do
    it 'успешно отвечает' do
      get '/api/events'
    expect(call_api.status).to eq(200)
    end
    it 'содержит единственное событие' do
      get '/api/events'
      expect(JSON.parse(call_api.body)['events'].count).to eq(1)
      end
  end
end