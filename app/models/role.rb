class Role < ActiveRecord::Base
    has_many :auditions

    # def auditions
    #     Audition.all.filter {|audition| audition[:role_id]=="#{self.id}"}
    # end

    def actors
        self.auditions.map {|hash| hash[:actor]}
    end

    def lead
        if self.auditions.find {|audition| audition[:hired]==true}
            self.auditions.find {|audition| audition[:hired]==true}
        else
            'no actor has been hired for this role'
        end
    end

    def understudy 
        if self.auditions.filter {|audition| audition[:hired]==true}[1]
            self.auditions.filter {|audition| audition[:hired]==true}[1]
        else
            'no actor has been hired for this role'
        end
    end
end