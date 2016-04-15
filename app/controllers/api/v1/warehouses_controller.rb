# warehouse stocks supply_in_warehouse
class Api::V1::WarehousesController < ApplicationController
  include CRUD
  resource_name 'warehouse'
  permitted_attributes [:name, :capacity, address_attributes: [:id, :street, :street_number, :additional_information, :zipcode, :town, :state, :country]]

  def add_supply
      supply_in_warehouse = SupplyInWarehouse.create attributes_supply_in_warehouse
      if supply_in_warehouse.valid?
        redirect_to controller: :supplies_in_warehouse, action: :show, id: supply_in_warehouse.id
      else 
        render json: supply_in_warehouse.errors.messages
      end
  end

  def remove_supply
    supply_in_warehouse = SupplyInWarehouse.where(warehouse_id: params[:id], id: params[:supply_in_warehouse_id]).first
    if supply_in_warehouse
      supply_in_warehouse.destroy
      head 204
    else
      head 404
    end
  end

  private
  def attributes_for_supply_in_warehouse
    params.require(:supply).permit(:id, :location_id, :unit_price, :quantity, :date)
  end

  def attributes_supply_in_warehouse
    supply_params = attributes_for_supply_in_warehouse
    supply = Supply.find_by_id supply_params[:id]
    supply && build_supply_in_warehouse(supply, supply_params)
  end

  def build_supply_in_warehouse(supply, supply_params)
    {
      article_id: supply[:article_id],
      supply_id: supply[:id],
      location_id: supply_params[:location_id],
      bought_price_unit: supply_params[:unit_price] || supply[:price],
      quantity: supply_params[:quantity] || 1,
      bought_date: supply_params[:date] || Date.today,
      warehouse_id: params[:id]
    }
  end
end
