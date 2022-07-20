class Post < ApplicationRecord
    validates :title, presence: true
    validates(:content, { :length => { :minimum => 250 } } )
    validates :summary, length: { maximum: 250 }
    validates_inclusion_of :category, :in => ["Fiction", "Non-Fiction"]
    
    validate :allowed_value?

    WORDS_ALLOWED = [ /Won't Believe/, /Secret/, /Top [number]/, /Guess/]
    
    def allowed_value?
        if WORDS_ALLOWED.none? { |word| word.match title }
            errors.add(:title, "not clickbait-y enough!!")
        end
    end
end
