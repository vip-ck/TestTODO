RSpec.describe ApplicationHelper, type: :helper do
  it :current_date do
    expect(helper.current_date).to eq Date.current.to_s
  end
end
