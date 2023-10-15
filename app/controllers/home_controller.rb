class HomeController < ApplicationController
  def index
    ocm = OpenChargeMap.new
    data = ocm.get_data

    @locations = []
    data.each do |ocm|
      @locations << [ocm["AddressInfo"]["Latitude"], ocm["AddressInfo"]["Longitude"]]
    end
  end
end
