require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(2) }
  it { is_expected.to validate_length_of(:name).is_at_most(16) }
  it { is_expected.to belong_to(:role) }
  it { is_expected.to have_many(:events).dependent(:destroy) }

end