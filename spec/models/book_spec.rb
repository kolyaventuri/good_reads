require 'rails_helper'

describe Book, type: :model do
  describe 'valiations' do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'relationships' do
    it { is_expected.to have_many(:reviews) }
  end
end
