class ApartmentRepresenter
  def initialize(apartment)
    @apartment = apartment
  end

    def as_json
      @house_price = apartment.rental ? Rental.where(apartment_id: apartment.id) : Market.where(apartment_id: apartment.id)
        {
          id: apartment.id,
          name: apartment.name,
          images: apartment_images(apartment),
          description: apartment.description,
          location: apartment.location,
          price: @house_price.first.price
        }
    end

  private

  attr_reader :apartment

  def apartment_images(apartment)
      {
        front: apartment.image1,
        interior: apartment.image2,
        back: apartment.image3
      }
    end
end
