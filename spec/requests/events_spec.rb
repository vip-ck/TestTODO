RSpec.describe EventsController, type: :controller do
  let(:user) { create(:user) }
  let(:event) { create(:event) }
  let(:event_own) { create(:event, user: user) }

  before(:each) { sign_in(user) }

  it :index do
    get :index
    expect(response).to have_http_status(:success)
  end
  it :new do
    get :new
    expect(response).to have_http_status(:success)
  end
  it :edit do
    get :edit, params: { id: event_own.id }
    expect(response).to have_http_status(:success)
  end

  context 'при посещении детальной страницы' do
    it 'пользователь не может просматривать чужие события' do
      expect {
      get :show, params: { id: event.id }
      }.to raise_error(Pundit::NotAuthorizedError)
    end
    it 'пользователь может просматривать свои собственные события' do
      get :show, params: { id: event_own.id }
      expect(response).to have_http_status(:success)
    end
  end
  context 'при создании нового события' do
    it 'оно успешно создается и проиходит редирект' do
      post :create, params: { event: attributes_for(:event) }
      expect(response).to have_http_status(:redirect)
    end
    it 'количество events-записей увеличивается на 1' do
      expect {
      post :create, params: { event: attributes_for(:event) }
      }.to change { Event.count }.by 1
    end
  end
  it :edit do
    get :edit, params: { id: event_own.id }
    expect(response).to have_http_status(:success)
  end
  context 'при обновлении события' do
    it 'можно обновить свое событие' do
      post :update, params: {id: event_own.id, event: attributes_for(:event)}
      expect(response).to have_http_status(:redirect)
    end
    it 'нельзя обновить чужое событие' do
      expect {
        post :update, params: { id: event.id, event: attributes_for(:event) }
        }.to raise_error(Pundit::NotAuthorizedError)
    end
  end
  context 'при удалении события' do
    it 'можно обновить свое событие' do
      delete :destroy, params: { id: event_own.id }
      expect(response).to have_http_status(:redirect)
    end
    it 'нельзя обновить чужое событие' do
      expect {
        get :destroy, params: { id: event.id}
        }.to raise_error(Pundit::NotAuthorizedError)
    end
  end
end
