class Blog < ApplicationRecord

  validates :title, presence: { message: "标题不能为空" }
  validates :content, presence: { message: "内容不能为空" }
  validates :user_id, presence: { message: "用户不能为空" }

  belongs_to :user
  has_many :blogs_tags, class_name: "BlogsTags"
  has_many :tags, through: :blogs_tags

  def tags_string= tags
    tags.split(',').each do |tag|
      one_tag = Tag.find_by(title: tag)
      one_tag = Tag.new(title: tag) unless one_tag
      self.tags << one_tag
    end
  end
  
  
end
