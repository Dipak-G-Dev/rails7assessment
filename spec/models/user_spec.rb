require 'rails_helper'

RSpec.describe User, type: :model do
  context 'check has many assosiations' do
    %i[projects tasks owned_task assigned_task].each do |models|
      it 'has many #{models}' do
        relation = described_class.reflect_on_association(models)
        expect(relation.macro).to eq :has_many
      end
    end
  end
end
