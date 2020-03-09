class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: {scope: :release_year}
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validate :if_released_check_year

  def if_released_check_year
    if released
      if !release_year
        errors.add(:title, "Year must not be blank")
      elsif release_year >= Date.today.year
        errors.add(:title, "Year must be valid")
      end
    end
  end
end
