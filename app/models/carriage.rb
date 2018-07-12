class Carriage < ActiveRecord::Base
  TYPES = %w(CoupeCarriage SvCarriage EconomyCarriage SeatCarriage)

    belongs_to :train
    validates :number, :train, :top_seats, :bottom_seats, presence: true
    validates :number, uniqueness: { scope: :train_id }

    before_validation :add_number

    def add_number
      self.number ||= self.max_number + 1
    end

    def max_number
      train.carriages.pluck(:number).max || 0
    end

  scope :economy, -> {where(type: 'EconomyCarriage')}
  scope :coupe, -> {where(type: 'CoupeCarriage')}
  scope :ordered, -> { order(:number)}
  
end