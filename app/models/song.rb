class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :release_year}
    validates :released , inclusion: {in: [true,false], message: "Released need to be true or false"}

    with_options if: :released? do |song|
        song.validates :release_year, presence: true , numericality: {less_than_or_equal_to: Time.new.year}
    end

    def released? 
        released
    end

end
