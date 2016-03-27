class Bug < ActiveRecord::Base
  before_create :add_created_dt



  private
    def add_created_dt
      puts "callback"
      self.submitted_dt = DateTime.current()
    end

end
