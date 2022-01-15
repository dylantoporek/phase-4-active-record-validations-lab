class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    validate :title_check

    def title_check
        unless "#{title}".include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, "Not clickbaity enough!")
        end
    end
end
