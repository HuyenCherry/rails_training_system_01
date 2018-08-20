class UserReport < ApplicationRecord
  belongs_to :user
  belongs_to :user_subject

  validates :title, presence: true

  def get_user
    byebug
    return User.find_by(id: self.user_id).id
  end

  def get_user_subject
    return UserSubject.find_by id: self.user_subject_id
  end

  def get_subject_name
    return Subject.find_by(id: UserSubject
      .find_by(id: self.user_subject_id)).name
  end
end
