require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'Assosiation' do
    context 'check belongs_to assosiation' do
      it {should belong_to(:project)}
    end
  end
end
