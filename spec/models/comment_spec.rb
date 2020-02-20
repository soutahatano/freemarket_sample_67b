require 'rails_helper'
describe Comment do
  describe '#create' do
    context 'can save' do
      it 'is valid with all calums exist' do
        comment = build(:comment)
      expect(comment).to be_valid
    end
  end
  context 'can not save' do
    it "is invalid without  text" do
      comment = build(:comment, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include("を入力してください")
    end
    it "is invalid without user_id" do
      comment = build(:comment, user_id: nil)
      comment.valid?
      expect(comment.errors[:user_id]).to include("を入力してください")
    end
    it "is invalid without item_id" do
      comment = build(:comment, item_id: nil)
      comment.valid?
      expect(comment.errors[:item_id]).to include("を入力してください")
      end
    end
  end
end

