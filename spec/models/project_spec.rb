require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'Assosiation' do
    it 'has many tasks' do
      relation = described_class.reflect_on_association(:tasks)
      expect(relation.macro).to eq :has_many
    end
    it { should belong_to(:user)}
  end
end
