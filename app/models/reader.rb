class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions

    def subscribe(magazine, price)
        Subscription.create(magazine_id: magazine.id, reader_id: self.id, price:price)
    end

    def total_subscription_price
        self.subscriptions.sum(:price)
    end

    def cancel_subscription(magazine)
        self.subscriptions.find_by(magazine_id: magazine.id).destroy
    end
end