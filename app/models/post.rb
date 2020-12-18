class Post < ActiveRecord::Base
    validates :title, presence: true 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbaity 

    def clickbaity
        array = ["Won't Believe", "Secret" , "Top[number]", "Guess"]
        if self.title 
            unless array.any? {|word| self.title.include? word}
                errors.add(:title, "title is not clickbaity")
            end 
        end 
    end
end
