# frozen_string_literal: true

RSpec.shared_context 'mock_view_context' do
  let(:view_context) do
    view_context = double('view_context')
    allow(view_context).to receive(:controller).and_return(controller)
    allow(view_context).to receive(:current_user).and_return(user)
    allow(view_context).to receive(:user_signed_in?).and_return(user_signed_in)
    view_context
  end
  let(:controller) do
    controller = double('controller')
    allow(controller).to receive(:controller_name).and_return('controller_name')
    allow(controller).to receive(:action_name).and_return('action_name')
    controller
  end
  let(:user) { create(:user) }
  let(:user_signed_in) { false }
end
