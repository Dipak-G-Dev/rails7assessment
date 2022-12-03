require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Assosiation' do
    context 'check belongs_to assosiation' do
      it {should belong_to(:task)}
    end
  end
end
