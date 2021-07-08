class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions

    def email_list
        self.readers.map{|e| e.email}.join(';')
    end

    def self.most_popular
        self.all.max_by{|mag| mag.subscriptions.count}
    end
end