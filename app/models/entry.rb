class Entry < ActiveRecord::Base
  has_many :comments	
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 140 }

#  def feedcom
#  	Comment.where("entry_id= ?",id)
#  end

end
