# warehouse stocks supply_in_warehouse
class Api::V1::WarehousesController < Api::V1::ApplicationController
  include CRUD
  resource_name 'warehouse'
  permitted_attributes [:name, :capacity, address_attributes: [:id, :street, :street_number, :additional_information, :zipcode, :town, :state, :country]]

  def add_supply
    supply_in_warehouse = SupplyInWarehouse.create (attributes_for_supply_in_warehouse).merge({warehouse_id: params[:id]})
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
    params.require(:supply_in_warehouse).permit(:supply_id, :location_id, :bought_price_unit, :quantity, :bought_date)
  end
end
