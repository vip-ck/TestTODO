# frozen_string_literal: true

RSpec.describe Event, type: :model do
  subject { build(:event) }

  context 'в невалидном состоянии' do
    let(:event) { build(:event_wrong) }

    it 'когда пустое название' do
      expect(event.validate).to be_falsey
      error_message = 'Название обязательно для заполнения'
      expect(event.errors.full_messages).to include error_message
    end

    it 'когда отсутствует владелец' do
      expect(event.validate).to be_falsey
      error_message = 'Пользователь не может отсутствовать'
      expect(event.errors.full_messages).to include error_message
    end
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:items).dependent(:destroy) }
end
