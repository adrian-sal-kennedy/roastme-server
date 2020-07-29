# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FavouriteController, type: :controller do
  context 'routes' do
    it 'should route GET /favourite/:id to #favourite' do
      should route(:get, '/favourite/1').to(action: :favourite, id: 1)
    end

    it 'should route DELETE /favourite/:id to #unfavourite' do
      should route(:delete, '/favourite/1').to(action: :unfavourite, id: 1)
    end

    it 'should route GET /favourite to #list' do
      should route(:get, '/favourite').to(action: :list)
    end

    it 'should route GET /favourited/:id to #favourite?' do
      should route(:get, '/favourited/1').to(action: :favourite?, id: 1)
    end
  end
end
