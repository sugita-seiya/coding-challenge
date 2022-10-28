require 'rails_helper'

RSpec.describe ElectricPowerProvider, type: :model do
  describe "有効" do
    context "電力会社名が存在していて、重複しない場合" do
      it '登録できること' do
        provider = build(:provider)

        expect(provider).to be_valid
      end
    end
  end

  describe "無効" do
    describe "名前" do
      context "存在しない場合" do
        it '無効であること' do
          provider = build(:provider, name: nil)

          expect(provider.valid?).to be_falsey
        end
      end

      context "重複する場合" do
        it '無効であること' do
          create(:provider)
          provider = build(:provider)

          expect(provider.valid?).to be_falsey
        end
      end
    end
  end
end
