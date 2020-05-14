class Book < ApplicationRecord
	belongs_to :user, optional: true
	def user
    #インスタンスメソッドないで、selfはインスタンス自身を表す
    return User.find_by(id: self.user_id)
    end
validates :title, presence: true
validates :body, presence: true, length: {maximum: 200}
end
