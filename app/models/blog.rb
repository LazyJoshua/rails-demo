class Blog < ApplicationRecord

  validates :title, presence: { message: "标题不能为空" }
  validates :content, presence: { message: "内容不能为空" }
  validates :user_id, presence: { message: "用户不能为空" }

  belongs_to :user
  has_and_belongs_to_many :tags
end
