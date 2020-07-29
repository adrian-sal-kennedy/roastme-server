# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StatusController, type: :controller do
  context 'routes' do
    it 'should route GET /status to #index' do
      should route(:get, '/status').to(action: :index)
    end

    it 'should route GET /status/user to #user' do
      should route(:get, '/status/user').to(action: :user)
    end
  end
end
